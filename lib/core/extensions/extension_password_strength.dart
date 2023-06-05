import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import '../enums/enum_app.dart';

extension ExtensionsPasswordStrength on PasswordStrength {
  Color get statusColor {
    switch (this) {
      case PasswordStrength.weak:
        return R.color.error.shade400;
      case PasswordStrength.medium:
        return R.color.warning.shade400;
      case PasswordStrength.strong:
        return R.color.success.shade400;
      default:
        return R.color.warning.shade50;
    }
  }

  String get statusLabel {
    switch (this) {
      case PasswordStrength.weak:
        return R.string.passwordWeak;
      case PasswordStrength.medium:
        return R.string.passwordMedium;
      case PasswordStrength.strong:
        return R.string.passwordStrong;
      default:
        return R.string.passwordWeak;
    }
  }

  Color getHighlightedIndicatorColor(int indicatorLevel) {
    return this == PasswordStrength.strong ||
            (this == PasswordStrength.medium && indicatorLevel < PasswordStrength.strong.index) ||
            (this == PasswordStrength.weak && indicatorLevel < PasswordStrength.medium.index)
        ? statusColor
        : R.color.gray.shade200;
  }

}
