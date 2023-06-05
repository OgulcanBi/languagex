import 'package:flutter/material.dart';
import 'package:languagex/core/extensions/extension_list.dart';
import 'package:languagex/ui/widgets/widget_scroll.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_finance_report.dart';
import '../../core/resources/_r.dart';

class ChipGroup extends StatelessWidget {
  final List<FinanceWbsModel>? filters;
  final Function(int)? filterCancelClickAction;

  ChipGroup({
    this.filters,
    this.filterCancelClickAction,
  });

  @override
  Widget build(BuildContext context) {
    return filters.isNullOrEmpty
        ? Container()
        : ScrollWithNoGlowWidget(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                filters!.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        TextBasic(
                          color: R.color.gray.shade700,
                          fontSize: 14,
                          fontFamily: R.fonts.interMedium,
                          fontWeight: FontWeight.w500,
                          text: filters![index].wbs,
                        ),
                        const SizedBox(width: 8.0),
                        GestureDetector(
                          child: Icon(Icons.close, size: 16, color: R.color.gray.shade400),
                          onTap: () {
                            if (filterCancelClickAction != null) filterCancelClickAction!(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
