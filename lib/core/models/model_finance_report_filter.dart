import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelFinanceReportFilter {
  @JsonProperty(name: 'ReportGridModelType')
  final int? reportGridModelType;

  @JsonProperty(name: 'Projects')
  final List<int>? projects;

  @JsonProperty(name: 'StartDate')
  final int? startDate;

  @JsonProperty(name: 'EndDate')
  final int? endDate;

  ModelFinanceReportFilter({
    this.reportGridModelType,
    this.projects,
    this.startDate,
    this.endDate,
  });
}
