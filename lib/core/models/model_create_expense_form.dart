import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelCreateExpenseForm {
  @JsonProperty(name: 'FormNo')
  final String formNo;

  @JsonProperty(name: 'FormDescription')
  final String formDescription;

  @JsonProperty(name: 'FormWBS')
  final String formWBS;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  ModelCreateExpenseForm({
    required this.formNo,
    required this.formDescription,
    required this.formWBS,
    required this.projectId,
  });
}
