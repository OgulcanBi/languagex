import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:languagex/core/models/model_alert_dialog.dart';
import 'package:languagex/core/utils/utilities.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../core/resources/_r.dart';
import '../../views/home/vm_home.dart';
import '../../widgets/widget_app_bar.dart';
import '../../widgets/widget_scroll.dart';
import 'vm_fragment_home.dart';

class FragmentHome extends StatefulWidget {
  final ViewModelHome viewModelHome;

  const FragmentHome({Key? key, required this.viewModelHome}) : super(key: key);

  @override
  State<FragmentHome> createState() => _FragmentHomeState();
}

class _FragmentHomeState extends State<FragmentHome> with AutomaticKeepAliveClientMixin<FragmentHome>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentHome>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentHome(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              R.color.gray.shade300,
              R.color.gray.shade400,
            ],
          ),
          body: _getBody(context, viewModel),
          appBar: _getAppBar(
            context,
            viewModel,
          ),
        );
      },
    );
  }

  AppBarBasic _getAppBar(BuildContext context, ViewModelFragmentHome viewModel) {
    return AppBarBasic(
      bgColor: R.color.gray.shade700,
      leading: SvgPicture.asset(
        R.drawable.svg.logo,
        height: 20.0,
      ),
      trailing: _getAppBarButton(viewModel, context),
      bottomBorderColor: R.color.primary,
    );
  }

  Widget _getAppBarButton(ViewModelFragmentHome viewModel, BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          onPressed: () {
            Utilities.alerts.showPlatformAlert(
              context,
              ModelAlertDialog(
                description: R.string.confirmLogout,
                isActiveCancelButton: true,
                onPressedButton: () => viewModel.logout(false),
              ),
            );
          },
          icon: Icon(Icons.logout, color: R.color.gray.shade500, size: 21),
          bgColor: R.color.transparent,
        ),
      ],
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentHome viewModel) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        await viewModel.init();
      },
      child: ScrollWithNoGlowWidget(
        child: Container(

          ),
        ),
    );
  }

}
