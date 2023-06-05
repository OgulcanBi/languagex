import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelExpenseRequest {
  @JsonProperty(name: 'ExpenseType')
  final int expenseType;

  @JsonProperty(name: 'SendApprovementDate')
  final DateTime? sendApprovementDate;

  @JsonProperty(name: 'Status')
  final int? status;

  @JsonProperty(name: 'ProjectId')
  final int? projectId;

  @JsonProperty(name: 'UserId')
  final int? userId;
  
  @JsonProperty(name: 'ClientId')
  final int? clientId;
  
  @JsonProperty(name: 'Category')
  final String? category;
  
  @JsonProperty(name: 'TimePeriod')
  final int? timePeriod;

  ModelExpenseRequest({
    required this.expenseType,
    this.sendApprovementDate,
    this.status,
    this.projectId,
    this.userId,
    this.clientId,
    this.category,
    this.timePeriod,
  });
}
