import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelOdeYearsByProject {
  @JsonProperty(name: 'ProjectId')
  final int projectId;

  ModelOdeYearsByProject({
    required this.projectId,
  });
}
