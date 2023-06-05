import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_expense.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseExpenseForm extends ResponseData{
  ResponseExpenseForm({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelExpenseForm>? result;
}

@jsonSerializable
class ResponseExpenseFormDetail extends ResponseData{
  ResponseExpenseFormDetail({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelExpenseForm? result;
}

@jsonSerializable
class ModelExpenseForm {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'Username')
  final String? username;

  @JsonProperty(name: 'Enterprisename')
  final String? enterpriseName;

  @JsonProperty(name: 'ManagerEnterprisename')
  final String? managerEnterprisename;

  @JsonProperty(name: 'FormNo')
  final String? formNo;

  @JsonProperty(name: 'FormDescription')
  final String? formDescription;

  @JsonProperty(name: 'FormApproverDescription')
  final String? formApproverDescription;

  @JsonProperty(name: 'FormWBS')
  final String? formWBS;

  @JsonProperty(name: 'TimePeriod')
  final int? timePeriod;

  @JsonProperty(name: 'Status')
  final int? status;

  @JsonProperty(name: 'ApproverProcessDate')
  final DateTime? approverProcessDate;

  @JsonProperty(name: 'SendApprovementDate')
  final DateTime? sendApprovementDate;

  @JsonProperty(name: 'TenantId')
  final int tenantId;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'ClientProjectName')
  final String? clientProjectName;

  @JsonProperty(name: 'ApproverProcessDateText')
  final String? approverProcessDateText;

  @JsonProperty(name: 'SendApprovementDateText')
  final String? sendApprovementDateText;

  @JsonProperty(name: 'TotalAmount')
  final num? totalAmount;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  @JsonProperty(name: 'StatusText')
  final String? statusText;

  @JsonProperty(name: 'ProjectStatus')
  final int? projectStatus;

  @JsonProperty(name: 'ProjectStatusText')
  final String? projectStatusText;

  @JsonProperty(name: 'Expenses')
  final List<ModelExpense>? expenses;

  @JsonProperty(name: 'CreateDate')
  final DateTime? createDate;

  @JsonProperty(name: 'CreateUser')
  final String? createUser;

  @JsonProperty(name: 'LastUpdateDate')
  final DateTime? lastUpdateDate;

  @JsonProperty(name: 'LastUpdateUser')
  final String? lastUpdateUser;

  ModelExpenseForm({
    required this.id,
    required this.userId,
    this.username,
    this.enterpriseName,
    this.managerEnterprisename,
    this.formNo,
    this.formDescription,
    this.formApproverDescription,
    this.formWBS,
    this.timePeriod,
    this.status,
    this.approverProcessDate,
    this.sendApprovementDate,
    required this.tenantId,
    required this.projectId,
    this.clientProjectName,
    this.approverProcessDateText,
    this.sendApprovementDateText,
    this.totalAmount,
    required this.isDeleted,
    this.statusText,
    this.projectStatus,
    this.projectStatusText,
    this.expenses,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
  });
}
