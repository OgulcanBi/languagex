import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/response_data.dart';

import 'model_forecast_approvement_with_definition_list.dart';

@jsonSerializable
class ResponseForecastEacDetail extends ResponseData {
  ResponseForecastEacDetail({
    required this.forecastDetail,
    required super.isSuccess,
    super.errorCode,
    super.errorMessage,
    super.transactionCode,
  });

  @JsonProperty(name: 'Response')
  final ModelForecastDetail? forecastDetail;
}

@jsonSerializable
class ModelForecastDetail {
  ModelForecastDetail({
    required this.id,
    required this.projectId,
    required this.billing,
    required this.chargeableCost,
    required this.revenue,
    required this.totalCost,
    required this.payroll,
    required this.expense,
    required this.solutionContingency,
    required this.capitalCharge,
    required this.otherCost,
    required this.cci,
    required this.cciPercent,
    required this.collection,
    required this.forecastApprovementWithDefinition,
    required this.isFCApproverMessageVisable,
    required this.isFCApproverMessageEnabled,
    required this.isApproverMessageEnabled,
  });

  @JsonProperty(name: 'Id')
  final num id;

  @JsonProperty(name: 'ProjectId')
  final num projectId;

  @JsonProperty(name: 'Billing')
  final ModelRowValues billing;

  @JsonProperty(name: 'ChargeableCost')
  final ModelRowValues chargeableCost;

  @JsonProperty(name: 'Revenue')
  final ModelRowValues revenue;

  @JsonProperty(name: 'TotalCost')
  final ModelRowValues totalCost;

  @JsonProperty(name: 'Payroll')
  final ModelRowValues payroll;

  @JsonProperty(name: 'Expense')
  final ModelRowValues expense;

  @JsonProperty(name: 'SolutionContingency')
  final ModelRowValues solutionContingency;

  @JsonProperty(name: 'CapitalCharge')
  final ModelRowValues capitalCharge;

  @JsonProperty(name: 'OtherCost')
  final ModelRowValues otherCost;

  @JsonProperty(name: 'CCI')
  final ModelRowValues cci;

  @JsonProperty(name: 'CCIPercent')
  final ModelRowValues cciPercent;

  @JsonProperty(name: 'Collection')
  final ModelRowValues collection;

  @JsonProperty(name: 'ForecastDetail')
  final ModelForecastApprovementWithDefinition? forecastApprovementWithDefinition;

  @JsonProperty(name: 'IsFCApproverMessageVisable')
  final bool? isFCApproverMessageVisable;

  @JsonProperty(name: 'IsFCApproverMessageEnabled')
  final bool? isFCApproverMessageEnabled;

  @JsonProperty(name: 'IsApproverMessageEnabled')
  final bool? isApproverMessageEnabled;
}

@jsonSerializable
class ModelRowValues {
  ModelRowValues({
    required this.headerText,
    required this.rowType,
    required this.atdValue,
    required this.etcValue,
    required this.eacValue,
    required this.odeValue,
    required this.variance,
  });

  @JsonProperty(name: 'HeaderText')
  final String headerText;

  @JsonProperty(name: 'RowType')
  final ModelRowType rowType;

  @JsonProperty(name: 'ATDValue')
  final num atdValue;

  @JsonProperty(name: 'ETCValue')
  final num etcValue;

  @JsonProperty(name: 'EACValue')
  final num eacValue;

  @JsonProperty(name: 'ODEValue')
  final num odeValue;

  @JsonProperty(name: 'Variance')
  final num variance;
}

@jsonSerializable
class ModelRowType {
  ModelRowType({
    required this.elementIndex,
    required this.value,
    required this.isEditable,
    required this.variableType,
    required this.field,
    required this.innerField,
  });

  @JsonProperty(name: 'ElementIndex')
  final num elementIndex;

  @JsonProperty(name: 'Value')
  final num value;

  @JsonProperty(name: 'IsEditable')
  final bool isEditable;

  @JsonProperty(name: 'VariableType')
  final int variableType;

  @JsonProperty(name: 'Field')
  final num field;

  @JsonProperty(name: 'InnerField')
  final num innerField;
}
