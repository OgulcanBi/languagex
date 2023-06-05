//
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
// import 'package:languagex/core/enums/enum_app.dart';
// import 'package:languagex/core/extensions/extension_list.dart';
// import 'package:languagex/ui/widgets/widget_chips.dart';
// import 'package:languagex/ui/widgets/widget_scroll.dart';
// import 'package:languagex/ui/widgets/widgets_text.dart';
//
// import '../../core/models/model_bar_chart.dart';
// import '../../core/models/model_finance_report.dart';
// import '../../core/resources/_r.dart';
//
// class GroupedStackedBarChart extends StatelessWidget {
//   final ResponseFinanceReport responseFinanceReport;
//   final String? chartText;
//   final List<FinanceWbsModel>? filters;
//   final bool animate;
//   final bool isYearlyFilter;
//   final Function() datePickerClickAction;
//   final Function() filterClickAction;
//   final Function(int) filterCancelClickAction;
//
//   GroupedStackedBarChart({
//     required this.animate,
//     required this.datePickerClickAction,
//     required this.responseFinanceReport,
//     this.filters,
//     required this.filterCancelClickAction,
//     required this.filterClickAction,
//     this.chartText,
//     required this.isYearlyFilter,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 1.0,
//       shadowColor: R.color.gray.shade100,
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             _getFilters(chartText ?? ''),
//             const SizedBox(height: 16.0),
//             _getChipGroup(context),
//             const SizedBox(height: 20.0),
//             _getChart(context),
//             const SizedBox(height: 20.0),
//             getDetails(context)
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _getChart(BuildContext context) {
//     return SizedBox(
//       height: 240,
//       child: charts.BarChart(
//         getBars(responseFinanceReport.result, context),
//         animate: animate,
//         primaryMeasureAxis: charts.NumericAxisSpec(
//           tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 6),
//         ),
//         defaultRenderer: charts.BarRendererConfig(
//           groupingType: charts.BarGroupingType.groupedStacked,
//           strokeWidthPx: 3.0,
//           cornerStrategy: const charts.ConstCornerStrategy(8),
//           barGroupInnerPaddingPx: 8,
//           stackedBarPaddingPx: 0,
//           weightPattern: const [1, 10],
//         ),
//       ),
//     );
//   }
//
//   Widget getDetails(BuildContext context) {
//     return ScrollWithNoGlowWidget(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 8.0,
//             height: 8.0,
//             decoration: BoxDecoration(
//               color: R.color.primary,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 16.0),
//           TextBasic(
//             text: R.string.actualTitle,
//             fontFamily: R.fonts.interRegular,
//             fontWeight: FontWeight.w400,
//             fontSize: 12,
//           ),
//           const SizedBox(width: 16.0),
//           Container(
//             width: 8.0,
//             height: 8.0,
//             decoration: BoxDecoration(
//               color: R.color.primary.shade500,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 16.0),
//           TextBasic(
//             text: R.string.etcTitle,
//             fontFamily: R.fonts.interRegular,
//             fontWeight: FontWeight.w400,
//             fontSize: 12,
//           ),
//           Container(width: isYearlyFilter ? 16.0 : 0.0),
//           isYearlyFilter
//               ? Container(
//                   width: 8.0,
//                   height: 8.0,
//                   decoration: BoxDecoration(
//                     color: R.color.warning.shade400,
//                     shape: BoxShape.circle,
//                   ),
//                 )
//               : Container(),
//           Container(width: isYearlyFilter ? 16.0 : 0.0),
//           isYearlyFilter
//               ? TextBasic(
//                   text: R.string.odeTitle,
//                   fontFamily: R.fonts.interRegular,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                 )
//               : Container(),
//           Container(width: isYearlyFilter ? 16.0 : 0.0),
//         ],
//       ),
//     );
//   }
//
//   Widget _getChipGroup(BuildContext context) {
//     return ChipGroup(
//       filters: filters,
//       filterCancelClickAction: filterCancelClickAction,
//     );
//   }
//
//   List<charts.Series<ModelBarChart, String>> getBars(RealTimeMetricsResponse? responseFinanceReport, BuildContext context) {
//     final eac = getDataList(responseFinanceReport!.eacList);
//     final actual = getDataList(responseFinanceReport.actualList);
//     final odeCCI = getDataList(responseFinanceReport.odeList);
//
//     return [
//       for (int i = 0; i < odeCCI.length && isYearlyFilter; i++) getTargetBar(i, odeCCI),
//       getBar(eac, R.string.eacTitle, R.color.primary.shade500),
//       getBar(actual, R.string.actualTitle, R.color.primary.shade700),
//     ];
//   }
//
//   charts.Series<ModelBarChart, String> getBar(List<ModelBarChart> list, String id, Color color) {
//     return charts.Series<ModelBarChart, String>(
//       id: id,
//       seriesCategory: BarType.multiBarType.value,
//       domainFn: (ModelBarChart data, _) => data.title,
//       measureFn: (ModelBarChart data, _) => data.value,
//       colorFn: (ModelBarChart data, _) => data.value != 0 ? charts.ColorUtil.fromDartColor(color) : charts.MaterialPalette.transparent,
//       data: list,
//     );
//   }
//
//   List<ModelBarChart> getDataList(RealTimeMetricsModel barChartModel) {
//     return [
//       ModelBarChart(title: R.string.revenue, value: barChartModel.revenue.toInt()),
//       ModelBarChart(title: R.string.billing, value: barChartModel.billing.toInt()),
//       ModelBarChart(title: R.string.cost, value: barChartModel.totalCost.toInt()),
//       ModelBarChart(title: R.string.cCI, value: barChartModel.cci.toInt()),
//     ];
//   }
//
//   charts.Series<ModelBarChart, String> getTargetBar(int index, List<ModelBarChart> modelBarChartList) {
//     return charts.Series<ModelBarChart, String>(
//       id: modelBarChartList[index].title,
//       seriesCategory: BarType.odeBarType.value,
//       domainFn: (ModelBarChart data, _) => data.title,
//       measureFn: (ModelBarChart data, _) => data.value,
//       data: [modelBarChartList[index]],
//       colorFn: (_, __) => charts.ColorUtil.fromDartColor(R.color.warning.shade400),
//     );
//   }
//
//   Widget _getFilters(String text) {
//     return Row(
//       children: [
//         Expanded(
//           child: GestureDetector(
//             onTap: datePickerClickAction,
//             child: Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               margin: const EdgeInsets.symmetric(horizontal: 10.0),
//               decoration: BoxDecoration(
//                 color: R.color.white,
//                 border: Border.all(width: 1.0, color: R.color.gray.shade300),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.date_range_outlined, color: R.color.gray.shade700),
//                   const SizedBox(width: 10.0),
//                   TextBasic(
//                     text: text,
//                     fontFamily: R.fonts.interSemiBold,
//                     color: R.color.gray.shade700,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w600,
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GestureDetector(
//             onTap: filterClickAction,
//             child: Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               margin: const EdgeInsets.symmetric(horizontal: 10.0),
//               decoration: BoxDecoration(
//                 color: R.color.white,
//                 border: Border.all(width: 1.0, color: R.color.gray.shade300),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.filter_alt_outlined, color: filters.isNotNullOrEmpty ? R.color.primary : R.color.gray.shade700),
//                   const SizedBox(width: 10.0),
//                   TextBasic(
//                     text: R.string.wbsClient,
//                     fontFamily: R.fonts.interSemiBold,
//                     color: R.color.gray.shade700,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w600,
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
