import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/models/model_dropdown.dart';

import '../resources/_r.dart';

class ConstantExpenseStatus {
  static ConstantExpenseStatus? _instance;
  static ConstantExpenseStatus getInstance() => _instance ??= ConstantExpenseStatus();
  static void refresh() => _instance = null;

  final ModelDropdown all = ModelDropdown(id: ExpenseFormStatus.all.status, title: R.string.all);
  final ModelDropdown approved = ModelDropdown(id: ExpenseFormStatus.approved.status, title: R.string.approved);
  final ModelDropdown reject = ModelDropdown(id: ExpenseFormStatus.reject.status, title: R.string.rejected);
  final ModelDropdown sentForApproval = ModelDropdown(id: ExpenseFormStatus.sentForApproval.status, title: R.string.pendingApproval);
  final ModelDropdown draft = ModelDropdown(id: ExpenseFormStatus.draft.status, title: R.string.draft);

  final List<ModelDropdown> _filterList = [];

  ConstantExpenseStatus() {
    _filterList.addAll([
      all,
      approved,
      reject,
      sentForApproval,
      draft,
    ]);
  }

  List<ModelDropdown> get filterList => _filterList;
}
