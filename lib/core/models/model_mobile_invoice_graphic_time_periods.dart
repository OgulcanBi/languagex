import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseInvoiceTimesheetPeriods extends ResponseData {
  ResponseInvoiceTimesheetPeriods({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelTimesheetTimeResponse>? result;
}

@jsonSerializable
class ModelTimesheetTimeResponse {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;

  @JsonProperty(name: 'TimePeriodFormatText')
  final String timePeriodFormatText;

  @JsonProperty(name: 'IsProcessed')
  final bool isProcessed;

  @JsonProperty(name: 'ProcessedDateTime')
  final dynamic processedDateTime;

  @JsonProperty(name: 'ProcessedUser')
  final dynamic processedUser;

  ModelTimesheetTimeResponse({
    required this.id,
    required this.timePeriod,
    required this.timePeriodFormatText,
    required this.isProcessed,
    this.processedDateTime,
    this.processedUser,
  });
}
