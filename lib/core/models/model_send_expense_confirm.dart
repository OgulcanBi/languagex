import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class ModelSendExpenseConfirm {
  @JsonProperty(name: 'Id')
  final int id;
  
  @JsonProperty(name: 'FormNo')
  final String formNo;
  
  @JsonProperty(name: 'ProjectId')
  final int projectId;


  ModelSendExpenseConfirm({
    required this.id,
    required this.formNo,
    required this.projectId,
  });
}
