import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_finance_status.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_forecast_approvement_with_definition_list.dart';

class FinanceFormItem extends StatelessWidget {
  final Function(ModelForecastApprovementWithDefinition) onTapItem;
  final ModelForecastApprovementWithDefinition financeListItem;

  const FinanceFormItem(
      {super.key,
      required this.onTapItem,
      required this.financeListItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItem(financeListItem),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Card(
          elevation: 1.0,
          shadowColor: R.color.gray.shade100,
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextBasic(
                        color: R.color.gray.shade900,
                        fontSize: 16,
                        fontFamily: R.fonts.interMedium,
                        fontWeight: FontWeight.w500,
                        text: financeListItem.clientName,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                TextBasic(
                  text: financeListItem.projectName,
                  color: R.color.gray.shade600,
                  fontFamily: R.fonts.interRegular,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                TextBasic(
                  text: financeListItem.wBS,
                  color: R.color.gray.shade600,
                  fontFamily: R.fonts.interRegular,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextBasic(
                      text: R.string.forecastOwnerTitle,
                      color: R.color.gray.shade900,
                      fontFamily: R.fonts.interMedium,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 4),
                    TextBasic(
                      text: financeListItem.senderEnterpriseName,
                      color: R.color.gray.shade600,
                      fontFamily: R.fonts.interRegular,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                FinanceFormStatusItem(
                  status: financeListItem.status,
                  statusText: financeListItem.statusText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FinanceFormStatusItem extends StatelessWidget {
  final int status;
  final String statusText;
  final double? fontSize;

  const FinanceFormStatusItem(
      {super.key,
      required this.status,
      required this.statusText,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    var eStatus = ForecastStatus.fromStatus(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: eStatus.statusBgColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: eStatus.statusTextColor,
            ),
          ),
          const SizedBox(width: 8.0),
          TextBasic(
            text: statusText,
            color: eStatus.statusTextColor,
            fontFamily: R.fonts.interMedium,
            fontSize: fontSize ?? 14.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
