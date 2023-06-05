import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_base_dropdown.dart';
import '../widgets/widget_dropdown.dart';

class BottomSheetDropdown<T extends BaseDropdown> extends StatefulWidget {
  final String? title;
  final List<T> list;
  final T? selectedItem;
  final Function(T) onChanged;
  const BottomSheetDropdown({super.key, this.title,  required this.list, this.selectedItem, required this.onChanged});

  @override
  State<BottomSheetDropdown> createState() => _BottomSheetDropdownState<T>();
}

class _BottomSheetDropdownState<T extends BaseDropdown> extends State<BottomSheetDropdown<T>> with BaseView {
  List<T> list = [];
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    list = widget.list;
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                  text: widget.title ?? '',
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
        Wrap(
          children: List.generate(
            list.length,
            (index) {
              var item = list[index];
              return DropdownButtonBasic<T>(
                item: item,
                itemTitle: item.dropdownTitle,
                isSelected: selectedItem?.dropdownId == item.dropdownId,
                isActiveBorder: index != list.length - 1,
                onSelected: (v) {
                  Navigator.pop(context);
                  widget.onChanged(v);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
