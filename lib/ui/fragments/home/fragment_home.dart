import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_int.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/models/model_alert_dialog.dart';
import 'package:languagex/core/services/router.gr.dart';
import 'package:languagex/core/utils/general_data.dart';
import 'package:languagex/core/utils/utilities.dart';
import 'package:flutter_svg/svg.dart';

import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widget_donut_chart.dart';
import 'package:languagex/ui/widgets/widgets_chargeability_graph.dart';
import 'package:languagex/ui/widgets/widgets_remaining_timesheet_indicator.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../../core/models/model_chargeability_graph_item.dart';
import '../../../core/resources/_r.dart';
import '../../bs/bs_filter_timesheet_graph.dart';
import '../../bs/bs_multi_wbs_selection.dart';
import '../../views/home/vm_home.dart';
import '../../widgets/widget_app_bar.dart';
import '../../widgets/widget_bar_chart.dart';
import '../../widgets/widget_filter_graph.dart';
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
        return Scaffold(
          backgroundColor: R.color.viewBg,
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
