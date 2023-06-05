import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_scroll.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_dropdown.dart';
import '../widgets/widget_dropdown.dart';

class BottomSheetFilterTimeSheetGraph extends StatefulWidget {
  final ModelDropdown? selectedSort;
  final Function(ModelDropdown) onChangedSort;
  final List<ModelDropdown>? sortingParameters;

  const BottomSheetFilterTimeSheetGraph({super.key, this.selectedSort, required this.onChangedSort, required this.sortingParameters});

  @override
  State<BottomSheetFilterTimeSheetGraph> createState() => _BottomSheetFilterTimeSheetGraphState();
}

class _BottomSheetFilterTimeSheetGraphState extends State<BottomSheetFilterTimeSheetGraph> with BaseView {
  _BottomSheetFilterTimeSheetGraphState();

  @override
  Widget build(BuildContext context) {
    return (widget.sortingParameters == null || widget.sortingParameters!.isEmpty)
        ? Container()
        : ScrollWithNoGlowWidget(
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
                          text: R.string.selectPeriod,
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200)),
                    color: R.color.gray.shade50,
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextBasic(
                      text: R.string.period,
                      color: R.color.gray.shade600,
                      fontFamily: R.fonts.interMedium,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Wrap(
                  children: List.generate(
                    widget.sortingParameters!.length,
                    (index) {
                      var item = widget.sortingParameters![index];
                      return DropdownButtonBasic(
                        item: item,
                        isSelected: widget.selectedSort == item,
                        isActiveBorder: index != widget.sortingParameters!.length - 1,
                        onSelected: (v) {
                          Navigator.pop(context);
                          widget.onChangedSort(v);
                        },
                        itemTitle: item.title,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
