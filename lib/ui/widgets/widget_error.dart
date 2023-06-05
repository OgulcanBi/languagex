import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';

class WidgetError extends StatelessWidget with BaseView {
  final String message;
  final String? buttonText;
  final Function()? onPressedReload;
  const WidgetError({super.key, required this.message, this.buttonText, this.onPressedReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size(context).width * 0.1,
          vertical: size(context).height * 0.1,
        ),
        child: Card(
          elevation: 5.0,
          color: R.color.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              children: [
                Center(
                  child: TextBasic(
                    text: R.string.error.toUpperCase(),
                    color: R.color.error,
                    fontFamily: R.fonts.interBold,
                    fontSize: 16.0,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(height: 32.0),
                Center(
                  child: TextBasic(
                    text: message,
                    color: R.color.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: size(context).width),
                Container(height: 40.0),
                Center(
                  child: onPressedReload == null ? Container() : ButtonBasic(
                    onPressed: onPressedReload,
                    bgColor: R.color.primary,
                    textColor: R.color.white,
                    text: buttonText ?? R.string.refresh,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
