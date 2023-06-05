import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelRole {
  @JsonProperty(name: 'Role')
  final String? role;

  @JsonProperty(name: 'ProjectId')
  final int? projectId;

  ModelRole({this.role, this.projectId});
}
