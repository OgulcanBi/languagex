import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelPermission {
  @JsonProperty(name: 'Permission')
  final String? permission;

  @JsonProperty(name: 'ProjectId')
  final int? projectId;

  ModelPermission({this.permission, this.projectId});
}
