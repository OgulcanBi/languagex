import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseActivePeriod extends ResponseData {
  ResponseActivePeriod({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  ModelActivePeriod? result;
}

@jsonSerializable
class ModelActivePeriod {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;

  @JsonProperty(name: 'TimePeriodFormatText')
  final String? timePeriodFormatText;

  @JsonProperty(name: 'IsProcessed')
  final bool isProcessed;

  @JsonProperty(name: 'ProcessedDateTime')
  final DateTime? processedDateTime;

  ModelActivePeriod({
    required this.id,
    required this.timePeriod,
    this.timePeriodFormatText,
    required this.isProcessed,
    this.processedDateTime,
  });
}
