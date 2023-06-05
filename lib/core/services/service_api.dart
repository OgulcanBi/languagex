import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:retrofit/retrofit.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/models/model_active_period.dart';
import 'package:languagex/core/models/model_change_password.dart';
import 'package:languagex/core/models/model_check_timesheet.dart';
import 'package:languagex/core/models/model_create_expense.dart';
import 'package:languagex/core/models/model_create_expense_form.dart';
import 'package:languagex/core/models/model_expense_form.dart';
import 'package:languagex/core/models/model_expense_request.dart';
import 'package:languagex/core/models/model_finance_report_filter.dart';
import 'package:languagex/core/models/model_forecast_approval.dart';
import 'package:languagex/core/models/model_forecast_approve_or_rejecect.dart';
import 'package:languagex/core/models/model_forecast_approvement_with_definition_list.dart';
import 'package:languagex/core/models/model_forgot_password.dart';
import 'package:languagex/core/models/model_holiday.dart';
import 'package:languagex/core/models/model_id.dart';
import 'package:languagex/core/models/model_last_time_sheet_period.dart';
import 'package:languagex/core/models/model_login_response.dart';
import 'package:languagex/core/models/model_module_permission.dart';
import 'package:languagex/core/models/model_notification.dart';
import 'package:languagex/core/models/model_parameter.dart';
import 'package:languagex/core/models/model_push_token.dart';
import 'package:languagex/core/models/model_refresh_access_token.dart';
import 'package:languagex/core/models/model_user_wbs.dart';
import 'package:languagex/core/models/model_valid_link.dart';
import 'package:languagex/core/models/response_data.dart';
import 'package:languagex/core/models/response_forecast_eac_detail.dart';
import 'package:languagex/core/models/response_int.dart';
import 'package:languagex/core/models/response_string.dart';
import 'package:languagex/core/models/response_valid_link.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/core/settings/controller_language.dart';

import '../models/model_client.dart';
import '../models/model_expense_form_export.dart';
import '../models/model_expense_pdf.dart';
import '../models/model_expense_pdf_id.dart';
import '../models/model_expense_reject_or_confirm.dart';
import '../models/model_expense_report.dart';
import '../models/model_finance_report.dart';
import '../models/model_forecast_eac_detail.dart';
import '../models/model_login.dart';
import '../models/model_mobile_invoice.dart';
import '../models/model_mobile_invoice_graphic_report.dart';
import '../models/model_mobile_invoice_graphic_time_periods.dart';
import '../models/model_ode_years_by_project.dart';
import '../models/model_period.dart';
import '../models/model_send_expense_confirm.dart';
import '../models/model_timesheet.dart';
import '../models/model_timesheet_graphs.dart';
import '../models/model_timesheet_limit.dart';
import '../models/model_timesheet_period_status.dart';
import '../models/model_timesheet_periods.dart';
import '../models/model_update_expense_form.dart';
import '../models/model_user.dart';
import '../models/model_user_paid_time_off_balance.dart';
import '../models/response_graphic_chargeability.dart';
import '../models/response_graphic_time_periods.dart';
import '../models/response_ode_years_by_project.dart';
import '../models/response_user_timesheet_period.dart';

part 'service_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  // @POST('/account/Authentication/Login')
  // Future<ResponseLogin> login(@Body() ModelLogin body);
  //
  // @GET('/employment/Expense/GetUserAssignedWBS')
  // Future<ResponseUserWBS> getUserAssignedWBS();

}

class ServiceApi extends ChangeNotifier {
  late Dio dio;

  late ApiClient _client;

  ApiClient get client => _client;

  final String tagAuthorization = 'Authorization';
  String? accessToken;
  String? refreshToken;

  ServiceApi(this.accessToken, this.refreshToken) {
    createDio();
  }

  void createDio() {
    dio = Dio(BaseOptions(headers: accessToken == null ? {} : {tagAuthorization: 'Bearer $accessToken'}, connectTimeout: const Duration(seconds: 120)));

    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (_) => HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse, onError: onError));
    dio.options.headers.addEntries([const MapEntry('Content-Type', 'application/json')]);
    dio.options.headers.addEntries([MapEntry('TransactionLanguage',LanguageController.currentLocale.languageCode)]);
    _client = ApiClient(dio, baseUrl: FlavorConfig.instance.variables['baseUrl']);
  }

  void setAuthToken(String? accessToken, String? refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    if (accessToken != null) {
      if (dio.options.headers[tagAuthorization] != null) {
        dio.options.headers[tagAuthorization] = 'Bearer $accessToken';
      } else {
        dio.options.headers.addEntries([MapEntry(tagAuthorization, 'Bearer $accessToken')]);
      }
    } else {
      dio.options.headers[tagAuthorization] = null;
    }
  }

  Future<void> onError(DioError e, ErrorInterceptorHandler handler) async {
    e = e.copyWith(message: R.string.genericError);
    return handler.next(e);
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (accessToken != null && options.headers[tagAuthorization] != null && !options.path.contains('RefreshAccessToken')) {
      if (Jwt.isExpired(accessToken!)) {
        if (await refreshAccessToken(accessToken!, refreshToken!)) {
          options.headers[tagAuthorization] = 'Bearer $accessToken';
          return handler.next(options);
        }
        DioError e = DioError(requestOptions: RequestOptions(path: ''), response: Response(requestOptions: RequestOptions(path: '')));
        e = e.copyWith(message: R.string.getErrorMsg(R.string.errorAuthorization));
        e.response!.statusCode = 401;
        return handler.reject(e);
      }
    }
    return handler.next(options);
  }

  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    var isSuccess = (response.data?['IsSucceed']) ?? false;
    if (isSuccess) {
      return handler.next(response);
    } else {
      DioError e = DioError(requestOptions: RequestOptions(path: ''));
      String? errorMessage = (response.data?['ErrorMessage']) ?? null;
      var errCode = (response.data?['ErrorCode']) ?? null;
      e = e.copyWith(
        message: errorMessage.isNullOrEmpty() ? (errCode == null ? R.string.genericError : R.string.getErrorMsg(errCode)) : errorMessage,
      );
      return handler.reject(e);
    }
  }

  Future<bool> refreshAccessToken(String accessToken, String refreshToken) async {
    // bool state = false;
    // this.accessToken = null;
    // this.refreshToken = null;
    // dio.options.headers[tagAuthorization] = null;
    // await client.refreshToken(ModelRefreshAccessToken(refreshToken: refreshToken, accessToken: accessToken)).then(
    //   (response) {
    //     setAuthToken(response.result!.accessToken, response.result!.refreshToken);
    //     state = true;
    //   },
    //   onError: (error) {
    //     state = false;
    //   },
    // );
    return false;
  }
}
