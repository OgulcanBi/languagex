import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseUserWBS extends ResponseData {
  ResponseUserWBS({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelUserWBS>? result;
}

@jsonSerializable
class ModelUserWBS {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'WBS')
  final String? wbs;

  @JsonProperty(name: 'Name')
  final String? name;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'UserId')
  final int? userId;

  @JsonProperty(name: 'ProjectName')
  final String? projectName;

  @JsonProperty(name: 'ProjectWbsName')
  final String? projectWbsName;

  @JsonProperty(name: 'ClientProjectName')
  final String? clientProjectName;

  @JsonProperty(name: 'ClientName')
  final String? clientName;

  @JsonProperty(name: 'UserName')
  final String? userName;

  @JsonProperty(name: 'IsHoliday')
  final bool? isHoliday;

  @JsonProperty(name: 'CreateDate')
  final DateTime? createDate;

  @JsonProperty(name: 'CreateUser')
  final String? createUser;

  @JsonProperty(name: 'LastUpdateDate')
  final DateTime? lastUpdateDate;

  @JsonProperty(name: 'LastUpdateUser')
  final String? lastUpdateUser;

  ModelUserWBS({
    required this.id,
    this.wbs,
    this.name,
    required this.projectId,
    this.userId,
    this.projectName,
    this.projectWbsName,
    this.clientProjectName,
    this.clientName,
    this.userName,
    this.isHoliday,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
  });
}
