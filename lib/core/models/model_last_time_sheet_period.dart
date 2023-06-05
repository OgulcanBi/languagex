import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseLastTimeSheetPeriod extends ResponseData {
  ResponseLastTimeSheetPeriod({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelLastTimeSheetPeriod>? result;
}

@jsonSerializable
class ModelLastTimeSheetPeriod {
  @JsonProperty(name: 'Period')
  final DateTime? period;
  @JsonProperty(name: 'StatusText')
  final String? statusText;

  ModelLastTimeSheetPeriod({
    this.period,
    this.statusText,
  });
}
