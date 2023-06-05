import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelTimesheetGraph {
  @JsonProperty(name: 'Month')
  int month;

  @JsonProperty(name: 'Quarter')
  int quarter;

  @JsonProperty(name: 'Year')
  int year;

  ModelTimesheetGraph({
    required this.month,
    required this.quarter,
    required this.year,
  });
}
