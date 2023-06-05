import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'model_document.dart';
import 'response_data.dart';


@jsonSerializable
class ResponseCreateExpense extends ResponseData {
  ResponseCreateExpense({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelCreateExpenseResponse? result;
}

@jsonSerializable
class ModelCreateExpenseResponse {
 @JsonProperty(name: 'Code')
  final String? code;

  @JsonProperty(name: 'Message')
  final String? message;

  ModelCreateExpenseResponse({this.code, this.message});
}

@jsonSerializable
class ModelCreateExpense {
  
  @JsonProperty(name: 'ExpenseFormId')
  final int expenseFormId;

  @JsonProperty(name: 'Corporation')
  final String corporation;

  @JsonProperty(name: 'Category')
  final String category;

  @JsonProperty(name: 'ReceiptDate')
  final String receiptDate;

  @JsonProperty(name: 'Amount')
  final double amount;

  @JsonProperty(name: 'VatRate')
  final int? vatRate;

  @JsonProperty(name: 'AmountWithoutVat')
  final double amountWithoutVat;

  @JsonProperty(name: 'Currency')
  final String currency;

  @JsonProperty(name: 'Description')
  final String? description;

  @JsonProperty(name: 'IsChargeableToClient')
  final bool isChargeableToClient;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'UploadExpenseDocument')
  final List<ModelDocument>? uploadExpenseDocument;

  ModelCreateExpense({
    required this.expenseFormId,
    required this.corporation,
    required this.category,
    required this.receiptDate,
    required this.amount,
    this.vatRate,
    required this.amountWithoutVat,
    required this.currency,
    this.description,
    required this.isChargeableToClient,
    required this.projectId,
    this.uploadExpenseDocument,
  });
}


@jsonSerializable
class ModelUpdateExpense {
  @JsonProperty(name: 'Id')
  final int? id;
  
  @JsonProperty(name: 'ExpenseFormId')
  final int expenseFormId;

  @JsonProperty(name: 'Corporation')
  final String corporation;

  @JsonProperty(name: 'Category')
  final String category;

  @JsonProperty(name: 'ReceiptDate')
  final String receiptDate;

  @JsonProperty(name: 'Amount')
  final double amount;

  @JsonProperty(name: 'VatRate')
  final int? vatRate;

  @JsonProperty(name: 'AmountWithoutVat')
  final double amountWithoutVat;

  @JsonProperty(name: 'Currency')
  final String currency;

  @JsonProperty(name: 'Description')
  final String? description;

  @JsonProperty(name: 'IsChargeableToClient')
  final bool isChargeableToClient;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'UploadExpenseDocument')
  final List<ModelDocument>? uploadExpenseDocument;

  ModelUpdateExpense({
    this.id,
    required this.expenseFormId,
    required this.corporation,
    required this.category,
    required this.receiptDate,
    required this.amount,
    this.vatRate,
    required this.amountWithoutVat,
    required this.currency,
    this.description,
    required this.isChargeableToClient,
    required this.projectId,
    this.uploadExpenseDocument,
  });
}