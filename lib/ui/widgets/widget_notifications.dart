import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_date.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_notification.dart';

class NotificationsFormItem extends StatelessWidget {
  final ModelNotification item;

  const NotificationsFormItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NotificationStatus.fromStatus(item.notificationStatus) == NotificationStatus.Read ? R.color.gray.shade50 : R.color.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextBasic(
                  text: item.content.isNullOrEmpty() ? '-' : item.content!.parseHtmlString(),
                  color: R.color.gray.shade900,
                  fontFamily: R.fonts.interMedium,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(width: NotificationStatus.fromStatus(item.notificationStatus) == NotificationStatus.Read ? 0.0 : 48),
              NotificationStatus.fromStatus(item.notificationStatus) == NotificationStatus.Read
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: R.color.success.shade50,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: TextBasic(
                        text: R.string.notificationsUnread,
                        color: R.color.success.shade700,
                        fontFamily: R.fonts.interMedium,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 2),
          TextBasic(
            text: '${item.createDate.dayMonthYear()}, ${item.createDate.hourAndMinute()}',
            color: R.color.gray.shade600,
            fontFamily: R.fonts.interRegular,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
