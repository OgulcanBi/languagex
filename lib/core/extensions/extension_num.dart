import 'package:intl/intl.dart';
import 'package:languagex/core/constant/app_config.dart';
import 'package:languagex/core/settings/controller_language.dart';

import '../models/model_expense.dart';

extension ExtensionNum on num? {
  String formatPrice([List<ModelExpense>? expenseList]) {
    if (this != null) {
      var v = AppConfig.currencyFormatter.format(this);
      if (expenseList != null && expenseList.isNotEmpty) {
        v += ' ${expenseList.first.currency}';
      }
      return v;
    } else {
      return '-';
    }
  }

  String formatCurrency({String currencySymbol = '', int decimalDigits = 0}) =>
      NumberFormat.currency(
        locale: LanguageController.currentLocale.toLanguageTag(),
        decimalDigits: decimalDigits,
        name: '',
      ).format(this) +
      currencySymbol;

  String formatThousands({String currencySymbol = ''}) =>
      NumberFormat.currency(
        locale: LanguageController.currentLocale.toLanguageTag(),
        decimalDigits: 0,
        name: '',
      ).format(this) +
      currencySymbol;

}
