import 'package:flutter/material.dart';

import '../../core/resources/_r.dart';

class LinearIndicator extends StatelessWidget {
  final int? firstPercentage;
  final int? secondPercentage;
  final Color? indicatorColor;

  const LinearIndicator({
    super.key,
    this.firstPercentage,
    this.secondPercentage,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: R.color.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: firstPercentage ?? 0,
            child: Container(
              decoration: BoxDecoration(
                color: indicatorColor ?? R.color.primary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: Radius.circular((firstPercentage ?? 0) >= 100 && (secondPercentage ?? 0) <= 0 ? 12 : 0),
                  bottomRight: Radius.circular((firstPercentage ?? 0) >= 100 && (secondPercentage ?? 0) <= 0 ? 12 : 0),
                  bottomLeft: const Radius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            flex: secondPercentage ?? 0,
            child: Container(
              decoration: BoxDecoration(
                color: R.color.error.shade600,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular((firstPercentage ?? 0) > 0 ? 0 : 12),
                  bottomLeft: Radius.circular((firstPercentage ?? 0) > 0 ? 0 : 12),
                  topRight: Radius.circular((firstPercentage ?? 0) + (secondPercentage ?? 0) >= 100 ? 12 : 0),
                  bottomRight: Radius.circular((firstPercentage ?? 0) + (secondPercentage ?? 0) >= 100 ? 12 : 0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 100 - (firstPercentage ?? 0) - (secondPercentage ?? 0),
            child: Container(
              decoration: BoxDecoration(
                color: R.color.gray.shade200,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular((firstPercentage ?? 0) - (secondPercentage ?? 0) == 0 ? 12 : 0),
                  right: const Radius.circular(12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
