import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/extensions/extension_list.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/activity_indicator.dart';
import 'package:languagex/ui/widgets/widget_checkbox.dart';
import 'package:languagex/ui/widgets/widget_empty_view.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../../core/models/model_finance_report.dart';
import '../widgets/widget_button.dart';

class BottomSheetWBSMultiSelection extends StatefulWidget {
  final List<FinanceWbsModel>? selectedWBS;
  final List<FinanceWbsModel>? initialWBSList;
  final Function(List<FinanceWbsModel>) onChangedWBS;

  const BottomSheetWBSMultiSelection({
    super.key,
    this.selectedWBS,
    required this.onChangedWBS,
    this.initialWBSList,
  });

  @override
  State<BottomSheetWBSMultiSelection> createState() => _BottomSheetWBSMultiSelectionState();
}

class _BottomSheetWBSMultiSelectionState extends State<BottomSheetWBSMultiSelection> with BaseView {
  ActivityState loadingState = ActivityState.isLoaded;

  final TextEditingController searchController = TextEditingController();

  late List<FinanceWbsModel> selectedWBS;
  List<FinanceWbsModel> _originalWbsList = [];
  List<FinanceWbsModel> wbsList = [];

  @override
  void initState() {
    super.initState();
    fetchWbsList();
    selectedWBS = widget.selectedWBS ?? [];

    searchController.addListener(
      () {
        if (searchController.text.isEmpty) {
          wbsList = _originalWbsList;
          setState(() {});
        } else {
          wbsList = _originalWbsList
              .where((element) =>
                  (element.wbs.toLowerCase().contains(searchController.text.toLowerCase())) ||
                  (element.clientName.toLowerCase().contains(searchController.text.toLowerCase())))
              .toList();
          setState(() {});
        }
      },
    );
  }

  void fetchWbsList() {
    wbsList = widget.initialWBSList ?? [];
    _originalWbsList = widget.initialWBSList ?? [];
  }

  void setSelectedWBS(List<FinanceWbsModel>? value) {
    selectedWBS = value ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loadingState == ActivityState.isLoading
        ? Center(child: IOSIndicator())
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFieldBasic(
                        controller: searchController,
                        hintText: R.string.searchWBS,
                        prefixIcon: Icon(Icons.search, color: R.color.gray.shade500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.isNotEmpty) {
                          searchController.text = '';
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextBasic(
                          text: R.string.cancel,
                          color: R.color.primary,
                          fontFamily: R.fonts.interSemiBold,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: wbsList.isEmpty
                      ? EmptyView(title: R.string.notFound, iconData: Icons.search)
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          itemCount: wbsList.length,
                          itemBuilder: (context, index) {
                            var item = wbsList[index];
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: R.color.gray.shade200),
                                borderRadius: BorderRadius.circular(12.0),
                                color: R.color.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 32.0,
                                    width: 32.0,
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: R.color.gray.shade200,
                                    ),
                                    child: Center(
                                      child: TextBasic(text: (item.clientName)[0], fontSize: 12.0, color: R.color.gray.shade500),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextBasic(
                                          text: item.clientName,
                                          color: R.color.gray.shade700,
                                          fontFamily: R.fonts.interMedium,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const SizedBox(height: 4.0),
                                        TextBasic(
                                          text: item.wbs,
                                          color: R.color.gray.shade600,
                                          fontFamily: R.fonts.interRegular,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  CheckboxBasic(
                                    key: UniqueKey(),
                                    value: _isSelected(index),
                                    isCircle: true,
                                    checkColor: R.color.white,
                                    bgColor: R.color.primary,
                                    onChanged: (value) {
                                      if (_isSelected(index))
                                        selectedWBS.removeWhere((element) => element.wbs == wbsList[index].wbs);
                                      else
                                        selectedWBS.add(wbsList[index]);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                _getFilterButton(context),
              ],
            ),
          );
  }

  bool _isSelected(int index) => selectedWBS.any((item) => item.wbs == wbsList[index].wbs);

  Widget _getFilterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Row(
        children: [
          selectedWBS.isNullOrEmpty
              ? Container()
              : Expanded(
                  flex: 2,
                  child: ButtonBasic(
                    text: R.string.clear,
                    bgColor: R.color.white,
                    textColor: R.color.primary,
                    elevation: 0.0,
                    onPressed: () {
                      selectedWBS.clear();
                      widget.onChangedWBS(selectedWBS);
                      Navigator.pop(context);
                    },
                  ),
                ),
          const SizedBox(width: 12.0),
          Expanded(
            flex: 3,
            child: ButtonBasic(
              onPressed: () {
                widget.onChangedWBS(selectedWBS);
                Navigator.pop(context);
              },
              text: R.string.filterNow,
            ),
          ),
        ],
      ),
    );
  }
}
