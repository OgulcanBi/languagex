import 'package:hive_flutter/hive_flutter.dart';
import 'package:languagex/core/models/model_login_response.dart';
import 'package:languagex/core/models/model_tab_permission.dart';

import '../enums/enum_app.dart';
import 'utilities.dart';

class GeneralData {
  static GeneralData? _instance;
  static GeneralData getInstance() => _instance ??= GeneralData();

  final String _spDARKMODE = 'dark_mode';
  final String _spLANGUAGE = 'language';
  final String _spFCMTOKEN = 'fcm_token';
  final String _spISCHANGEDFCMTOKEN = 'is_changed_fcm_token';
  final String _spREMEMBERME = 'remember_me';
  final String _spACCESSTOKEN = 'access_token';
  final String _spREFRESHTOKEN = 'refresh_token';
  final String _spUSERDATA = 'user_data';
  final String _spUSERNAME = 'username';

  late Box<dynamic> hive;
  String? notificationId;

  static ModelLoginResponse? _userData;

  static ModelLoginResponse? get getUserData => _userData;

  static void setUserData(ModelLoginResponse? data) => _userData = data;

  static ModelTabPermission? _tabPermission;

  static ModelTabPermission? get tabPermission => _tabPermission;

  static void setTabPermission(ModelTabPermission? data) => _tabPermission = data;

  ThemeApperance getDarkMode() => ThemeApperance.values[Utilities.getUserSp(_spDARKMODE, defaultValue: ThemeApperance.dark.index)];

  void setDarkMode(ThemeApperance value) async => Utilities.setUserSp(_spDARKMODE, value.index);

  AppLanguage getLanguage() => AppLanguage.fromId(Utilities.getUserSp(_spLANGUAGE, defaultValue: AppLanguage.locale.id));

  void setLanguage(AppLanguage value) async => Utilities.setUserSp(_spLANGUAGE, value.id);

  String getFCMToken() => Utilities.getUserSp(_spFCMTOKEN, defaultValue: '');

  void setFCMToken(String value) => Utilities.setUserSp(_spFCMTOKEN, value);

  bool getIsChangedFCMToken() => Utilities.getUserSp(_spISCHANGEDFCMTOKEN, defaultValue: true);

  void setIsChangedFCMToken(bool value) => Utilities.setUserSp(_spISCHANGEDFCMTOKEN, value);

  bool getRememberMe() => Utilities.getUserSp(_spREMEMBERME, defaultValue: true);

  void setRememberMe(bool value) => Utilities.setUserSp(_spREMEMBERME, value);

  String? getAccessToken() => Utilities.getUserSp(_spACCESSTOKEN, defaultValue: null);
  void setAccessToken(String? value) => Utilities.setUserSp(_spACCESSTOKEN, value);

  String? getRefreshToken() => Utilities.getUserSp(_spREFRESHTOKEN, defaultValue: null);
  void setRefreshToken(String? value) => Utilities.setUserSp(_spREFRESHTOKEN, value);
  
  String? getUsername() => Utilities.getUserSp(_spUSERNAME, defaultValue: null);
  void setUsername(String? value) => Utilities.setUserSp(_spUSERNAME, value);
}
