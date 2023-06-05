import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';

import '../../core/resources/_r.dart';
import '../widgets/widgets_text.dart';

class BottomSheetTimesheetActions extends StatefulWidget {
  final Function() onPressedEdit;
  final Function()? onPressedSend;
  final TimeSheetStatus status;

  const BottomSheetTimesheetActions({
    super.key,
    required this.onPressedEdit,
    this.onPressedSend,
    required this.status,
  });

  @override
  State<BottomSheetTimesheetActions> createState() => _BottomSheetExpenseActionsState();
}

class _BottomSheetExpenseActionsState extends State<BottomSheetTimesheetActions> with BaseView {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: size(context).width,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200))),
          padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.clear, color: R.color.transparent),
              Expanded(
                child: TextBasic(
                  text: R.string.moreActions,
                  color: R.color.black,
                  fontFamily: R.fonts.interSemiBold,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.clear, color: R.color.gray.shade500),
              ),
            ],
          ),
        ),
        widget.status == TimeSheetStatus.draft
            ? ActionButtonBasic(
                iconPath: R.drawable.svg.iconEditExpenseForm,
                title: R.string.editTimeSheet,
                onTap: () {
                  Navigator.pop(context);
                  widget.onPressedEdit();
                },
              )
            : Container(),
            widget.onPressedSend != null
            ? ActionButtonBasic(
                iconPath: R.drawable.svg.iconSendExpenseFormApproval,
                title: R.string.sendTheTimeSheet,
                onTap: () {
                  Navigator.pop(context);
                  widget.onPressedSend!();
                },
              ): Container(),
      ],
    );
  }
}
