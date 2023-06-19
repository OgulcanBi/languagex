import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view.dart';

import '../../../core/resources/_r.dart';
import 'vm_fragment_timesheet.dart';

class FragmentTimesheet extends StatefulWidget {
  const FragmentTimesheet({Key? key}) : super(key: key);

  @override
  State<FragmentTimesheet> createState() => _FragmentTimesheetState();
}

class _FragmentTimesheetState extends State<FragmentTimesheet> with AutomaticKeepAliveClientMixin<FragmentTimesheet>, BaseView {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentTimesheet>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentTimesheet(
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


  Widget _getBody(BuildContext context, ViewModelFragmentTimesheet viewModel) {
    return Container(
    );
  }
}
