import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseNotification extends ResponseData {
  ResponseNotification({
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
    required this.result,
  });

  @JsonProperty(name: 'Response')
  final List<ModelNotification>? result;
}

@jsonSerializable
class ModelNotification {
  ModelNotification({
    required this.id,
    required this.subject,
    required this.content,
    required this.notificationStatus,
    required this.notificationType,
    required this.notificationTemplate,
    required this.receiver,
    required this.isDeleted,
    required this.projectName,
    required this.wbs,
    required this.clientName,
    required this.newClientName,
    required this.createDate,
    required this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
  });

  @JsonProperty(name: 'Id')
  final int? id;

  @JsonProperty(name: 'Subject')
  final String? subject;

  @JsonProperty(name: 'Content')
  final String? content;

  @JsonProperty(name: 'NotificationStatus')
  final int notificationStatus;

  @JsonProperty(name: 'NotificationType')
  final int notificationType;

  @JsonProperty(name: 'NotificationTemplate')
  final int notificationTemplate;

  @JsonProperty(name: 'Receiver')
  final int receiver;

  @JsonProperty(name: 'IsDeleted')
  final bool isDeleted;

  @JsonProperty(name: 'ProjectName')
  final String? projectName;

  @JsonProperty(name: 'WBS')
  final String? wbs;

  @JsonProperty(name: 'ClientName')
  final String? clientName;

  @JsonProperty(name: 'NewClientName')
  final String? newClientName;

  @JsonProperty(name: 'CreateDate')
  final DateTime createDate;

  @JsonProperty(name: 'CreateUser')
  final String createUser;

  @JsonProperty(name: 'LastUpdateDate')
  final DateTime? lastUpdateDate;

  @JsonProperty(name: 'LastUpdateUser')
  final String? lastUpdateUser;
}
