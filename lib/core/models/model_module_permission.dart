import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'response_data.dart';

@jsonSerializable
class ResponseModulePermissionList extends ResponseData {
  ResponseModulePermissionList({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelModulePermission>? result;
}

@jsonSerializable
class ModelModulePermission {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'Type')
  final int type;

  @JsonProperty(name: 'IsOpen')
  final bool isOpen;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  ModelModulePermission({
    required this.id,
    required this.type,
    required this.isOpen,
    required this.isDeleted,
  });
}
