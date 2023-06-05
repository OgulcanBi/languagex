import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseUserPaidTimeOfBalance extends ResponseData {
  ResponseUserPaidTimeOfBalance({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelUserPaidTimeOfBalance? result;
}

@jsonSerializable
class ModelUserPaidTimeOfBalance {
  @JsonProperty(name: 'Total')
  final num total;

  @JsonProperty(name: 'Used')
  final num used;

  @JsonProperty(name: 'Remaining')
  final num remaining;

  @JsonProperty(name: 'LastUpdateDate')
  final String lastUpdateDate;

  ModelUserPaidTimeOfBalance({
    required this.total,
    required this.used,
    required this.remaining,
    required this.lastUpdateDate,
  });
}
