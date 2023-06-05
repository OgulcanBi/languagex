import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelUpdateExpenseForm {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'FormNo')
  final String formNo;

  @JsonProperty(name: 'FormDescription')
  final String formDescription;

  @JsonProperty(name: 'FormWBS')
  final String formWBS;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  ModelUpdateExpenseForm({
    required this.id,
    required this.formNo,
    required this.formDescription,
    required this.formWBS,
    required this.projectId,
  });
}
