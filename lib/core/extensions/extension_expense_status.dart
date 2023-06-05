import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/resources/_r.dart';

extension ExtensionExpenseStatus on ExpenseFormStatus {
  Color getStatusBgColor() {
    switch (this) {
      case ExpenseFormStatus.draft:
        return R.color.primary.shade50;
      case ExpenseFormStatus.reject:
        return R.color.error.shade50;
      case ExpenseFormStatus.sentForApproval:
        return R.color.warning.shade50;
      case ExpenseFormStatus.approved:
        return R.color.success.shade50;
      default:
        return R.color.primary.shade50;
    }
  }

  Color getStatusTextColor() {
    switch (this) {
      case ExpenseFormStatus.draft:
        return R.color.primary;
      case ExpenseFormStatus.reject:
        return R.color.error.shade700;
      case ExpenseFormStatus.sentForApproval:
        return R.color.warning.shade700;
      case ExpenseFormStatus.approved:
        return R.color.success.shade700;
      default:
        return R.color.primary;
    }
  }
}
