import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseForecastApproval extends ResponseData {
  ResponseForecastApproval({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelForecastApprovementWithDefinitionList? result;
}

@jsonSerializable
class ModelForecastApprovementWithDefinitionList {
  @JsonProperty(name: 'ForecastApprovementWithDefinitionList')
  final List<ModelForecastApprovementWithDefinition> list;

  @JsonProperty(name: 'IsFCApproverMessageVisable')
  final bool isFCApproverMessageVisable;

  @JsonProperty(name: 'IsFCApproverMessageEnabled')
  final bool isFCApproverMessageEnabled;

  @JsonProperty(name: 'IsApproverMessageEnabled')
  final bool isApproverMessageEnabled;

  ModelForecastApprovementWithDefinitionList({
    required this.list,
    required this.isFCApproverMessageVisable,
    required this.isFCApproverMessageEnabled,
    required this.isApproverMessageEnabled,
  });
}

@jsonSerializable
class ModelForecastApprovementWithDefinition {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'TimePeriod')
  final int timePeriod;

  @JsonProperty(name: 'ClientName')
  final String clientName;

  @JsonProperty(name: 'ApproverEnterpriseName')
  final String? approverEnterpriseName;

  @JsonProperty(name: 'ProjectName')
  final String projectName;

  @JsonProperty(name: 'WBS')
  final String wBS;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'ForecastId')
  final int forecastId;

  @JsonProperty(name: 'SenderUserName')
  final String senderUserName;

  @JsonProperty(name: 'SenderEnterpriseName')
  final String senderEnterpriseName;

  @JsonProperty(name: 'Status')
  final int status;

  @JsonProperty(name: 'ApproverMessage')
  String? approverMessage;

  @JsonProperty(name: 'SenderMessage')
  final String senderMessage;

  @JsonProperty(name: 'FCApproverMessage')
  String? fcApproverMessage;

  @JsonProperty(name: 'StatusText')
  final String statusText;

  @JsonProperty(name: 'Currency')
  final String? currency;

  @JsonProperty(name: 'FCApproverEnterpriseName')
  final String? fCApproverEnterpriseName;

  ModelForecastApprovementWithDefinition({
    required this.id,
    required this.timePeriod,
    required this.clientName,
    required this.projectName,
    required this.wBS,
    required this.projectId,
    required this.forecastId,
    required this.senderUserName,
    required this.senderEnterpriseName,
    required this.status,
    this.approverMessage,
    required this.senderMessage,
    this.fcApproverMessage,
    required this.statusText,
    this.currency,
    this.approverEnterpriseName,
    this.fCApproverEnterpriseName,
  });
}
