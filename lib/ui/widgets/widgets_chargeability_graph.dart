// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:languagex/core/extensions/extension_string.dart';
// import 'package:languagex/ui/base/base_view.dart';
// import 'package:languagex/ui/widgets/widgets_text.dart';
//
// import '../../core/models/model_chargeability_graph_item.dart';
// import '../../core/resources/_r.dart';
//
// class ChargeabilityGraph extends StatefulWidget with BaseView {
//   final List<ChargeabilityGraphData> chargeabilityGraphList;
//   final String chartText;
//   final Function() datePickerClickAction;
//
//   ChargeabilityGraph({
//     super.key,
//     required this.chargeabilityGraphList,
//     required this.chartText,
//     required this.datePickerClickAction,
//   });
//
//   @override
//   State<ChargeabilityGraph> createState() => _ChargeabilityGraphState();
// }
//
// class _ChargeabilityGraphState extends State<ChargeabilityGraph> with BaseView {
//   int? valueMaxLine = 1;
//
//   void setValueMaxLineState() {
//     valueMaxLine == null ? valueMaxLine = 1 : valueMaxLine = null;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _getBody(context);
//   }
//
//   Widget _getBody(BuildContext context) {
//     return Container(
//       child: getCard(context),
//     );
//   }
//
//   Widget getRatios(BuildContext context) {
//     var list = widget.chargeabilityGraphList.reversed.toList();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: List.generate(
//         list.length,
//         (index) => Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 8.0,
//               height: 8.0,
//               decoration: BoxDecoration(
//                 color: list[index].color,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             const SizedBox(width: 4.0),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () => setValueMaxLineState(),
//                 child: TextBasic(
//                   text: list[index].header,
//                   fontFamily: R.fonts.interRegular,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                   textAlign: TextAlign.start,
//                   maxLines: valueMaxLine,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 4.0),
//             TextBasic(
//               text: _getValueText(list, index),
//               fontFamily: R.fonts.interBold,
//               fontWeight: FontWeight.w700,
//               fontSize: 12,
//               maxLines: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _getValueText(List<ChargeabilityGraphData> list, int index) {
//     return list[index].text.isNotNullOrEmpty() ? list[index].text! : '${list[index].value.toString()}%';
//   }
//
//   Widget getCard(BuildContext context) {
//     return Card(
//       elevation: 1.0,
//       shadowColor: R.color.gray.shade100,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Expanded(flex: 2, child: getChart(context)),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
//                 child: Column(
//                   children: [
//                     getDate(widget.chartText),
//                     const SizedBox(height: 36.0),
//                     getRatios(context),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getDate(String text) {
//     return GestureDetector(
//       onTap: widget.datePickerClickAction,
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         decoration: BoxDecoration(
//           color: R.color.white,
//           border: Border.all(width: 1.0, color: R.color.gray.shade300),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.date_range_outlined, color: R.color.gray.shade700),
//             const SizedBox(width: 10.0),
//             TextBasic(
//               text: text,
//               fontFamily: R.fonts.interSemiBold,
//               color: R.color.gray.shade700,
//               fontSize: 14.0,
//               fontWeight: FontWeight.w600,
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getChart(BuildContext context) {
//     return widget.chargeabilityGraphList.isNotEmpty
//         ? AspectRatio(
//             aspectRatio: 1,
//             child: Container(
//               width: double.infinity,
//               alignment: Alignment.topLeft,
//               child: SfCircularChart(
//                 margin: EdgeInsets.zero,
//                 series: <CircularSeries>[
//                   RadialBarSeries<ChargeabilityGraphData, String>(
//                       dataSource: widget.chargeabilityGraphList,
//                       xValueMapper: (ChargeabilityGraphData data, _) => data.header,
//                       yValueMapper: (ChargeabilityGraphData data, _) => data.value,
//                       pointColorMapper: (ChargeabilityGraphData data, _) => data.color,
//                       gap: '20%',
//                       radius: '100%',
//                       maximumValue: 100,
//                       cornerStyle: CornerStyle.bothCurve)
//           ],
//         ),
//       ),
//     )
//         : Container();
//   }
// }
