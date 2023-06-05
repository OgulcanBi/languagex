import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view_model.dart';

class ViewModelFragmentTimesheet extends ViewModelBase {
  final ScrollController scrollController = ScrollController();
  double scrollPadding = 0.0;
  final double topBarSize;

  final List<StatefulWidget> fragments = [

  ];

  ViewModelFragmentTimesheet(this.topBarSize) {
    initListeners();
  }

  void initListeners() {
    var tabBarHeight = const TabBar(tabs: []).preferredSize.height;
    scrollController.addListener(
      () {
        scrollPadding = scrollController.position.pixels > tabBarHeight * 4 + topBarSize ? tabBarHeight : 0.0;
        notifyListeners();
      },
    );
  }
}
