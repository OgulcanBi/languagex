import 'package:intl/intl.dart';
import 'package:languagex/core/enums/enum_app.dart';

import '../settings/controller_language.dart';

class AppConfig {
  static final currencyFormatter = NumberFormat.currency(locale: LanguageController.currentLocale.toLanguageTag(), symbol: '');
  static const defualtCurrencyType = CurrencyType.tl;
  static const timesheetDailyHours = 8;
  static const timesheetTopMinute = 480;
  static const PASSWORD_MAX_COUNT = 15;

  static const appStoreId = '';
  static const playStoreId = '';
  
  
  //Remote config keys
  static const keyAndroidVersionCode = 'androidVersionCode';
  static const keyAndroidIsUpdateRequired = 'androidIsUpdateRequired';
  
  static const keyIOSVersionCode = 'iosVersionCode';
  static const keyIOSIsUpdateRequired = 'iosIsUpdateRequired';
}