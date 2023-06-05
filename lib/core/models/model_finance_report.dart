import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseFinanceReport extends ResponseData {
  ResponseFinanceReport({
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
    required this.result,
  });

  @JsonProperty(name: 'Response')
  final RealTimeMetricsResponse? result;
}

@jsonSerializable
class RealTimeMetricsResponse {
  @JsonProperty(name: 'Actual')
  final RealTimeMetricsModel actualList;

  @JsonProperty(name: 'Eac')
  final RealTimeMetricsModel eacList;

  @JsonProperty(name: 'Delta')
  final RealTimeMetricsModel deltaList;

  @JsonProperty(name: 'Ode')
  final RealTimeMetricsModel odeList;

  @JsonProperty(name: 'ProjectDetails')
  final List<FinanceWbsModel> financeWbsList;

  RealTimeMetricsResponse({
    required this.actualList,
    required this.eacList,
    required this.deltaList,
    required this.odeList,
    required this.financeWbsList,
  });
}

@jsonSerializable
class RealTimeMetricsModel {
  @JsonProperty(name: 'Cci')
  final num cci;

  @JsonProperty(name: 'TotalCost')
  final num totalCost;

  @JsonProperty(name: 'Revenue')
  final num revenue;

  @JsonProperty(name: 'Billing')
  final num billing;

  RealTimeMetricsModel({
    required this.totalCost,
    required this.revenue,
    required this.billing,
    required this.cci,
  });
}

@jsonSerializable
class FinanceWbsModel {
  @JsonProperty(name: 'Id')
  final num id;

  @JsonProperty(name: 'ProjectName')
  final String projectName;

  @JsonProperty(name: 'Wbs')
  final String wbs;

  @JsonProperty(name: 'ClientName')
  final String clientName;

  FinanceWbsModel({
    required this.id,
    required this.projectName,
    required this.wbs,
    required this.clientName,
  });
}
