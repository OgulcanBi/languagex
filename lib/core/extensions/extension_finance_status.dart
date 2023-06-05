import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/resources/_r.dart';

extension ExtensionForecastStatus on ForecastStatus {
  Color get statusBgColor {
    switch (this) {
      case ForecastStatus.waitingForApprove:
        return R.color.warning.shade50;
      case ForecastStatus.fCWaitingForApprove:
        return R.color.warning.shade50;
      case ForecastStatus.fCDeclined:
        return R.color.error.shade50;
      case ForecastStatus.declined:
        return R.color.error.shade50;
      case ForecastStatus.approved:
        return R.color.success.shade50;
      default:
        return R.color.primary.shade50;
    }
  }

  Color get statusTextColor {
    switch (this) {
      case ForecastStatus.waitingForApprove:
        return R.color.warning.shade700;
      case ForecastStatus.fCWaitingForApprove:
        return R.color.warning.shade700;
      case ForecastStatus.fCDeclined:
        return R.color.error.shade700;
      case ForecastStatus.declined:
        return R.color.error.shade700;
      case ForecastStatus.approved:
        return R.color.success.shade700;
      default:
        return R.color.primary;
    }
  }
}
