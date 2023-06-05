import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelExpenseFormExport {
  @JsonProperty(name: 'ExpenseFormId')
  final int expenseFormId;

  ModelExpenseFormExport({
    required this.expenseFormId,
  });
}
