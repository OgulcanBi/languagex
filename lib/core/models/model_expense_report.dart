import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseExpenseReport extends ResponseData {
  ResponseExpenseReport({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelExpenseReport? result;
}

@jsonSerializable
class ModelExpenseReport {
  @JsonProperty(name: 'Draft')
  final int draft;
  @JsonProperty(name: 'Approved')
  final int approved;
  @JsonProperty(name: 'Pending')
  final int pending;
  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;
  @JsonProperty(name: 'Message')
  final String? message;
  @JsonProperty(name: 'ExpenseType')
  final int? expenseType;

  ModelExpenseReport({
    required this.draft,
    required this.approved,
    required this.pending,
    required this.timePeriod,
    this.message,
    this.expenseType,
  });
}
