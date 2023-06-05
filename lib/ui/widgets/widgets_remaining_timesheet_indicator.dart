import 'package:flutter/material.dart';
import 'package:languagex/ui/widgets/widget_linear_indicator.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';

class RemainingTimesheetIndicator extends StatelessWidget {
  final String description;
  final int? firstPercentage;
  final int? secondPercentage;
  final String? firstIndicatorName;
  final String? secondIndicatorName;

  const RemainingTimesheetIndicator({
    super.key,
    required this.description,
    this.firstPercentage,
    this.secondPercentage,
    this.firstIndicatorName,
    this.secondIndicatorName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      shadowColor: R.color.gray.shade100,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getDescription(),
            const SizedBox(height: 16.0),
            _getLinearIndicator(),
            const SizedBox(height: 16.0),
            _getDetails(),
            // const SizedBox(height: 24.0),
            // Divider(height: 1.0, color: R.color.gray.shade200),
            // const SizedBox(height: 16.0),
            // _getSeeAll(),
          ],
        ),
      ),
    );
  }

  Widget _getDescription() {
    return TextBasic(
      text: description,
      color: R.color.gray.shade600,
      fontFamily: R.fonts.interMedium,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      textAlign: TextAlign.center,
    );
  }

  Widget _getSeeAll() {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      child: TextBasic(
        text: R.string.seeDetails,
        fontFamily: R.fonts.interSemiBold,
        color: R.color.primary,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getLinearIndicator() {
    return LinearIndicator(
      firstPercentage: firstPercentage,
      secondPercentage: secondPercentage,
    );
  }

  Widget _getDetails() {
    return Row(
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: R.color.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8.0),
        TextBasic(
          text: firstIndicatorName ?? '',
          fontFamily: R.fonts.interRegular,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(width: 16),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: R.color.error.shade600,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8.0),
        TextBasic(
          text: secondIndicatorName ?? '',
          fontFamily: R.fonts.interRegular,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ],
    );
  }
}
