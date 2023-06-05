import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';

class FilterOdePeriods extends StatelessWidget {
  final Function()? onTapSort;
  final Color? bgColor;
  final String? hintText;
  const FilterOdePeriods({super.key, this.onTapSort, this.bgColor, this.hintText});

  @override
  Widget build(BuildContext context) {
    return onTapSort == null
        ? Container()
        : GestureDetector(
            onTap: onTapSort,
            child: TextFieldBasic(
              enabled: false,
              hintText: hintText ?? R.string.forecastSelectOdePeriod,
              borderColor: R.color.gray.shade300,
              borderWith: 1.0,
              bgColor: bgColor ?? R.color.viewBg,
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: R.color.gray.shade500),
            ),
          );
  }
}
