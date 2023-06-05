import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseTimesheetPeriodStatus extends ResponseData {
  ResponseTimesheetPeriodStatus({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelTimesheetPeriodStatus? result;
}

@jsonSerializable
class ModelTimesheetPeriodStatus {
  @JsonProperty(name: 'Period')
  final int period;

  @JsonProperty(name: 'Submitted')
  final int submitted;

  @JsonProperty(name: 'Overdue')
  final int overdue;

  ModelTimesheetPeriodStatus({
    required this.period,
    required this.submitted,
    required this.overdue,
  });
}
