import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseGraphicPeriods extends ResponseData {
  ResponseGraphicPeriods({
    required this.responseGraphicPeriodsTypes,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
    required super.isSuccess,
  });

  @JsonProperty(name: 'Response')
  ResponseGraphicPeriodsTypes? responseGraphicPeriodsTypes;
}

@jsonSerializable
class ResponseGraphicPeriodsTypes {
  ResponseGraphicPeriodsTypes({
    required this.months,
    required this.quarters,
    required this.years,
  });

  @JsonProperty(name: 'Months')
  List<ResponseGraphicPeriodsData> months;
  @JsonProperty(name: 'Quarters')
  List<ResponseGraphicPeriodsData> quarters;
  @JsonProperty(name: 'Years')
  List<ResponseGraphicPeriodsData> years;
}

@jsonSerializable
class ResponseGraphicPeriodsData {
  ResponseGraphicPeriodsData({
    required this.header,
    required this.value,
    required this.selected,
  });

  @JsonProperty(name: 'Header')
  final String header;
  @JsonProperty(name: 'Value')
  final int value;
  @JsonProperty(name: 'Selected')
  final bool selected;
}
