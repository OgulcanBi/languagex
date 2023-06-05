import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseUserTimesheetPeriodList extends ResponseData {
  ResponseUserTimesheetPeriodList({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<TimesheetPeriod>? result;
}

@jsonSerializable
class TimesheetPeriod {
  @JsonProperty(name: 'Period')
  final DateTime period;
  @JsonProperty(name: 'Status')
  final int status;

  TimesheetPeriod({
    required this.period,
    required this.status,
  });
}
