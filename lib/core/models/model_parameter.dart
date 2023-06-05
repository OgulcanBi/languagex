import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

import 'model_base_dropdown.dart';

@jsonSerializable
class ResponseParameterList extends ResponseData {
  ResponseParameterList({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelParameter>? result;
}

@jsonSerializable
class ModelParamaterRequest {
  @JsonProperty(name: 'Type')
  final int type;

  @JsonProperty(name: 'Group')
  final String? group;

  ModelParamaterRequest({required this.type, this.group});
}

@jsonSerializable
class ModelParameter implements BaseDropdown{
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'Type')
  final int type;

  @JsonProperty(name: 'Code')
  final String code;

  @JsonProperty(name: 'Value')
  final String value;

  @JsonProperty(name: 'Group')
  final String? group;

  @JsonProperty(name: 'Order')
  final int? order;

  @JsonProperty(name: 'IsActive')
  final bool isActive;

  ModelParameter({
    required this.id,
    required this.type,
    required this.code,
    required this.value,
    this.group,
    this.order,
    required this.isActive,
  });
  
  @override
  String get dropdownId => id.toString();
  String get dropdownTitle => value;



}
