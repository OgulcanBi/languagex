import 'package:flutter/material.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';

class CheckboxBasic extends StatefulWidget {
  final String? title;
  final String? description;
  final bool value;
  final Function(bool?) onChanged;
  final bool isCircle;
  final Color? bgColor;
  final Color? checkColor;
  final EdgeInsets? padding;
  final bool isEnabled;

  const CheckboxBasic({
    super.key,
    this.title,
    this.description,
    required this.value,
    required this.onChanged,
    this.isCircle = false,
    this.bgColor,
    this.checkColor,
    this.padding,
    this.isEnabled = true,
  });

  @override
  State<CheckboxBasic> createState() => _CheckboxBasicState();
}

class _CheckboxBasicState extends State<CheckboxBasic> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  void onChanged(bool? value) {
    if (widget.isEnabled) {
      this.value = value ?? !this.value;
      widget.onChanged(value);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(null),
      child: Container(
        color: R.color.transparent,
        padding: widget.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: value,
              activeColor: widget.bgColor ?? R.color.primary.shade50,
              checkColor: widget.checkColor ?? R.color.primary,
              side: MaterialStateBorderSide.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(color: R.color.primary);
                } else {
                  return BorderSide(color: R.color.gray.shade300);
                }
              }),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.isCircle ? 20.0 : 4.0), side: BorderSide(width: 1.0, color: R.color.primary)),
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
            const SizedBox(width: 8.0),
            widget.title == null
                ? Container()
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBasic(
                          text: widget.title!,
                          color: R.color.gray.shade700,
                          fontFamily: R.fonts.interMedium,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        widget.description == null ? Container() : const SizedBox(height: 4.0),
                        widget.description == null
                            ? Container()
                            : TextBasic(
                                text: widget.description!,
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
    );
  }
}
