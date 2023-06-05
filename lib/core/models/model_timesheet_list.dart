import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'model_timesheet_date.dart';

@jsonSerializable
class ModelTimesheetList {
  final int week;
  final List<ModelTimesheetDate> dates;

  ModelTimesheetList({required this.week, required this.dates});
}
