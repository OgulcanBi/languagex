import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_timesheet.dart';

@jsonSerializable
class ModelCheckTimesheet {
  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'Period', converterParams: {'format': 'yyyy-MM-ddThh:mm'})
  final DateTime period;

  @JsonProperty(name: 'TimesheetPtoCheck')
  final List<ModelCreateTimesheet> timesheetPtoCheck;

  ModelCheckTimesheet({
    required this.userId,
    required this.period,
    required this.timesheetPtoCheck,
  });
}
