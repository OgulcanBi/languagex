import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/models/model_base_dropdown.dart';
import 'package:languagex/core/models/model_parameter.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/bs/bs_dropdown.dart';
import 'package:languagex/ui/bs/bs_parameter_selection.dart';
import 'package:languagex/ui/widgets/activity_indicator.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

class DropdownBasic<T extends BaseDropdown> extends StatefulWidget {
  final T? selectedItem;
  final List<T>? items;
  final String? title;
  final String? hint;
  final Future<dynamic>? callback;
  final Function()? onRemove;
  final Function(T) onChanged;
  const DropdownBasic({
    super.key,
    this.selectedItem,
    this.items,
    this.callback,
    this.title,
    this.hint,
    this.onRemove,
    required this.onChanged,
  });

  @override
  State<DropdownBasic> createState() => _DropdownBasicState<T>();
}

class _DropdownBasicState<T extends BaseDropdown> extends State<DropdownBasic<T>> with BaseView {
  final TextEditingController itemController = TextEditingController();
  ActivityState loadingState = ActivityState.isLoading;
  T? selectedItem;
  List<T> items = [];

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
    if (widget.items != null) {
      items = widget.items!;
    } else {
      initList();
    }
  }

  Future<void> initList() async {
    selectedItem = widget.selectedItem;
    itemController.text = widget.selectedItem?.dropdownTitle ?? '';
    setLoadingState(ActivityState.isLoading);
    if (widget.callback != null) {
      await widget.callback!.then(
        (response) {
          items = response.result;
          setLoadingState(ActivityState.isLoaded);
        },
        onError: (error) {
          setLoadingState(ActivityState.isError);
        },
      );
    }
  }

  void onChanged(T item) {
    selectedItem = item;
    itemController.text = item.dropdownTitle;
    widget.onChanged(item);
    setState(() {});
  }

  void setLoadingState(ActivityState state) {
    loadingState = state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => showBottomSheet(),
            child: TextFieldBasic(
              enabled: false,
              controller: itemController,
              title: widget.title,
              hintText: widget.hint,
              suffixIcon: widget.callback == null ? Icon(Icons.keyboard_arrow_down, color: R.color.gray.shade500) : null,
              prefixIcon: widget.callback == null ? null : Icon(Icons.search, color: R.color.gray.shade500),
            ),
          ),
        ),
        widget.onRemove == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                  onPressed: () {
                    selectedItem = null;
                    itemController.text = '';
                    setState(() {});
                    widget.onRemove!();
                  },
                  icon: Icon(Icons.clear, color: R.color.gray.shade300),
                ),
              ),
      ],
    );
  }

  void showBottomSheet() {
    router(context).showBaseBottomSheet(
      context,
      BottomSheetDropdown<T>(
        title: widget.title,
        onChanged: onChanged,
        list: items,
        selectedItem: selectedItem,
      ),
    );
  }
}

class DropdownButtonBasic<T> extends StatelessWidget {
  final T item;
  final String itemTitle;
  final bool isSelected;
  final bool isActiveBorder;
  final Function(T) onSelected;
  const DropdownButtonBasic(
      {super.key, required this.item, required this.itemTitle, required this.isSelected, required this.isActiveBorder, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 26.0),
        decoration: BoxDecoration(
          border: isActiveBorder ? Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200)) : null,
          color: R.color.white,
        ),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.0, color: isSelected ? R.color.primary : R.color.gray.shade300),
              ),
              child: Center(
                child: Container(
                  height: 8.0,
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: isSelected ? R.color.primary : R.color.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: TextBasic(
                text: itemTitle,
                color: R.color.gray.shade900,
                fontFamily: R.fonts.interMedium,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonParameter extends StatelessWidget {
  final ModelParameter item;
  final bool isSelected;
  final bool isActiveBorder;
  final Function(ModelParameter) onSelected;
  const DropdownButtonParameter({super.key, required this.item, required this.isSelected, required this.isActiveBorder, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 26.0),
        decoration: BoxDecoration(
          border: isActiveBorder ? Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200)) : null,
          color: R.color.white,
        ),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.0, color: isSelected ? R.color.primary : R.color.gray.shade300),
              ),
              child: Center(
                child: Container(
                  height: 8.0,
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: isSelected ? R.color.primary : R.color.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: TextBasic(
                text: item.value,
                color: R.color.gray.shade900,
                fontFamily: R.fonts.interMedium,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownParamater extends StatefulWidget {
  final ModelParameter? selectedItem;
  final ParameterType type;
  final String title;
  final String hintText;
  final bool isEnabled;
  final Function(ModelParameter) onChanged;
  const DropdownParamater(
      {super.key, this.selectedItem, required this.type, required this.title, required this.hintText, this.isEnabled = true, required this.onChanged});

  @override
  State<DropdownParamater> createState() => _DropdownParamaterState();
}

class _DropdownParamaterState extends State<DropdownParamater> with BaseView {
  final TextEditingController itemController = TextEditingController();
  ActivityState loadingState = ActivityState.isLoading;
  ModelParameter? selectedItem;
  List<ModelParameter> items = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // selectedItem = widget.selectedItem;
    // itemController.text = widget.selectedItem?.value ?? '';
    // if (widget.isEnabled) {
    //   setLoadingState(ActivityState.isLoading);
    //   await apiService(context).client.getParameters(ModelParamaterRequest(type: widget.type.value)).then(
    //     (response) {
    //       items = response.result!;
    //       setLoadingState(ActivityState.isLoaded);
    //     },
    //     onError: (error) {
    //       setLoadingState(ActivityState.isError);
    //     },
    //   );
    // }
  }

  void onChanged(ModelParameter item) {
    selectedItem = item;
    itemController.text = item.value;
    widget.onChanged(item);
    setState(() {});
  }

  void setLoadingState(ActivityState state) {
    loadingState = state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.isEnabled ? showBottomSheetParameter() : null,
      child: TextFieldBasic(
        enabled: false,
        controller: itemController,
        title: widget.title,
        hintText: widget.hintText,
        suffixIcon: !widget.isEnabled
            ? null
            : loadingState == ActivityState.isLoading
                ? IOSIndicator()
                : loadingState == ActivityState.isError
                    ? Icon(Icons.error, color: R.color.error)
                    : Icon(
                        Icons.keyboard_arrow_down,
                        color: R.color.gray.shade500,
                      ),
      ),
    );
  }

  void showBottomSheetParameter() {
    router(context).showBaseBottomSheet(
      context,
      BottomSheetParameter(
        title: widget.title,
        onChanged: onChanged,
        list: items,
        selectedParameter: selectedItem,
      ),
    );
  }
}
