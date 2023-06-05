import 'package:flutter/material.dart';
import 'package:languagex/ui/widgets/widget_linear_indicator.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';

class AnnualLeaveIndicator extends StatelessWidget {
  final String description;
  final num totalDays;
  final num remainingDays;

  AnnualLeaveIndicator({
    required this.description,
    required this.totalDays,
    required this.remainingDays,
  });

  @override
  Widget build(BuildContext context) {
    return _getBody(context);
  }

  Widget _getBody(BuildContext context) {
    return Container(
      child: _getCard(context),
    );
  }

  Widget _getCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 1.0,
      shadowColor: R.color.gray.shade100,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getDescription(),
            const SizedBox(height: 12.0),
            _getLinearIndicator(),
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

  Widget _getRemainingDaysText() {
    return TextBasic(
      text: remainingDays.toString(),
      color: R.color.gray.shade900,
      fontFamily: R.fonts.interSemiBold,
      fontWeight: FontWeight.w600,
      fontSize: 30.0,
      textAlign: TextAlign.center,
    );
  }

  Widget _getLinearIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _getRemainingDaysText(),
        const SizedBox(width: 36),
        Expanded(
          child: LinearIndicator(
              firstPercentage: (remainingDays.abs() / (totalDays == 0 ? 1 : totalDays) * 100).toInt(),
              indicatorColor: remainingDays < 0 ? R.color.error.shade600 : R.color.primary),
        ),
      ],
    );
  }
}
