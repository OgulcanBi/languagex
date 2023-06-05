import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:languagex/core/constant/app_config.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      log('true');
      return newValue;
    }

    double value = double.parse(newValue.text);
    String newText = AppConfig.currencyFormatter.format(value / 100);

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }
}
