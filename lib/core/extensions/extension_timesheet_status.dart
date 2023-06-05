import 'dart:ui';

import '../enums/enum_app.dart';
import '../resources/_r.dart';

extension ExtensionsPasswordStrength on TimeSheetStatus {
  String get statusLabel {
    switch (this) {
      case TimeSheetStatus.adjusted:
        return R.string.adjusted;
      case TimeSheetStatus.draft:
        return R.string.draft;
      case TimeSheetStatus.processed:
        return R.string.processed;
      case TimeSheetStatus.submitted:
        return R.string.submitted;
      case TimeSheetStatus.updated:
        return R.string.updated;
      default:
        return R.string.draft;
    }
  }

  Color getStatusBgColor() {
    switch (this) {
      case TimeSheetStatus.draft:
        return R.color.primary.shade50;
      default:
        return R.color.success.shade50;
    }
  }

  Color getStatusTextColor() {
    switch (this) {
      case TimeSheetStatus.draft:
        return R.color.primary;
      default:
        return R.color.success.shade700;
    }
  }
}
