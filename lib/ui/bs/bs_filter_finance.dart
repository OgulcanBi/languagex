import 'package:flutter/material.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widget_scroll.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_dropdown.dart';
import '../../core/models/model_user_wbs.dart';
import '../widgets/widget_checkbox.dart';
import 'bs_wbs_selection.dart';

class BottomSheetFilterFinance extends StatefulWidget {
  final ModelDropdown? selectedStatus;
  final ModelUserWBS? selectedWBS;
  final Function(ModelDropdown? status, ModelUserWBS? wbs) onChangedFilters;
  final List<ModelDropdown> statusList;

  const BottomSheetFilterFinance({
    super.key,
    this.selectedStatus,
    this.selectedWBS,
    required this.onChangedFilters,
    required this.statusList,
  });

  @override
  State<BottomSheetFilterFinance> createState() =>
      _BottomSheetFilterFinanceState();
}

class _BottomSheetFilterFinanceState extends State<BottomSheetFilterFinance>
    with BaseView {
  final TextEditingController wbsController = TextEditingController();
  ModelUserWBS? selectedWBS;
  ModelDropdown? selectedStatus;

  Object redrawObject = Object();

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.selectedStatus;
    selectedWBS = widget.selectedWBS;
    if (widget.selectedWBS != null) setSelectedWBS(widget.selectedWBS!);
  }

  void setSelectedWBS(ModelUserWBS value) {
    selectedWBS = value;
    wbsController.text = '${selectedWBS?.name ?? ''}';
    setState(() {});
  }

  void onChangedSelectedStatusItem(ModelDropdown value) {
    redrawObject = Object();
    if (value == selectedStatus) {
      selectedStatus = null;
    } else {
      selectedStatus = value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getTopBar(context),
        Expanded(
          child: ScrollWithNoGlowWidget(
            child: Wrap(
              children: [
                _getFilterByFormDetailHeader(context),
                Container(height: 16.0),
                _getWBSSearchField(context),
                Container(height: 16.0),
                _getPeriodHeader(context),
                _getFilterStatusList(context),
              ],
            ),
          ),
        ),
        _getFilterButton(context),
      ],
    );
  }

  Widget _getTopBar(BuildContext context) {
    return Container(
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
              text: R.string.filterBy,
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
    );
  }

  Widget _getPeriodHeader(BuildContext context) {
    return _getHeaders(context,R.string.periods);
  }

  Widget _getFilterByFormDetailHeader(BuildContext context) {
    return _getHeaders(context,R.string.filterByFormDetail);
  }

  Widget _getHeaders(BuildContext context, String title) {
    return Container(
      width: size(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(width: 1.0, color: R.color.gray.shade200)),
        color: R.color.gray.shade50,
      ),
      child: TextBasic(
        text: title,
        color: R.color.gray.shade600,
        fontSize: 14.0,
        fontFamily: R.fonts.interMedium,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _getWBSSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                router(context).showBaseBottomSheet(
                  context,
                  BottomSheetWBSSelection(
                    selectedWBS: selectedWBS,
                    onChangedWBS: setSelectedWBS,
                  ),
                );
              },
              child: TextFieldBasic(
                controller: wbsController,
                enabled: false,
                title: R.string.clientOrWbs,
                hintText: R.string.clientOrWbs,
                prefixIcon: Icon(Icons.search, color: R.color.gray.shade500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: IconButton(
              onPressed: () {
                selectedWBS = null;
                wbsController.text = '';
                setState(() {});
              },
              icon: Icon(Icons.clear, color: R.color.gray.shade300),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFilterStatusList(BuildContext context) {
    return Column(
      children: List.generate(
        widget.statusList.length,
        (index) {
          var item = widget.statusList[index];
          return Container(
            width: size(context).width,
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal:
                      BorderSide(width: 1.0, color: R.color.gray.shade200)),
            ),
            child: CheckboxBasic(
              key: ValueKey<Object>(redrawObject),
              title: item.title,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              onChanged: (v) => onChangedSelectedStatusItem(item),
              value: selectedStatus == item,
            ),
          );
        },
      ),
    );
  }

  Widget _getFilterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: SizedBox(
        width: size(context).width,
        child: ButtonBasic(
          onPressed: () {
            widget.onChangedFilters(selectedStatus, selectedWBS);
            Navigator.pop(context);
          },
          text: R.string.filterNow,
        ),
      ),
    );
  }
}
