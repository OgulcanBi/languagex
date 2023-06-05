import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/services/router.gr.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widget_tabbar.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../../core/resources/_r.dart';
import '../../../core/utils/general_data.dart';
import '../../widgets/widget_app_bar.dart';
import '../../widgets/widget_empty_view.dart';
import 'vm_fragment_expense.dart';

class FragmentExpense extends StatefulWidget {
  const FragmentExpense({Key? key}) : super(key: key);

  @override
  State<FragmentExpense> createState() => _FragmentExpenseState();
}

class _FragmentExpenseState extends State<FragmentExpense> with AutomaticKeepAliveClientMixin<FragmentExpense>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentExpense>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentExpense(systemPadding(context).top),
      builder: (context, viewModel) => Scaffold(
        backgroundColor: R.color.viewBg,
        body: _getBody(context, viewModel),
      ),
    );
  }

  List<Widget> headerSliverBuilder(BuildContext context, ViewModelFragmentExpense viewModel) {
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
                  text: R.string.expenses,
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
                text: R.string.expenseDesc,
                color: R.color.gray.shade600,
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width: size(context).width,
              color: R.color.viewBg,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 24.0),
              child: ButtonBasic(
                onPressed: () async {


                },
                text: '+ ${R.string.newForm}',
                fontFamily: R.fonts.interSemiBold,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: R.color.viewBg,
            child: TabBarBasic(
              tabs: viewModel.tabs,
            ),
          ),
        ),
      ),
    ];
  }

  Widget _getBody(BuildContext context, ViewModelFragmentExpense viewModel) {
    return Container();
  }
}
