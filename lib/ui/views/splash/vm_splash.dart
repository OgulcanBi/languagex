import 'dart:developer';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/models/model_refresh_access_token.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/core/utils/general_data.dart';

import '../../../core/models/model_login_response.dart';
import '../../base/base_view_model.dart';

class ViewModelSplash extends ViewModelBase {
  final ServiceApi apiService;

  ModelLoginResponse? userData;

  ViewModelSplash(this.apiService) {
    log(GeneralData.getInstance().getAccessToken().toString(), name: 'Access Token');
    log(GeneralData.getInstance().getRefreshToken().toString(), name: 'Refresh Token');
    if (GeneralData.getInstance().getAccessToken() != null) {
      log(Jwt.getExpiryDate(GeneralData.getInstance().getAccessToken()!)!.toIso8601String(), name: 'Access Token Expire Date');
    }
  }

  Future<ModelLoginResponse?> refreshToken(String accessToken, String refreshToken) async {


}
}
