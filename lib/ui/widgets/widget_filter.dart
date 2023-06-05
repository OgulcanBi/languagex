import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';

class FilterExpense extends StatelessWidget {
  final TextEditingController searchController;
  final Function()? onTapSort;
  final Function()? onTapFilter;
  final Color? bgColor;
  final bool filterSelected;
  const FilterExpense({super.key, required this.searchController, this.onTapSort, this.onTapFilter, this.bgColor, required this.filterSelected});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFieldBasic(
              controller: searchController,
              hintText: R.string.search,
              borderColor: R.color.gray.shade300,
              borderWith: 1.0,
              bgColor: bgColor ?? R.color.viewBg,
              prefixIcon: Icon(Icons.search, color: R.color.gray.shade500),
            ),
          ),
          onTapSort == null ? Container() : const SizedBox(width: 8.0),
          onTapSort == null
              ? Container()
              : GestureDetector(
                  onTap: onTapSort,
                  child: Container(
                    width: 44.0,
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(child: Icon(Icons.arrow_downward, color: R.color.gray.shade700)),
                  ),
                ),
          onTapFilter == null ? Container() : const SizedBox(width: 12.0),
          onTapFilter == null
              ? Container()
              : GestureDetector(
                  onTap: onTapFilter,
                  child: Container(
                    width: 44.0,
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: R.color.white,
                      border: Border.all(width: 1.0, color: R.color.gray.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(child: Icon(Icons.filter_alt_outlined, color: filterSelected ? R.color.primary : R.color.gray.shade700)),
                  ),
                ),
        ],
      ),
    );
  }
}
