import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_date.dart';
import 'package:languagex/core/extensions/extension_expense_status.dart';
import 'package:languagex/core/extensions/extension_num.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/models/model_expense.dart';
import 'package:languagex/core/models/model_expense_form.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

class ExpenseFormItem extends StatelessWidget {
  final ModelExpenseForm item;
  final Function(int)? onTapActions;
  final Function(int) onTapItem;
  final Future<bool?> Function(DismissDirection)? confirmDelete;
  final bool isApprovePage;
  const ExpenseFormItem({super.key, required this.item, this.onTapActions, required this.onTapItem, required this.confirmDelete, required this.isApprovePage});

  @override
  Widget build(BuildContext context) {
    return item.status != ExpenseFormStatus.draft.status ? _getWidget() : Dismissible(
      key: Key(item.id.toString()),
      background: Container(color: R.color.error),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      secondaryBackground: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: R.color.error,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24.0),
        child: TextBasic(
          text: 'Sil',
          fontFamily: R.fonts.interMedium,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: R.color.white,
          textAlign: TextAlign.end,
        ),
      ),
      confirmDismiss: confirmDelete,
      child: _getWidget(),
    );
  }

  Widget _getWidget() {
    var price = item.totalAmount.formatPrice(item.expenses);
    return GestureDetector(
        onTap: () => onTapItem(item.id),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Card(
            elevation: 1.0,
            shadowColor: R.color.gray.shade100,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextBasic(
                          text: !isApprovePage ? item.clientProjectName ?? '-' : item.username?.emailToUserName() ?? '-',
                          color: R.color.gray.shade900,
                          fontFamily: R.fonts.interMedium,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTapActions == null ? Container() : InkWell(
                        onTap: () => onTapActions!(item.id),
                        borderRadius: BorderRadius.circular(20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.more_vert, color: R.color.gray.shade400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  TextBasic(
                    text: item.formNo ?? '-',
                    color: R.color.gray.shade600,
                    fontFamily: R.fonts.interRegular,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    children: [
                      Expanded(
                        child: RichTextBasic(
                          textAlign: TextAlign.start,
                          texts: price.highlightOccurrences(
                            price.split(',').first,
                            boldTextColor: R.color.price,
                            textColor: R.color.price,
                            fontSize: 18.0,
                            boldFontSize: 24.0,
                            font: R.fonts.interSemiBold,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      item.status == null
                          ? Container()
                          : ExpenseFormStatusItem(
                              status: item.status!,
                              statusText: item.statusText ?? '-',
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class ExpenseFormStatusItem extends StatelessWidget {
  final int status;
  final String statusText;
  final double? fontSize;
  const ExpenseFormStatusItem({super.key, required this.status, required this.statusText, this.fontSize});

  @override
  Widget build(BuildContext context) {
    var eStatus = ExpenseFormStatus.fromStatus(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: eStatus.getStatusBgColor(),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: eStatus.getStatusTextColor(),
            ),
          ),
          const SizedBox(width: 8.0),
          TextBasic(
            text: statusText,
            color: eStatus.getStatusTextColor(),
            fontFamily: R.fonts.interMedium,
            fontSize: fontSize ?? 14.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final ModelExpense item;
  final Function(int) onPressedItem;
  final bool isActiveDivider;
  final Future<bool?> Function(DismissDirection)? confirmDelete;
  final int? status;
  const ExpenseItem({super.key, required this.item, required this.onPressedItem, this.isActiveDivider = true, required this.confirmDelete, this.status});

  @override
  Widget build(BuildContext context) {
    return status != ExpenseFormStatus.draft.status ? _getWidget() : Dismissible(
      key: Key(item.id.toString()),
      background: Container(color: R.color.error),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        color: R.color.error,
        padding: const EdgeInsets.only(right: 24.0),
        child: TextBasic(
          text: R.string.delete,
          fontFamily: R.fonts.interMedium,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: R.color.white,
          textAlign: TextAlign.end,
        ),
      ),
      confirmDismiss: confirmDelete,
      child: _getWidget(),
    );
  }

  Widget _getWidget() {
    return Center(
        child: InkWell(
          onTap: () => onPressedItem(item.id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              border: isActiveDivider ? null : Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade100)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBasic(
                        text: item.corporation ?? '-',
                        color: R.color.gray.shade900,
                        fontFamily: R.fonts.interMedium,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 4.0),
                      TextBasic(
                        text: item.receiptDate == null ? '-' : item.receiptDate!.dayMonthYear(),
                        color: R.color.gray.shade600,
                        fontFamily: R.fonts.interRegular,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextBasic(
                      text: '${item.amount.formatPrice()} ${item.currency ?? ''}',
                      color: R.color.gray.shade900,
                      fontFamily: R.fonts.interMedium,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4.0),
                    TextBasic(
                      text: item.categoryText ?? '-',
                      color: R.color.gray.shade600,
                      fontFamily: R.fonts.interRegular,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
