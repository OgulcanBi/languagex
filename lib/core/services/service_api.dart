import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/models/Chatgpt_response.dart';
import 'package:languagex/core/models/chatgpt_model.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:retrofit/retrofit.dart';

import '../secrets.dart';
import '../models/model_user_wbs.dart';

part 'service_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/employment/Expense/GetUserAssignedWBS')
  Future<ResponseUserWBS> getUserAssignedWBS();
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
    dio = Dio(BaseOptions(headers: {tagAuthorization: 'Bearer $openAIAPIKey'}, connectTimeout: const Duration(seconds: 120)));

    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (_) => HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse, onError: onError));
    dio.options.headers.addEntries([const MapEntry('Content-Type', 'application/json')]);
    _client = ApiClient(dio, baseUrl: FlavorConfig.instance.variables['baseUrl']);
  }

  void setAuthToken(String? accessToken, String? refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    if (accessToken != null) {
      if (dio.options.headers[tagAuthorization] != null) {
        dio.options.headers[tagAuthorization] = 'Bearer $openAIAPIKey';
      } else {
        dio.options.headers.addEntries([MapEntry(tagAuthorization, 'Bearer $openAIAPIKey')]);
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
          options.headers[tagAuthorization] = 'Bearer $openAIAPIKey';
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
