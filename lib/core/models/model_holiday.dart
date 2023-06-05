import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseHoliday extends ResponseData {
  ResponseHoliday({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelHoliday>? result;
}

@jsonSerializable
class ModelHoliday {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'Date')
  final DateTime date;

  @JsonProperty(name: 'Type')
  final int type;

  @JsonProperty(name: 'TypeText')
  final String typeText;

  @JsonProperty(name: 'TenantId')
  final int tenantId;

  @JsonProperty(name: 'DayOfClose')
  final int dayOfClose;

  @JsonProperty(name: 'DayOfCloseText')
  final String dayOfCloseText;

  @JsonProperty(name: 'IsOptional')
  final bool isOptional;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  ModelHoliday({
    required this.id,
    required this.date,
    required this.type,
    required this.typeText,
    required this.tenantId,
    required this.dayOfClose,
    required this.dayOfCloseText,
    required this.isOptional,
    required this.isDeleted,
  });
}
