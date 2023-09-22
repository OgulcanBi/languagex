import 'package:flutter/material.dart';
import 'package:languagex/core/models/model_tab.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/ui/base/base_view_model.dart';
import 'package:languagex/ui/fragments/home/fragment_home.dart';

import '../../../core/resources/_r.dart';
import '../../fragments/speaking/fragment_speaking.dart';
import '../../fragments/test/fragment_quiz.dart';
import '../../fragments/writting/fragment_writting.dart';

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
    fragments.add(const FragmentWriting());
    tabs.add(ModelTab(title: R.string.writing, activeIcon: R.drawable.svg.iconFinanceActive, inActiveIcon: R.drawable.svg.iconFinanceInactive));
    fragments.add(FragmentSpeaking(key: expenseKey));
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
