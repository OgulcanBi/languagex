import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_timesheet_status.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

class TimesheetFormItem extends StatelessWidget {
  final Function(int)? onTapActions;
  final Function(int) onTapItem;
  final TimesheetListItem timesheetListItem;

  const TimesheetFormItem({super.key, this.onTapActions, required this.onTapItem, required this.timesheetListItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItem(timesheetListItem.id),
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
                        text: timesheetListItem.periodTitle,
                        color: R.color.gray.shade600,
                        fontFamily: R.fonts.interRegular,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTapActions == null
                        ? Container()
                        : InkWell(
                            onTap: () => onTapActions!(timesheetListItem.id),
                            borderRadius: BorderRadius.circular(20.0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.more_vert, color: R.color.gray.shade400),
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: TextBasic(
                        color: R.color.price,
                        fontSize: 20,
                        fontFamily: R.fonts.interSemiBold,
                        fontWeight: FontWeight.w600,
                        text: timesheetListItem.formattedDate,
                      ),
                    ),
                    TimesheetFormStatusItem(
                      timesheetStatus: timesheetListItem.timeSheetStatus,
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

class TimesheetFormStatusItem extends StatelessWidget {
  final int timesheetStatus;

  const TimesheetFormStatusItem({super.key, required this.timesheetStatus});

  @override
  Widget build(BuildContext context) {
    var eStatus = TimeSheetStatus.fromStatus(timesheetStatus);

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
            text: eStatus.statusLabel,
            color: eStatus.getStatusTextColor(),
            fontFamily: R.fonts.interMedium,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class TimesheetListItem {
  final String formattedDate;
  final DateTime date;
  final String periodTitle;
  final int id;
  final int timeSheetStatus;

  TimesheetListItem({required this.formattedDate, required this.date, required this.periodTitle, required this.id, required this.timeSheetStatus});
}
