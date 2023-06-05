import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/extensions/extension_string.dart';
import 'package:languagex/core/models/model_base_dropdown.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseUserList extends ResponseData {
  ResponseUserList({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelUser>? result;
}

@jsonSerializable
class ModelUserRequest {
  final String? username;

  ModelUserRequest({this.username});
}

@jsonSerializable
class ModelUser implements BaseDropdown {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'UserName')
  final String userName;

  @JsonProperty(name: 'EnterpriseName')
  final String enterpriseName;

  @JsonProperty(name: 'Name')
  final String name;

  @JsonProperty(name: 'SurName')
  final String surName;

  @JsonProperty(name: 'IsActive')
  final bool isActive;

  @JsonProperty(name: 'ManagerName')
  final String? managerName;

  ModelUser({
    required this.id,
    required this.userName,
    required this.surName,
    required this.name,
    required this.enterpriseName,
    required this.isActive,
    this.managerName,
  });
  
  @override
  String get dropdownId => id.toString();
  String get dropdownTitle => '${name.capitalize()} ${surName.capitalize()}';
}
