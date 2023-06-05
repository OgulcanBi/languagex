import 'package:flutter/material.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/ui/base/base_view.dart';

import '../../core/models/model_forecast_messages.dart';
import '../../core/resources/_r.dart';
import '../widgets/widget_button.dart';
import '../widgets/widgets_text.dart';

class BottomSheetExpenseMessages extends StatefulWidget {
  final String title;
  final String? message;
  final String? senderName;

  const BottomSheetExpenseMessages({
    super.key,
    required this.title,
    required this.message,
    required this.senderName,
  });

  @override
  State<BottomSheetExpenseMessages> createState() => _BottomSheetExpenseMessagesState();
}

class _BottomSheetExpenseMessagesState extends State<BottomSheetExpenseMessages> with BaseView {
  List<ModelForeCastNotes> forecastNotesList = [];

  @override
  void initState() {
    super.initState();
    if (widget.message.isNotNullOrEmpty()) {
      forecastNotesList.add(
        ModelForeCastNotes(
          userName: widget.senderName ?? '',
          role: '',
          message: widget.message!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        children: [
          Container(
            width: size(context).width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: R.color.gray.shade200),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.clear, color: R.color.transparent),
                Expanded(
                  child: TextBasic(
                    text: widget.title,
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
          forecastNotesList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextBasic(text: R.string.expenseNoMessage),
                )
              : Wrap(
                  children: List.generate(
                    forecastNotesList.length,
                    (index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            decoration: BoxDecoration(
                              border: index != forecastNotesList.length - 1
                                  ? Border(
                                      bottom: BorderSide(width: 1.0, color: R.color.gray.shade200),
                                    )
                                  : null,
                              color: R.color.white,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 56.0,
                                  width: 56.0,
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: R.color.gray.shade200,
                                  ),
                                  child: Center(
                                    child: TextBasic(text: (forecastNotesList[index].userName.toUpperCase())[0], fontSize: 16.0, color: R.color.gray.shade500),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichTextBasic(
                                        texts: '${R.string.manager}: ${forecastNotesList[index].userName}'.highlightOccurrences(
                                          '${forecastNotesList[index].userName}',
                                          textColor: R.color.gray.shade600,
                                          boldTextColor: R.color.gray.shade900,
                                          fontSize: 16.0,
                                          boldFontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(height: 10.0),
                                      TextBasic(
                                        text: forecastNotesList[index].message,
                                        color: R.color.gray.shade600,
                                        fontFamily: R.fonts.interRegular,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
          _reviewTheForecast(context)
        ],
      ),
    );
  }

  Widget _reviewTheForecast(BuildContext context) {
    return SizedBox(
      width: size(context).width,
      child: ButtonBasic(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        onPressed: () => Navigator.pop(context),
        text: R.string.expenseReview,
      ),
    );
  }
}
