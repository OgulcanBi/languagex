import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

class FilterChargeabilityGraph extends StatelessWidget {
  final Function()? monthlySort;
  final Function()? quarterlySort;
  final Function()? yearlySort;
  final int selectedIndex;
  final Color? bgColor;
  const FilterChargeabilityGraph({super.key, this.monthlySort, this.quarterlySort, this.bgColor, this.yearlySort, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          monthlySort == null
              ? Container()
              : GestureDetector(
                  onTap: monthlySort,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == GridType.month.value ? R.color.gray.shade100 : R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: TextBasic(
                        text: R.string.monthlyFilter,
                        fontFamily: R.fonts.interSemiBold,
                        color: R.color.gray.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          quarterlySort == null
              ? Container()
              : GestureDetector(
                  onTap: quarterlySort,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == GridType.quarter.value ? R.color.gray.shade100 : R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Center(
                      child: TextBasic(
                        text: R.string.quarterlyFilter,
                        fontFamily: R.fonts.interSemiBold,
                        color: R.color.gray.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          yearlySort == null
              ? Container()
              : GestureDetector(
                  onTap: yearlySort,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == GridType.year.value ? R.color.gray.shade100 : R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: TextBasic(
                        text: R.string.yearlyFilter,
                        fontFamily: R.fonts.interSemiBold,
                        color: R.color.gray.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
