// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:languagex/ui/widgets/widgets_text.dart';
//
// import '../../core/models/model_chargeability_graph_item.dart';
// import '../../core/resources/_r.dart';
//
// class DonutChart extends StatelessWidget {
//   final List<ChargeabilityGraphData> chargeabilityGraphList;
//   final Function() seeDetailsClickAction;
//
//   const DonutChart({required this.chargeabilityGraphList, required this.seeDetailsClickAction});
//
//   Widget getChart(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Container(
//         alignment: Alignment.topLeft,
//         child: SfCircularChart(
//           margin: EdgeInsets.zero,
//           series: <CircularSeries>[
//             DoughnutSeries<ChargeabilityGraphData, String>(
//                 radius: '100%',
//                 dataSource: chargeabilityGraphList,
//                 pointColorMapper: (ChargeabilityGraphData data, _) => data.color,
//                 xValueMapper: (ChargeabilityGraphData data, _) => data.header,
//                 yValueMapper: (ChargeabilityGraphData data, _) => data.value)
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return getCard(context);
//   }
//
//   Widget getRatios(BuildContext context) {
//     return Column(
//       children: List.generate(
//         chargeabilityGraphList.length,
//         (index) => Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 8.0,
//                   height: 8.0,
//                   decoration: BoxDecoration(
//                     color: chargeabilityGraphList[index].color,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Flexible(
//                   child: TextBasic(
//                     text: chargeabilityGraphList[index].header.toString(),
//                     fontFamily: R.fonts.interRegular,
//                     fontWeight: FontWeight.w400,
//                     textAlign: TextAlign.end,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4.0)
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getCard(BuildContext context) {
//     return Card(
//       elevation: 1.0,
//       shadowColor: R.color.gray.shade100,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Expanded(flex: 5, child: getChart(context)),
//                 const SizedBox(width: 32.0),
//                 Expanded(flex: 3, child: getRatios(context)),
//               ],
//             ),
//           ),
//           _getDivider(context),
//           _getSeeAll()
//         ],
//       ),
//     );
//   }
//
//   Widget _getSeeAll() {
//     return GestureDetector(
//       onTap: seeDetailsClickAction,
//       child: Container(
//         alignment: AlignmentDirectional.bottomEnd,
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//         child: TextBasic(
//           text: R.string.seeDetails,
//           fontFamily: R.fonts.interSemiBold,
//           color: R.color.primary,
//           fontSize: 14.0,
//           fontWeight: FontWeight.w600,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   Widget _getDivider(BuildContext context) {
//     return Divider(height: 1.0, color: R.color.gray.shade200);
//   }
// }
