import 'package:flutter/material.dart';
import 'package:languagex/core/models/model_user_wbs.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';

import '../../core/resources/_r.dart';
import '../widgets/widgets_text.dart';

class BottomSheetEditTimesheetActions extends StatefulWidget {
  final Function() onPressedEdit;
  final Function()? onPressedDelete;
  final ModelUserWBS modelUserWBS;

  const BottomSheetEditTimesheetActions({
    super.key,
    required this.onPressedEdit,
    this.onPressedDelete,
    required this.modelUserWBS,
  });

  @override
  State<BottomSheetEditTimesheetActions> createState() => _BottomSheetEditTimesheetActions();
}

class _BottomSheetEditTimesheetActions extends State<BottomSheetEditTimesheetActions> with BaseView {
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
                  text: widget.modelUserWBS.name ?? widget.modelUserWBS.wbs ?? '-',
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
        ActionButtonBasic(
          iconPath: R.drawable.svg.iconEditExpenseForm,
          title: R.string.changeWbs,
          onTap: () {
            Navigator.pop(context);
            widget.onPressedEdit();
          },
        ),
        ActionButtonBasic(
          iconPath: R.drawable.svg.iconRemoveExpenseForm,
          title: R.string.removeWbs,
          onTap: () {
            Navigator.pop(context);
            widget.onPressedDelete!();
          },
        ),
      ],
    );
  }
}
