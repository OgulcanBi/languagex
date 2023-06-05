import 'package:flutter/material.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';

import '../../core/resources/_r.dart';
import '../widgets/widgets_text.dart';

class BottomSheetDescription extends StatefulWidget {
  final Function(String description) onConfirm;
  const BottomSheetDescription({super.key, required this.onConfirm});

  @override
  State<BottomSheetDescription> createState() => _BottomSheetDescriptionState();
}

class _BottomSheetDescriptionState extends State<BottomSheetDescription> with BaseView {
  final TextEditingController descriptionController = TextEditingController();
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
                    text: R.string.description,
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
          Container(height: 40.0),
          TextFieldBasic(
            controller: descriptionController,
            title: R.string.description,
            maxLines: 5,
          ),
          Container(height: 40.0),
          _getBottomButtons(context),
        ],
      ),
    );
  }

  Widget _getBottomButtons(BuildContext context) {
    return keyboardVisibility(context)
        ? Container(height: 0.0)
        : Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1.0, color: R.color.gray.shade100))),
            child: Row(
              children: [
                _getCancelButton(context),
                const SizedBox(width: 16.0),
                _getCreateButton(context),
              ],
            ),
          );
  }

  Widget _getCancelButton(BuildContext context) {
    return Expanded(
      child: ButtonBasic(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        onPressed: () => router(context).onBackPressed(),
        elevation: 0.5,
        bgColor: R.color.white,
        borderSide: BorderSide(width: 1.0, color: R.color.gray.shade300),
        text: R.string.cancel,
        fontFamily: R.fonts.interSemiBold,
        fontSize: 16.0,
        textColor: R.color.gray.shade700,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _getCreateButton(BuildContext context) {
    return Expanded(
      child: ButtonBasic(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        onPressed: () => {
          router(context).onBackPressed(),
          widget.onConfirm(descriptionController.text),
        },
        bgColor: R.color.primary,
        elevation: 0.5,
        text: R.string.save,
        fontFamily: R.fonts.interSemiBold,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
