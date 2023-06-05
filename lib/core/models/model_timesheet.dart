import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseTimesheet extends ResponseData {
  ResponseTimesheet({
    this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  List<ModelTimesheet>? result;
}

@jsonSerializable
class RequestTimesheet {
  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'Period', converterParams: {'format': 'yyyy-MM-ddThh:mm'})
  final DateTime period;

  const RequestTimesheet({
    required this.userId,
    required this.period,
  });
}

@jsonSerializable
class ModelCreateTimesheet {
  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'WBS')
  final String wbs;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'Period', converterParams: {'format': 'yyyy-MM-ddTHH:mm'})
  final DateTime period;

  @JsonProperty(name: 'ChargeDate', converterParams: {'format': 'yyyy-MM-ddTHH:mm'})
  final DateTime chargeDate;

  @JsonProperty(name: 'WorkTime')
  final int workTime;

  @JsonProperty(name: 'Status')
  int status;

  ModelCreateTimesheet({
    required this.userId,
    required this.wbs,
    required this.projectId,
    required this.period,
    required this.chargeDate,
    required this.workTime,
    required this.status,
  });
}

@jsonSerializable
class ModelTimesheet {
  @JsonProperty(name: 'Id')
  final int id;

  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'WBS')
  final String wbs;

  @JsonProperty(name: 'WbsClientProjectName')
  final String wbsClientProjectName;

  @JsonProperty(name: 'EnterpriseName')
  final String enterpriseName;

  @JsonProperty(name: 'ProjectId')
  final int projectId;

  @JsonProperty(name: 'Period', converterParams: {'format': 'yyyy-MM-ddTHH:mm'})
  final DateTime period;

  @JsonProperty(name: 'ChargeDate', converterParams: {'format': 'yyyy-MM-ddTHH:mm'})
  final DateTime chargeDate;

  @JsonProperty(name: 'WorkTime')
  final int workTime;

  @JsonProperty(name: 'WorkHour')
  final int workHour;

  @JsonProperty(name: 'Status')
  final int status;

  @JsonProperty(name: 'StatusText')
  final String? statusText;

  @JsonProperty(name: 'TenantId')
  final int tenantId;

  @JsonProperty(name: 'ProcessedTimePeriod')
  final int? processedTimePeriod;

  const ModelTimesheet({
    required this.id,
    required this.userId,
    required this.wbs,
    required this.wbsClientProjectName,
    required this.enterpriseName,
    required this.projectId,
    required this.period,
    required this.chargeDate,
    required this.workTime,
    required this.workHour,
    required this.status,
    this.statusText,
    required this.tenantId,
    this.processedTimePeriod,
  });
}
