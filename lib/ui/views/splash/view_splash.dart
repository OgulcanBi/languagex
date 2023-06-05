import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:languagex/core/models/model_alert_dialog.dart';
import 'package:languagex/core/services/router.gr.dart';
import 'package:languagex/core/services/service_device_info.dart';
import 'package:languagex/core/services/service_firebase.dart';
import 'package:languagex/core/utils/utilities.dart';

import '/ui/animations/splash_transition.dart';
import '../../../core/resources/_r.dart';
import '../../../core/utils/general_data.dart';
import '../../base/base_view.dart';
import 'vm_splash.dart';

class ViewSplash extends StatelessWidget with BaseView {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    di<ServiceDeviceInfo>(context);
    return WidgetBase<ViewModelSplash>(
        isActiveLoadingIndicator: true,
        statusbarBrightness: router(context).uiBrightnessStyle.light(systemNavigationBarColor: R.color.primary),
        model: ViewModelSplash(apiService(context)),
        builder: (context, viewModel) {
          initListener(context, viewModel);
          return Scaffold(
            backgroundColor: R.color.primary,
            body: _getBody(context, viewModel),
          );
        });
  }

  Widget _getBody(BuildContext context, ViewModelSplash viewModel) {
    return Container(
      color: R.color.primary,
      child: TransitionSplash(
        child: FadeInLeft(
          child: SvgPicture.asset(
            R.drawable.svg.logo,
            colorFilter: ColorFilter.mode(
              R.color.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        onFinish: () async {
          // var serviceFirebase = di<ServiceFirebase>(context);
          // var serviceDeviceInfo = di<ServiceDeviceInfo>(context);
          // var version = await serviceFirebase.getVersionCode();
          // var isUpdateRequired = await serviceFirebase.getIsUpdateRequired();
          // if (serviceDeviceInfo.buildNumber < version) {
          //   if (isUpdateRequired) {
          //     if (context.mounted) {
          //       Utilities.alerts.showPlatformAlert(
          //         context,
          //         ModelAlertDialog(
          //           description: R.string.pleaseUpdateApp,
          //           isDismissible: false,
          //           onPressedButton: () {
          //             Utilities.openStore();
          //             exit(0);
          //           },
          //         ),
          //       );
          //       return;
          //     }
          //   } else {
          //     if (context.mounted) {
          //       Utilities.alerts.showToast(R.string.versionCheckMessage((version - serviceDeviceInfo.buildNumber).toString()));
          //     }
          //   }
          // }

          router(context).startNewView(route: const ViewHomeRoute(), isReplace: true, clearStack: true);
        },
      ),
    );
  }
}
