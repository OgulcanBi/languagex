import 'package:flutter/material.dart';
import 'package:languagex/core/enums/enum_app.dart';
import 'package:languagex/core/models/model_alert_dialog.dart';
import 'package:languagex/core/models/model_timesheet_periods.dart';
import 'package:languagex/core/models/model_user_wbs.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:languagex/core/utils/utilities.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/activity_indicator.dart';
import 'package:languagex/ui/widgets/widget_checkbox.dart';
import 'package:languagex/ui/widgets/widget_textfield.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';

import '../widgets/widget_empty_view.dart';

class BottomSheetWBSSelection extends StatefulWidget {
  final ModuleType moduleType;
  final ModelUserWBS? selectedWBS;
  final Function(ModelUserWBS) onChangedWBS;

  const BottomSheetWBSSelection({super.key, this.moduleType = ModuleType.expense, this.selectedWBS, required this.onChangedWBS});

  @override
  State<BottomSheetWBSSelection> createState() => _BottomSheetWBSSelectionState();
}

class _BottomSheetWBSSelectionState extends State<BottomSheetWBSSelection> with BaseView {
  ActivityState loadingState = ActivityState.isLoaded;

  final TextEditingController searchController = TextEditingController();

  ModelUserWBS? selectedWBS;
  List<ModelUserWBS> _originalWbsList = [];
  List<ModelUserWBS> wbsList = [];

  @override
  void initState() {
    super.initState();
    selectedWBS = widget.selectedWBS;

    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        wbsList = _originalWbsList;
        setState(() {});
      } else {
        wbsList = _originalWbsList
            .where((element) =>
                (element.wbs != null && element.wbs!.toLowerCase().contains(searchController.text.toLowerCase())) ||
                (element.clientName != null && element.clientName!.toLowerCase().contains(searchController.text.toLowerCase())))
            .toList();
        setState(() {});
      }
    });
  }


  void setSelectedWBS(ModelUserWBS value) {
    selectedWBS = value;
    setState(() {});
  }

  setLoadingState(ActivityState state) {
    loadingState = state;
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
                            bool isSelected = item.projectId == selectedWBS?.projectId;
                            return GestureDetector(
                              onTap: () {
                                widget.onChangedWBS(item);
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                margin: const EdgeInsets.symmetric(vertical: 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(width: isSelected ? 2.0 : 1.0, color: isSelected ? R.color.primary : R.color.gray.shade200),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: isSelected ? R.color.primary.shade50 : R.color.white,
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
                                        child: TextBasic(text: (item.clientName ?? ' ')[0], fontSize: 12.0, color: R.color.gray.shade500),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextBasic(
                                            text: item.clientProjectName ?? '-',
                                            color: isSelected ? R.color.primary : R.color.gray.shade700,
                                            fontFamily: R.fonts.interMedium,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          const SizedBox(height: 4.0),
                                          TextBasic(
                                            text: item.wbs ?? '-',
                                            color: isSelected ? R.color.primary : R.color.gray.shade600,
                                            fontFamily: R.fonts.interRegular,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    CheckboxBasic(
                                      value: isSelected,
                                      isCircle: true,
                                      checkColor: R.color.white,
                                      bgColor: R.color.primary,
                                      onChanged: (value) {
                                        widget.onChangedWBS(item);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
  }
}
