import 'package:languagex/core/models/model_expense_report.dart';
import 'package:languagex/core/models/model_finance_report.dart';
import 'package:languagex/core/models/model_mobile_invoice_graphic_report.dart';
import 'package:languagex/core/models/model_mobile_invoice_graphic_time_periods.dart';
import 'package:languagex/core/models/model_timesheet_period_status.dart';
import 'package:languagex/core/services/service_api.dart';
import 'package:languagex/ui/base/base_view_model.dart';

import '../../../core/enums/enum_app.dart';
import '../../../core/models/model_dropdown.dart';
import '../../../core/models/model_notification.dart';
import '../../../core/models/model_timesheet_graphs.dart';

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

  ViewModelFragmentHome(this.serviceApi) {
    init();
  }

  Future<void> init() async {
  }

}
