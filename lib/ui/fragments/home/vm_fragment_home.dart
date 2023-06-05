import 'package:languagex/core/extensions/extension_list.dart';
import 'package:languagex/core/models/model_expense_report.dart';
import 'package:languagex/core/models/model_finance_report.dart';
import 'package:languagex/core/models/model_finance_report_filter.dart';
import 'package:languagex/core/models/model_mobile_invoice.dart';
import 'package:languagex/core/models/model_mobile_invoice_graphic_report.dart';
import 'package:languagex/core/models/model_mobile_invoice_graphic_time_periods.dart';
import 'package:languagex/core/models/model_timesheet_period_status.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/enums/enum_app.dart';
import '../../../core/enums/enum_permission.dart';
import '../../../core/models/model_chargeability_graph_item.dart';
import '../../../core/models/model_dropdown.dart';
import '../../../core/models/model_notification.dart';
import '../../../core/models/model_timesheet_graphs.dart';
import '../../../core/models/response_graphic_time_periods.dart';
import '../../../core/resources/_r.dart';

class ViewModelFragmentHome extends ViewModelBase {
  final ServiceApi serviceApi;
  String chartDateText = '';
  String invoiceDateText = '';
  int selectedIndex = GridType.month.value;
  List<ModelNotification> modelNotificationList = [];
  List<FinanceWbsModel> selectedWBS = [];
  List<ModelDropdown> monthlyList = [];
  List<ModelDropdown> quarterlyList = [];
  List<ModelDropdown> yearlyList = [];
  List<ModelDropdown> invoiceList = [];
  List<ModelTimesheetTimeResponse> modelTimesheetTimResponseList = [];
  ModelDropdown? selectedSort;
  ModelDropdown? selectedInvoicePeriod;
  ModelTimesheetGraph? modelTimesheetGraph;
  ResponseFinanceReport? responseFinanceReport;
  ModelExpenseReport? modelExpenseReport;
  ModelTimesheetPeriodStatus? modelTimesheetPeriodStatusResponse;
  ModelMobileInvoiceGraphicReportResponse? modelMobileInvoiceGraphicReportResponse;
  bool isBillingEnabled = PermissionBilling.values.hasAnyPermission();
  bool isForecastEnabled = PermissionFinanceGraph.values.hasAnyPermission();
  bool isTimesheetEnabled = PermissionTimesheet.values.hasAnyPermission();
  bool isTimeSheetStatusEnabled = PermissionTimesheetStatus.values.hasAnyPermission();

  ViewModelFragmentHome(this.serviceApi) {
    init();
  }

  Future<void> init() async {
  }

}
