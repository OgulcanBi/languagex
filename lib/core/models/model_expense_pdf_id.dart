import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelExpensePdfById {
  @JsonProperty(name: 'ExpenseId')
  final int expenseId;

  ModelExpensePdfById({required this.expenseId});
}
