import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/enums/enum_permission.dart';
import 'package:languagex/core/extensions/extension_list.dart';
import 'package:languagex/core/models/model_push_token.dart';
import 'package:languagex/core/models/model_tab.dart';
import 'package:languagex/core/models/model_tab_permission.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/core/services/service_firebase.dart';
import 'package:languagex/core/utils/general_data.dart';
import 'package:languagex/ui/base/base_view_model.dart';
import 'package:languagex/ui/fragments/expense/fragment_expense.dart';
import 'package:languagex/ui/fragments/finance/fragment_finance.dart';
import 'package:languagex/ui/fragments/home/fragment_home.dart';
import 'package:languagex/ui/fragments/timesheet/fragment_timesheet.dart';

import '../../../core/resources/_r.dart';

class ViewModelHome extends ViewModelBase {
  final ServiceApi serviceApi;
  final String deviceId;

  final PageController pageController = PageController(keepPage: true);
  List<ModelTab> tabs = [];
  List<Widget> fragments = [];
  int selectedPageIndex = 0;
  Key expenseKey = const Key('Expense');

  ViewModelHome(this.serviceApi, this.deviceId) {
    tabs.addAll([
      ModelTab(title: R.string.home, activeIcon: R.drawable.svg.iconHomeActive, inActiveIcon: R.drawable.svg.iconHomeInactive),
    ]);
    fragments = [FragmentHome(viewModelHome: this)];
    init();

    // serviceFirebase.setUserId(GeneralData.getUserData!.id.toString());
  }

  init() {
      fragments.add(const FragmentFinance());
      tabs.add(ModelTab(title: R.string.writing, activeIcon: R.drawable.svg.iconFinanceActive, inActiveIcon: R.drawable.svg.iconFinanceInactive));
      fragments.add(FragmentExpense(key: expenseKey));
      tabs.add(ModelTab(title: R.string.speaking, activeIcon: R.drawable.svg.iconExpenseActive, inActiveIcon: R.drawable.svg.iconExpenseInactive));
      fragments.add(const FragmentTimesheet());
      tabs.add(ModelTab(title: R.string.test, activeIcon: R.drawable.svg.iconTimesheetActive, inActiveIcon: R.drawable.svg.iconTimesheetInactive));

  }

  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    pageController.jumpToPage(selectedPageIndex);
    notifyListeners();
  }





}
