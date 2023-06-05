import 'package:languagex/core/models/model_dropdown.dart';

import '../resources/_r.dart';

class ConstantSort {
  static ConstantSort? _instance;
  static ConstantSort getInstance() => _instance ??= ConstantSort();
  static void refresh() => _instance = null;

  final ModelDropdown createdNewest = ModelDropdown(id: 1, title: R.string.createdNewest);
  final ModelDropdown createdOldest = ModelDropdown(id: 2, title: R.string.createdOldest);
  final ModelDropdown clientAZ = ModelDropdown(id: 3, title: R.string.clientAZ);
  final ModelDropdown clientZA = ModelDropdown(id: 4, title: R.string.clientZA);
  final ModelDropdown expenseFormHighestFirst = ModelDropdown(id: 5, title: R.string.expenseFormHighestFirst);
  final ModelDropdown expenseFormLowestFirst = ModelDropdown(id: 6, title: R.string.expenseFormLowestFirst);

  final List<ModelDropdown> _sortList = [];

  ConstantSort() {
    _sortList.addAll([
      createdNewest,
      createdOldest,
      clientAZ,
      clientZA,
      expenseFormHighestFirst,
      expenseFormLowestFirst,
    ]);
  }

  List<ModelDropdown> get sortList => _sortList;
}
