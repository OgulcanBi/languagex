import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class ModelExpenseRejectOrConfirm {
  @JsonProperty(name: 'Id')
  final int id;
  
  @JsonProperty(name: 'UserId')
  final int userId;
  
  @JsonProperty(name: 'Username')
  final String username;
  
  @JsonProperty(name: 'FormNo')
  final String formNo;
  
  @JsonProperty(name: 'Description')
  final String description;
  
  @JsonProperty(name: 'Status')
  final int status;


  ModelExpenseRejectOrConfirm({
    required this.id,
    required this.userId,
    required this.username,
    required this.formNo,
    required this.description,
    required this.status,
  });
}
