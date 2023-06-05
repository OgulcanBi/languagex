import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelTimesheetPeriods {
  @JsonProperty(name: 'UserId')
  int userId;
  ModelTimesheetPeriods({
    required this.userId,
  });
}
