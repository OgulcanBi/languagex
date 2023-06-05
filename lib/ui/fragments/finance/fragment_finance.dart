import 'package:flutter/material.dart';
import 'package:languagex/core/services/router.gr.dart';
import 'package:languagex/core/utils/general_data.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/fragments/finance/vm_fragment_finance.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../../core/constant/constant_sort.dart';
import '../../../core/enums/enum_app.dart';
import '../../../core/resources/_r.dart';
import '../../bs/bs_dropdown.dart';
import '../../bs/bs_filter_finance.dart';
import '../../widgets/widget_empty_view.dart';
import '../../widgets/widget_filter.dart';
import '../../widgets/widget_finance_list.dart';
import '../../widgets/widget_scroll.dart';

class FragmentFinance extends StatefulWidget {
  const FragmentFinance({Key? key}) : super(key: key);

  @override
  State<FragmentFinance> createState() => _FragmentFinanceState();
}

class _FragmentFinanceState extends State<FragmentFinance> with AutomaticKeepAliveClientMixin<FragmentFinance>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentFinance>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentFinance(
        systemPadding(context).top,
        apiService(context),
      ),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.viewBg,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  List<Widget> headerSliverBuilder(BuildContext context, ViewModelFragmentFinance viewModel) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverSafeArea(
          top: false,
          sliver: SliverAppBar(
            expandedHeight: systemPadding(context).top + 40.0,
            floating: false,
            pinned: true,
            backgroundColor: R.color.viewBg,
            elevation: 0.0,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              background: Container(color: R.color.viewBg),
              titlePadding: const EdgeInsets.symmetric(vertical: 4.0),
              title: Container(
                width: size(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextBasic(
                  text: R.string.projectFinanceTitle,
                  color: R.color.gray.shade900,
                  fontFamily: R.fonts.interSemiBold,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              width: size(context).width,
              color: R.color.viewBg,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextBasic(
                text: R.string.projectFinanceDescription,
                color: R.color.gray.shade600,
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _getBody(BuildContext context, ViewModelFragmentFinance viewModel) {
    return NestedScrollView(
      controller: viewModel.scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => headerSliverBuilder(context, viewModel),
      body: Container(),
    );
  }

}
