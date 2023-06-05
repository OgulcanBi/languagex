import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';

import '../../core/resources/_r.dart';
import '../widgets/widgets_text.dart';

class BottomSheetExpenseFriendlyReminder extends StatefulWidget {
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final Function() onConfirm;

  const BottomSheetExpenseFriendlyReminder({super.key, required this.title, required this.description, required this.confirmText, required this.cancelText, required this.onConfirm});

  @override
  State<BottomSheetExpenseFriendlyReminder> createState() => _BottomSheetExpenseFriendlyReminderState();
}

class _BottomSheetExpenseFriendlyReminderState extends State<BottomSheetExpenseFriendlyReminder> with BaseView {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        children: [
          Container(
            width: size(context).width,
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200))),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.clear, color: R.color.transparent),
                Expanded(
                  child: TextBasic(
                    text: R.string.friendlyReminder,
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
          Center(
            child: AvatarGlow(
              glowColor: R.color.warning.shade200,
              endRadius: 60.0,
              child: Material(
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: R.color.warning.shade100,
                  child: Icon(
                    Icons.info_outline,
                    size: 24.0,
                    color: R.color.warning,
                  ),
                  radius: 32.0,
                ),
              ),
            ),
          ),
          Center(
            child: TextBasic(
              text: widget.title,
              color: R.color.gray.shade900,
              fontFamily: R.fonts.interSemiBold,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          Container(height: 8.0),
          Container(
            child: Center(
              child: TextBasic(
                text:widget.description,
                color: R.color.gray.shade600,
                fontFamily: R.fonts.interRegular,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(height: 52.0),
          SizedBox(
            width: size(context).width,
            child: ButtonBasic(
              onPressed: () {
                widget.onConfirm();
                Navigator.pop(context);
              },
              bgColor: R.color.white,
              borderSide: BorderSide(width: 1.0, color: R.color.gray.shade300),
              elevation: 0.0,
              text: widget.confirmText,
              fontSize: 16.0,
              fontFamily: R.fonts.interSemiBold,
              fontWeight: FontWeight.w600,
              textColor: R.color.gray.shade700,
            ),
          ),
          Container(height: 8.0),
          SizedBox(
            width: size(context).width,
            child: ButtonBasic(
              onPressed: () => Navigator.pop(context),
              text: widget.cancelText,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
