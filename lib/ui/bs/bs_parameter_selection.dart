import 'package:flutter/material.dart';
import 'package:languagex/core/models/model_parameter.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_scroll.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../widgets/widget_dropdown.dart';

class BottomSheetParameter extends StatefulWidget {
  final String title;
  final ModelParameter? selectedParameter;
  final Function(ModelParameter) onChanged;
  final List<ModelParameter> list;
  const BottomSheetParameter({super.key, required this.title, this.selectedParameter, required this.onChanged, required this.list});

  @override
  State<BottomSheetParameter> createState() => _BottomSheetParameterState();
}

class _BottomSheetParameterState extends State<BottomSheetParameter> with BaseView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size(context).height * 0.5,
      child: Column(
        children: [
          Container(
            width: size(context).width,
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200))),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
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
          Expanded(
            child: ScrollWithNoGlowWidget(
              child: Column(
                children: List.generate(
                  widget.list.length,
                  (index) {
                    var item = widget.list[index];
                    return DropdownButtonParameter(
                      item: item,
                      isSelected: widget.selectedParameter?.code == item.code,
                      isActiveBorder: index != widget.list.length - 1,
                      onSelected: (v) {
                        Navigator.pop(context);
                        widget.onChanged(v);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
