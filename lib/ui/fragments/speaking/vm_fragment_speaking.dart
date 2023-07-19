import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_list.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/resources/_r.dart';

class ViewModelFragmentSpeaking extends ViewModelBase {
  final ScrollController scrollController = ScrollController();
  double scrollPadding = 0.0;
  final double topBarSize;
  final TextEditingController descriptionController = TextEditingController();


  final List<Tab> tabs = [];
  bool hasApprovePermission = false;

  ViewModelFragmentSpeaking(this.topBarSize) {
    initListeners();
  }



  void initListeners() {
    var tabBarHeight = const TabBar(tabs: []).preferredSize.height;
    scrollController.addListener(() {
      scrollPadding = scrollController.position.pixels > tabBarHeight * 4 + topBarSize ? tabBarHeight : 0.0;
      notifyListeners();
    });
  }



}
