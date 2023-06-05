import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseGraphicChargeability extends ResponseData {
  ResponseGraphicChargeability({
    required this.responseGraphicList,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
    required super.isSuccess,
  });

  @JsonProperty(name: 'Response')
  List<ResponseGraphicModel>? responseGraphicList;
}

@jsonSerializable
class ResponseGraphicModel {
  ResponseGraphicModel({
    required this.data,
  });

  @JsonProperty(name: 'Data')
  ResponseGraphicData data;
}

@jsonSerializable
class ResponseGraphicData {
  ResponseGraphicData({
    required this.chartText,
    required this.headers,
    required this.bgColors,
    required this.value,
    required this.gridType,
    required this.startPeriod,
    required this.endPeriod,
  });

  @JsonProperty(name: 'ChartText')
  final String chartText;
  @JsonProperty(name: 'Headers')
  final List<String> headers;
  @JsonProperty(name: 'BgColors')
  final List<String> bgColors;
  @JsonProperty(name: 'Value')
  final List<num> value;
  @JsonProperty(name: 'GridType')
  final int gridType;
  @JsonProperty(name: 'StartPeriod')
  final int startPeriod;
  @JsonProperty(name: 'EndPeriod')
  final int endPeriod;
}
