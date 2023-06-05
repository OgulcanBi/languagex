enum PermissionExpenseApprovement {
  doAllProjectExpenseApprovement('DoAllProjectExpenseApprovement'),
  doProjectExpenseApprovement('DoProjectExpenseApprovement');

  const PermissionExpenseApprovement(this.value);

  final String value;
}

enum PermissionExpense {
  doProjectExpenseEntry('DoProjectExpenseEntry'),
  doAllProjectExpenseApprovement('DoAllProjectExpenseApprovement'),
  doProjectExpenseApprovement('DoProjectExpenseApprovement');

  const PermissionExpense(this.value);

  final String value;
}

enum PermissionTimesheet {
  doProjectTimesheetEntry('DoProjectTimesheetEntry');

  const PermissionTimesheet(this.value);

  final String value;
}

enum PermissionTimesheetStatus {
  doAllProjectTimesheetEntry('DoAllProjectTimesheetEntry'),
  doProjectTimesheetEntry('DoProjectTimesheetEntry');

  const PermissionTimesheetStatus(this.value);

  final String value;
}

enum PermissionFinanceGraph {
  reportProjectForecastCostCCI('ReportProjectForecastCostCCI'),
  reportProjectForecastIncome('ReportProjectForecastIncome'),
  reportAllCompanyForecastCostCCI('ReportAllCompanyForecastCostCCI'),
  reportAllCompanyForecastIncome('ReportAllCompanyForecastIncome');

  const PermissionFinanceGraph(this.value);

  final String value;
}

enum PermissionForecast {
  doAllProjectApprovement('DoAllProjectApprovement'),
  doProjectApprovement('DoProjectApprovement'),
  doFcForecastApprovement('DoFcForecastApprovement');

  const PermissionForecast(this.value);

  final String value;
}

enum PermissionBilling {
  reportAllInvoice('ReportAllInvoice'),
  reportProjectInvoice('ReportProjectInvoice');

  const PermissionBilling(this.value);

  final String value;
}

enum ForecastApproverRole {
  doFcForecastApprovement('DoFcForecastApprovement');

  const ForecastApproverRole(this.value);

  final String value;
}
