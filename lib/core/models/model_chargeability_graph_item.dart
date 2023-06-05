import 'dart:ui';

class ChargeabilityGraphData {
  final String header;
  final int value;
  final Color color;
  final String? text;

  ChargeabilityGraphData({
    required this.header,
    required this.value,
    required this.color,
    this.text,
  });
}
