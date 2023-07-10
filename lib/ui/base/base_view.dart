import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:languagex/core/models/model_alert_dialog.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/core/services/service_route.dart';
import 'package:languagex/core/utils/utilities.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../core/enums/enum_app.dart';
import '../../core/services/service_app.dart';
import '../../core/utils/general_data.dart';
import 'base_view_model.dart';

class WidgetBase<T extends ViewModelBase> extends StatelessWidget with BaseView {
  final Widget Function(BuildContext context, T value)? builder;
  final SystemUiOverlayStyle? statusbarBrightness;
  final T model;
  final Widget? child;
  final Widget? errorWidget;
  final bool? isActiveLoadingIndicator;

  const WidgetBase({Key? key, this.builder, required this.model, this.statusbarBrightness, this.child, this.errorWidget, this.isActiveLoadingIndicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    di<ServiceApp>(context, listen: true);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusbarBrightness ?? SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => router(context).hideKeyboard(context),
        child: child ??
            ChangeNotifierProvider<T>(
              create: (context) => model,
              builder: (context, child) => isActiveLoadingIndicator!
                  ? Consumer<T>(
                      builder: (context, viewModel, child) {
                        return Stack(
                          children: [
                            builder!(context, viewModel),
                            viewModel.activityState == ActivityState.isLoading
                                ? Center(
                                    child: LoadingAnimationWidget.twistingDots(
                                    leftDotColor: R.color.bottomNavigatorColor,
                                    rightDotColor: R.color.gray.shade600,
                                    size: 100,
                                  ))
                                : Container(),
                          ],
                        );
                      },
                    )
                  : Consumer<T>(builder: (context, viewModel, child) => builder!(context, viewModel)),
            ),
      ),
    );
  }
}

abstract class BaseView {
  Size size(BuildContext context) => MediaQuery.of(context).size;
  EdgeInsets systemPadding(BuildContext context) => MediaQuery.of(context).padding;
  EdgeInsets viewInsets(BuildContext context) => MediaQuery.of(context).viewInsets;
  bool keyboardVisibility(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 0;

  ServiceRoute router(context, [bool listen = false]) => Provider.of<ServiceRoute>(context, listen: listen);
  ServiceApi apiService(context, [bool listen = false]) => Provider.of<ServiceApi>(context, listen: listen);

  void requestFocus(context, focusNode) => FocusScope.of(context).requestFocus(focusNode);

  T di<T>(BuildContext context, {bool listen = false}) => Provider.of<T>(context, listen: listen);

  void initListener(BuildContext context, ViewModelBase viewModel) {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    if (!viewModel.errorObserver.hasListeners) {
      viewModel.errorObserver.addListener((String? property) {
        if (property == 'message' && viewModel.errorObserver.message.isNotEmpty) {
          Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: viewModel.errorObserver.message));
          viewModel.errorObserver.message = '';
        }
        if (property == 'activityErrorActionState' && viewModel.errorObserver.activityErrorActionState != ActivityErrorActionState.none) {
          if (viewModel.errorObserver.activityErrorActionState == ActivityErrorActionState.gotoLogin) {
            GeneralData.getInstance().setAccessToken(null);
            GeneralData.getInstance().setRefreshToken(null);
            GeneralData.setUserData(null);
            Utilities.alerts.showPlatformAlert(
              context,
              ModelAlertDialog(
                description: R.string.errorAuthorization,
                isDismissible: false,
                onPressedButton: () {
                  // router(context).startNewView(route: const ViewLoginRoute(), isReplace: true, clearStack: true);
                },
              ),
            );
          }
          else if (viewModel.errorObserver.activityErrorActionState == ActivityErrorActionState.logout) {
            GeneralData.getInstance().setAccessToken(null);
            GeneralData.getInstance().setRefreshToken(null);
            GeneralData.setUserData(null);
            // router(context).startNewView(route: const ViewLoginRoute(), isReplace: true, clearStack: true);
          }
          viewModel.errorObserver.activityErrorActionState = ActivityErrorActionState.none;
        }
      }, ['message', 'activityErrorActionState']);
    }
  }
}
