import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelMobileInvoice {
  @JsonProperty(name: 'StartDate')
  final int startDate;

  @JsonProperty(name: 'EndDate')
  final int endDate;

  @JsonProperty(name: 'EngagementType')
  final int engagementType;

  @JsonProperty(name: 'Projects')
  final List<int> projects;

  @JsonProperty(name: 'Status')
  final int status;

  @JsonProperty(name: 'SubCompanyId')
  final int subCompanyId;

  @JsonProperty(name: 'ProjectClientBilling')
  final int projectClientBilling;

  @JsonProperty(name: 'ProjectServiceType')
  final int projectServiceType;

  ModelMobileInvoice({
    required this.startDate,
    required this.endDate,
    required this.engagementType,
    required this.projects,
    required this.status,
    required this.subCompanyId,
    required this.projectClientBilling,
    required this.projectServiceType,
  });
}
