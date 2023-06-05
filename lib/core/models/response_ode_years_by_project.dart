import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

@jsonSerializable
class ResponseOdeYearsByProject extends ResponseData {
  ResponseOdeYearsByProject({
    required this.result,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final List<ModelOdePeriodItem>? result;
}

@jsonSerializable
class ModelOdePeriodItem {
  @JsonProperty(name: "Id")
  final int id;

  @JsonProperty(name: "ProjectId")
  final int projectId;

  @JsonProperty(name: "Billing")
  final num billing;

  @JsonProperty(name: "Revenue")
  final num revenue;

  @JsonProperty(name: "PayrollCost")
  final num payrollCost;

  @JsonProperty(name: "ExpenseCost")
  final num expenseCost;

  @JsonProperty(name: "SolutionContingencyCost")
  final num solutionContingencyCost;

  @JsonProperty(name: "CapitalChargeCost")
  final num capitalChargeCost;

  @JsonProperty(name: "OtherCost")
  final num otherCost;

  @JsonProperty(name: "ClientChargeableCost")
  final num clientChargeableCost;

  @JsonProperty(name: "CCI")
  final num cCI;

  @JsonProperty(name: "CCIPercent")
  final num cCIPercent;

  @JsonProperty(name: "Year")
  final int year;

  ModelOdePeriodItem({
    required this.id,
    required this.projectId,
    required this.billing,
    required this.revenue,
    required this.payrollCost,
    required this.expenseCost,
    required this.solutionContingencyCost,
    required this.capitalChargeCost,
    required this.otherCost,
    required this.clientChargeableCost,
    required this.cCI,
    required this.cCIPercent,
    required this.year,
  });
}
