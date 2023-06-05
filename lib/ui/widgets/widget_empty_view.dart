import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'widgets_text.dart';

class EmptyView extends StatelessWidget {
  final String? title;
  final String? description;
  final IconData iconData;
  const EmptyView({this.title, this.description, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AvatarGlow(
            glowColor: R.color.gray.shade300,
            endRadius: 60.0,
            child: Material(
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: R.color.gray.shade200,
                radius: 32.0,
                child: Icon(
                  iconData,
                  size: 24.0,
                  color: R.color.gray.shade600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        TextBasic(
          text: title ?? '',
          color: R.color.gray.shade900,
          fontFamily: R.fonts.interSemiBold,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        TextBasic(
          text: description ?? '',
          color: R.color.gray.shade600,
          fontFamily: R.fonts.interRegular,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
