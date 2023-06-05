import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_document.dart';


@jsonSerializable
class ModelExpense {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'ExpenseFormId')
  final int expenseFormId;

  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'Description')
  final String? description;

  @JsonProperty(name: 'Corporation')
  final String? corporation;

  @JsonProperty(name: 'Category')
  final String? category;

  @JsonProperty(name: 'CategoryText')
  final String? categoryText;

  @JsonProperty(name: 'ReceiptDate')
  final DateTime? receiptDate;

  @JsonProperty(name: 'ReceiptDateText')
  final String? receiptDateText;

  @JsonProperty(name: 'Amount')
  final num? amount;

  @JsonProperty(name: 'VatRate')
  final num? vatRate;

  @JsonProperty(name: 'AmountWithoutVat')
  final num? amountWithoutVat;

  @JsonProperty(name: 'Currency')
  final String? currency;

  @JsonProperty(name: 'IsChargeableToClient')
  final bool isChargeableToClient;

  @JsonProperty(name: 'TenantId')
  final int tenantId;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  @JsonProperty(name: 'Documents')
  final List<ModelDocument>? documents;

  @JsonProperty(name: 'CreateDate')
  final DateTime? createDate;

  @JsonProperty(name: 'CreateUser')
  final String? createUser;

  @JsonProperty(name: 'LastUpdateDate')
  final DateTime? lastUpdateDate;

  @JsonProperty(name: 'LastUpdateUser')
  final String? lastUpdateUser;

  ModelExpense({
    required this.id,
    required this.expenseFormId,
    required this.userId,
    this.description,
    this.corporation,
    this.category,
    this.categoryText,
    this.receiptDate,
    this.receiptDateText,
    this.amount,
    this.vatRate,
    this.amountWithoutVat,
    this.currency,
    required this.isChargeableToClient,
    required this.tenantId,
    required this.isDeleted,
    this.documents,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
  });
}
