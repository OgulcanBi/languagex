import 'package:flutter/material.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/ui/base/base_view.dart';

import '../../core/models/model_forecast_approvement_with_definition_list.dart';
import '../../core/models/model_forecast_messages.dart';
import '../../core/resources/_r.dart';
import '../widgets/widget_button.dart';
import '../widgets/widgets_text.dart';

class BottomSheetForecastMessages extends StatefulWidget {
  final String title;
  final ModelForecastApprovementWithDefinition? forecastApprovementWithDefinitionModel;

  const BottomSheetForecastMessages({
    super.key,
    required this.title,
    required this.forecastApprovementWithDefinitionModel,
  });

  @override
  State<BottomSheetForecastMessages> createState() => _BottomSheetForecastMessagesState();
}

class _BottomSheetForecastMessagesState
    extends State<BottomSheetForecastMessages> with BaseView {
  List<ModelForeCastNotes> forecastNotesList = [];

  @override
  void initState() {
    super.initState();
    if (widget.forecastApprovementWithDefinitionModel?.senderMessage.isNotEmpty ?? false) {
      forecastNotesList.add(
        ModelForeCastNotes(
          userName: widget.forecastApprovementWithDefinitionModel!.senderEnterpriseName,
          role: R.string.forecastSender,
          message: widget.forecastApprovementWithDefinitionModel!.senderMessage,
        ),
      );
    }
    if (widget.forecastApprovementWithDefinitionModel?.fcApproverMessage.isNotNullOrEmpty() ?? false) {
      forecastNotesList.add(
        ModelForeCastNotes(
          userName: widget.forecastApprovementWithDefinitionModel?.fCApproverEnterpriseName ?? R.string.forecastFinancialController,
          role: R.string.forecastFinancialController,
          message: widget.forecastApprovementWithDefinitionModel!.fcApproverMessage!,
        ),
      );
    }
    if (widget.forecastApprovementWithDefinitionModel?.approverMessage.isNotNullOrEmpty() ?? false) {
      forecastNotesList.add(
        ModelForeCastNotes(
          userName: widget.forecastApprovementWithDefinitionModel!.approverEnterpriseName ?? R.string.forecastApprover,
          role: R.string.forecastApprover,
          message: widget.forecastApprovementWithDefinitionModel?.approverMessage ?? '',
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
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
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
                  child: TextBasic(text: R.string.forecastNoMessage),
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
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: R.color.gray.shade200),
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
                                    child: TextBasic(
                                        text: (forecastNotesList[index]
                                            .userName
                                            .toUpperCase())[0],
                                        fontSize: 16.0,
                                        color: R.color.gray.shade500),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBasic(
                                        text: forecastNotesList[index].userName,
                                        color: R.color.gray.shade900,
                                        fontFamily: R.fonts.interSemiBold,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(height: 4.0),
                                      RichTextBasic(
                                        texts:
                                            '${R.string.forecastRole}: ${forecastNotesList[index].role}'
                                                .highlightOccurrences(
                                          '${forecastNotesList[index].role}',
                                          textColor: R.color.gray.shade600,
                                          boldTextColor: R.color.gray.shade600,
                                          fontSize: 14.0,
                                          boldFontSize: 14.0,
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
        text: R.string.forecastReview,
      ),
    );
  }
}
