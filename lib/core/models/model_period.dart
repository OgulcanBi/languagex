import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_base_dropdown.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponsePeriodList extends ResponseData {
  ResponsePeriodList({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelPeriod>? result;
}

@jsonSerializable
class ModelPeriod implements BaseDropdown {
  @JsonProperty(name: 'Id')
  final int id;
  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;
  @JsonProperty(name: 'IsProcessed')
  final bool isProcessed;

  ModelPeriod({
    required this.id,
    required this.timePeriod,
    required this.isProcessed,
  });

  @override
  String get dropdownId => id.toString();
  String get dropdownTitle => timePeriod.toString();
}
