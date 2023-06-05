import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseTimesheetLimit extends ResponseData {
  ResponseTimesheetLimit({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  ModelTimesheetLimit? result;
}

@jsonSerializable
class ModelTimesheetLimit {
  @JsonProperty(name: 'TopLimit')
  final int topLimit;
  
  @JsonProperty(name: 'BaseLimit')
  final int baseLimit;

  @JsonProperty(name: 'DescriptionRequired')
  final bool descriptionRequired;

  int get baseLimitForHours => baseLimit ~/ 60;
  int get topLimitForHours => topLimit ~/ 60;

  ModelTimesheetLimit({
    required this.topLimit,
    required this.baseLimit,
    required this.descriptionRequired,
  });
}
