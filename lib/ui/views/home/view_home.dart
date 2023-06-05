import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:languagex/core/models/model_tab.dart';
import 'package:languagex/core/services/service_device_info.dart';
import 'package:languagex/core/services/service_firebase.dart';
import 'package:languagex/core/utils/general_data.dart';
import '../../../core/services/router.gr.dart';
import 'vm_home.dart';
import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> with BaseView {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (GeneralData.getInstance().notificationId != null) {
        router(context).startNewView(route: ViewCreateExpenseFormRoute());
        GeneralData.getInstance().notificationId = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelHome>(
      isActiveLoadingIndicator: true,
      statusbarBrightness: router(context).uiBrightnessStyle.dark(systemNavigationBarColor: R.color.white),
      model: ViewModelHome(apiService(context), di<ServiceDeviceInfo>(context).deviceId),
      // model: ViewModelHome(apiService(context), di<ServiceDeviceInfo>(context).deviceId, di<ServiceFirebase>(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
          bottomNavigationBar: _getBottomNavigationBar(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelHome viewModel) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      children: viewModel.fragments,
    );
  }

  Widget _getBottomNavigationBar(BuildContext context, ViewModelHome viewModel) {
    return viewModel.tabs.length == 1
        ? Container()
        : Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(color: R.color.borderBottomNav, width: 1.0))),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: R.color.white,
              currentIndex: viewModel.selectedPageIndex,
              onTap: viewModel.setSelectedPageIndex,
              selectedLabelStyle: TextStyle(fontSize: 10.0, fontFamily: R.fonts.interSemiBold, color: R.color.primary, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontSize: 10.0, fontFamily: R.fonts.interMedium, color: R.color.gray.shade400, fontWeight: FontWeight.w500),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: R.color.primary,
              unselectedItemColor: R.color.gray,
              items: List.generate(viewModel.tabs.length, (index) {
                var item = viewModel.tabs[index];
                return _getBottomNavigationBarItem(context, viewModel, item);
              }),
            ),
          );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(context, viewModel, ModelTab item) {
    return BottomNavigationBarItem(
      label: item.title,
      icon: SvgPicture.asset(item.inActiveIcon),
      activeIcon: SvgPicture.asset(item.activeIcon),
    );
  }
}
