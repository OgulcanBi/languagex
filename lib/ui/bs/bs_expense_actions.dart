import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';

import '../../core/resources/_r.dart';
import '../widgets/widgets_text.dart';

class BottomSheetExpenseActions extends StatefulWidget {
  final Function() onPressedNewExpense;
  final Function() onPressedEdit;
  final Function()? onPressedSendApproval;
  final Function() onPressedRemove;
  final ExpenseFormStatus status;

  const BottomSheetExpenseActions({
    super.key,
    required this.onPressedNewExpense,
    required this.onPressedEdit,
    this.onPressedSendApproval,
    required this.onPressedRemove,
    required this.status,
  });

  @override
  State<BottomSheetExpenseActions> createState() => _BottomSheetExpenseActionsState();
}

class _BottomSheetExpenseActionsState extends State<BottomSheetExpenseActions> with BaseView {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
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
          widget.status == ExpenseFormStatus.draft
              ? ActionButtonBasic(
                  iconPath: R.drawable.svg.iconAddNewExpense,
                  title: R.string.addNewExpense,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onPressedNewExpense();
                  },
                )
              : Container(),
          widget.status == ExpenseFormStatus.draft
              ? ActionButtonBasic(
                  iconPath: R.drawable.svg.iconEditExpenseForm,
                  title: R.string.editExpenseForm,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onPressedEdit();
                  },
                )
              : Container(),
          widget.status == ExpenseFormStatus.draft && widget.onPressedSendApproval != null
              ? ActionButtonBasic(
                  iconPath: R.drawable.svg.iconSendExpenseFormApproval,
                  title: R.string.sentForApproval,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onPressedSendApproval!();
                  },
                )
              : Container(),
          widget.status == ExpenseFormStatus.draft ? ActionButtonBasic(
            iconPath: R.drawable.svg.iconRemoveExpenseForm,
            title: R.string.removeForm,
            textColor: R.color.error,
            onTap: () {
              Navigator.pop(context);
              widget.onPressedRemove();
            },
          ) : Container(),
        ],
      ),
    );
  }
}
