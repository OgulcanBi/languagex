import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:languagex/core/models/model_change_password.dart';
import 'package:languagex/core/models/model_client.dart';
import 'package:languagex/core/models/model_expense.dart';
import 'package:languagex/core/models/model_forgot_password.dart';
import 'package:languagex/core/models/model_parameter.dart';
import 'package:languagex/core/models/model_timesheet.dart';
import 'package:languagex/core/models/model_timesheet_limit.dart';
import 'package:languagex/core/models/model_user.dart';
import 'package:languagex/core/models/model_user_wbs.dart';
import 'package:languagex/core/models/response_int.dart';
import 'package:languagex/core/models/response_string.dart';

import '/core/models/model_alert_dialog.dart';
import '../models/model_active_period.dart';
import '../models/model_check_timesheet.dart';
import '../models/model_create_expense.dart';
import '../models/model_create_expense_form.dart';
import '../models/model_document.dart';
import '../models/model_expense_form.dart';
import '../models/model_expense_form_export.dart';
import '../models/model_expense_form_request.dart';
import '../models/model_expense_pdf.dart';
import '../models/model_expense_pdf_id.dart';
import '../models/model_expense_reject_or_confirm.dart';
import '../models/model_expense_report.dart';
import '../models/model_expense_request.dart';
import '../models/model_finance_report.dart';
import '../models/model_finance_report_filter.dart';
import '../models/model_forecast_approval.dart';
import '../models/model_forecast_approve_or_rejecect.dart';
import '../models/model_forecast_approvement_with_definition_list.dart';
import '../models/model_forecast_eac_detail.dart';
import '../models/model_holiday.dart';
import '../models/model_id.dart';
import '../models/model_last_time_sheet_period.dart';
import '../models/model_login.dart';
import '../models/model_login_response.dart';
import '../models/model_mobile_invoice.dart';
import '../models/model_mobile_invoice_graphic_report.dart';
import '../models/model_mobile_invoice_graphic_time_periods.dart';
import '../models/model_module_permission.dart';
import '../models/model_notification.dart';
import '../models/model_period.dart';
import '../models/model_permission.dart';
import '../models/model_push_token.dart';
import '../models/model_refresh_access_token.dart';
import '../models/model_role.dart';
import '../models/model_send_expense_confirm.dart';
import '../models/model_tab.dart';
import '../models/model_timesheet_date.dart';
import '../models/model_timesheet_graphs.dart';
import '../models/model_timesheet_list.dart';
import '../models/model_timesheet_periods.dart';
import '../models/model_update_expense_form.dart';
import '../models/model_user_paid_time_off_balance.dart';
import '../models/model_valid_link.dart';
import '../models/response_data.dart';
import '../models/response_forecast_eac_detail.dart';
import '../models/response_graphic_chargeability.dart';
import '../models/response_graphic_time_periods.dart';
import '../models/response_ode_years_by_project.dart';
import '../models/response_user_timesheet_period.dart';
import '../models/response_valid_link.dart';

class ServiceJsonMapperContext {

  ServiceJsonMapperContext() {
    JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {

      typeOf<List<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),
      typeOf<Set<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),

      typeOf<List<ResponseData>>(): (value) => value.cast<ResponseData>(),
      typeOf<Set<ResponseData>>(): (value) => value.cast<ResponseData>(),

      typeOf<List<ModelLogin>>(): (value) => value.cast<ModelLogin>(),
      typeOf<Set<ModelLogin>>(): (value) => value.cast<ModelLogin>(),

      typeOf<List<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
      typeOf<Set<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
      
      typeOf<List<ResponseLogin>>(): (value) => value.cast<ResponseLogin>(),
      typeOf<Set<ResponseLogin>>(): (value) => value.cast<ResponseLogin>(),
      
      typeOf<List<ModelRefreshAccessToken>>(): (value) => value.cast<ModelRefreshAccessToken>(),
      typeOf<Set<ModelRefreshAccessToken>>(): (value) => value.cast<ModelRefreshAccessToken>(),
      
      typeOf<List<ResponseLastTimeSheetPeriod>>(): (value) => value.cast<ResponseLastTimeSheetPeriod>(),
      typeOf<Set<ResponseLastTimeSheetPeriod>>(): (value) => value.cast<ResponseLastTimeSheetPeriod>(),
      
      typeOf<List<ModelLastTimeSheetPeriod>>(): (value) => value.cast<ModelLastTimeSheetPeriod>(),
      typeOf<Set<ModelLastTimeSheetPeriod>>(): (value) => value.cast<ModelLastTimeSheetPeriod>(),
      
      typeOf<List<ResponseUserWBS>>(): (value) => value.cast<ResponseUserWBS>(),
      typeOf<Set<ResponseUserWBS>>(): (value) => value.cast<ResponseUserWBS>(),

      typeOf<List<ModelUserWBS>>(): (value) => value.cast<ModelUserWBS>(),
      typeOf<Set<ModelUserWBS>>(): (value) => value.cast<ModelUserWBS>(),
      
      typeOf<List<ResponseExpenseForm>>(): (value) => value.cast<ResponseExpenseForm>(),
      typeOf<Set<ResponseExpenseForm>>(): (value) => value.cast<ResponseExpenseForm>(),

      typeOf<List<ModelExpenseForm>>(): (value) => value.cast<ModelExpenseForm>(),
      typeOf<Set<ModelExpenseForm>>(): (value) => value.cast<ModelExpenseForm>(),

      typeOf<List<ModelExpense>>(): (value) => value.cast<ModelExpense>(),
      typeOf<Set<ModelExpense>>(): (value) => value.cast<ModelExpense>(),
      
      typeOf<List<ModelDocument>>(): (value) => value.cast<ModelDocument>(),
      typeOf<Set<ModelDocument>>(): (value) => value.cast<ModelDocument>(),

      typeOf<List<ModelCreateExpenseForm>>(): (value) => value.cast<ModelCreateExpenseForm>(),
      typeOf<Set<ModelCreateExpenseForm>>(): (value) => value.cast<ModelCreateExpenseForm>(),

       typeOf<List<ResponseString>>(): (value) => value.cast<ResponseString>(),
      typeOf<Set<ResponseString>>(): (value) => value.cast<ResponseString>(),

      typeOf<List<ResponseInt>>(): (value) => value.cast<ResponseInt>(),
      typeOf<Set<ResponseInt>>(): (value) => value.cast<ResponseInt>(),

      typeOf<List<ModelForgotPassword>>(): (value) => value.cast<ModelForgotPassword>(),
      typeOf<Set<ModelForgotPassword>>(): (value) => value.cast<ModelForgotPassword>(),

      typeOf<List<ModelChangePassword>>(): (value) => value.cast<ModelChangePassword>(),
      typeOf<Set<ModelChangePassword>>(): (value) => value.cast<ModelChangePassword>(),

      typeOf<List<ModelValidLink>>(): (value) => value.cast<ModelValidLink>(),
      typeOf<Set<ModelValidLink>>(): (value) => value.cast<ModelValidLink>(),

      typeOf<List<ResponseValidLink>>(): (value) => value.cast<ResponseValidLink>(),
      typeOf<Set<ResponseValidLink>>(): (value) => value.cast<ResponseValidLink>(),

      typeOf<List<ResponseExpenseFormDetail>>(): (value) => value.cast<ResponseExpenseFormDetail>(),
      typeOf<Set<ResponseExpenseFormDetail>>(): (value) => value.cast<ResponseExpenseFormDetail>(),

      typeOf<List<ResponseParameterList>>(): (value) => value.cast<ResponseParameterList>(),
      typeOf<Set<ResponseParameterList>>(): (value) => value.cast<ResponseParameterList>(),

      typeOf<List<ModelParameter>>(): (value) => value.cast<ModelParameter>(),
      typeOf<Set<ModelParameter>>(): (value) => value.cast<ModelParameter>(),

      typeOf<List<ModelParamaterRequest>>(): (value) => value.cast<ModelParamaterRequest>(),
      typeOf<Set<ModelParamaterRequest>>(): (value) => value.cast<ModelParamaterRequest>(),

      typeOf<List<ModelCreateExpense>>(): (value) => value.cast<ModelCreateExpense>(),
      typeOf<Set<ModelCreateExpense>>(): (value) => value.cast<ModelCreateExpense>(),

      typeOf<List<ModelUpdateExpense>>(): (value) => value.cast<ModelUpdateExpense>(),
      typeOf<Set<ModelUpdateExpense>>(): (value) => value.cast<ModelUpdateExpense>(),

      typeOf<List<ResponseCreateExpense>>(): (value) => value.cast<ResponseCreateExpense>(),
      typeOf<Set<ResponseCreateExpense>>(): (value) => value.cast<ResponseCreateExpense>(),

      typeOf<List<ModelCreateExpenseResponse>>(): (value) => value.cast<ModelCreateExpenseResponse>(),
      typeOf<Set<ModelCreateExpenseResponse>>(): (value) => value.cast<ModelCreateExpenseResponse>(),

      typeOf<List<ModelId>>(): (value) => value.cast<ModelId>(),
      typeOf<Set<ModelId>>(): (value) => value.cast<ModelId>(),

      typeOf<List<ModelSendExpenseConfirm>>(): (value) => value.cast<ModelSendExpenseConfirm>(),
      typeOf<Set<ModelSendExpenseConfirm>>(): (value) => value.cast<ModelSendExpenseConfirm>(),

      typeOf<List<ModelRole>>(): (value) => value.cast<ModelRole>(),
      typeOf<Set<ModelRole>>(): (value) => value.cast<ModelRole>(),

      typeOf<List<ModelUpdateExpenseForm>>(): (value) => value.cast<ModelUpdateExpenseForm>(),
      typeOf<Set<ModelUpdateExpenseForm>>(): (value) => value.cast<ModelUpdateExpenseForm>(),
      
      typeOf<List<ModelExpenseRejectOrConfirm>>(): (value) => value.cast<ModelExpenseRejectOrConfirm>(),
      typeOf<Set<ModelExpenseRejectOrConfirm>>(): (value) => value.cast<ModelExpenseRejectOrConfirm>(),
      
      typeOf<List<ModelExpenseFormRequest>>(): (value) => value.cast<ModelExpenseFormRequest>(),
      typeOf<Set<ModelExpenseFormRequest>>(): (value) => value.cast<ModelExpenseFormRequest>(),
      
      typeOf<List<ModelExpenseRequest>>(): (value) => value.cast<ModelExpenseRequest>(),
      typeOf<Set<ModelExpenseRequest>>(): (value) => value.cast<ModelExpenseRequest>(),
      
      typeOf<List<ResponsePeriodList>>(): (value) => value.cast<ResponsePeriodList>(),
      typeOf<Set<ResponsePeriodList>>(): (value) => value.cast<ResponsePeriodList>(),
      
      typeOf<List<ModelPeriod>>(): (value) => value.cast<ModelPeriod>(),
      typeOf<Set<ModelPeriod>>(): (value) => value.cast<ModelPeriod>(),
      
      typeOf<List<ResponseClientList>>(): (value) => value.cast<ResponseClientList>(),
      typeOf<Set<ResponseClientList>>(): (value) => value.cast<ResponseClientList>(),
      
      typeOf<List<ModelClient>>(): (value) => value.cast<ModelClient>(),
      typeOf<Set<ModelClient>>(): (value) => value.cast<ModelClient>(),
      
      typeOf<List<ResponseUserList>>(): (value) => value.cast<ResponseUserList>(),
      typeOf<Set<ResponseUserList>>(): (value) => value.cast<ResponseUserList>(),
      
      typeOf<List<ModelUser>>(): (value) => value.cast<ModelUser>(),
      typeOf<Set<ModelUser>>(): (value) => value.cast<ModelUser>(),
      
      typeOf<List<ModelUserRequest>>(): (value) => value.cast<ModelUserRequest>(),
      typeOf<Set<ModelUserRequest>>(): (value) => value.cast<ModelUserRequest>(),

      typeOf<List<ModelPushToken>>(): (value) => value.cast<ModelPushToken>(),
      typeOf<Set<ModelPushToken>>(): (value) => value.cast<ModelPushToken>(),

      typeOf<List<ResponseModulePermissionList>>(): (value) => value.cast<ResponseModulePermissionList>(),
      typeOf<Set<ResponseModulePermissionList>>(): (value) => value.cast<ResponseModulePermissionList>(),

      typeOf<List<ModelTimesheetGraph>>(): (value) => value.cast<ModelTimesheetGraph>(),
      typeOf<Set<ModelTimesheetGraph>>(): (value) => value.cast<ModelTimesheetGraph>(),

      typeOf<List<ResponseGraphicChargeability>>(): (value) => value.cast<ResponseGraphicChargeability>(),
      typeOf<Set<ResponseGraphicChargeability>>(): (value) => value.cast<ResponseGraphicChargeability>(),

      typeOf<List<ResponseGraphicModel>>(): (value) => value.cast<ResponseGraphicModel>(),
      typeOf<Set<ResponseGraphicModel>>(): (value) => value.cast<ResponseGraphicModel>(),

      typeOf<List<ResponseGraphicData>>(): (value) => value.cast<ResponseGraphicData>(),
      typeOf<Set<ResponseGraphicData>>(): (value) => value.cast<ResponseGraphicData>(),

      typeOf<List<ResponseGraphicPeriods>>(): (value) => value.cast<ResponseGraphicPeriods>(),
      typeOf<Set<ResponseGraphicPeriods>>(): (value) => value.cast<ResponseGraphicPeriods>(),

      typeOf<List<ResponseGraphicPeriodsData>>(): (value) => value.cast<ResponseGraphicPeriodsData>(),
      typeOf<Set<ResponseGraphicPeriodsData>>(): (value) => value.cast<ResponseGraphicPeriodsData>(),

      typeOf<List<ResponseGraphicPeriodsTypes>>(): (value) => value.cast<ResponseGraphicPeriodsTypes>(),
      typeOf<Set<ResponseGraphicPeriodsTypes>>(): (value) => value.cast<ResponseGraphicPeriodsTypes>(),

      typeOf<List<ResponseUserTimesheetPeriodList>>(): (value) => value.cast<ResponseUserTimesheetPeriodList>(),
      typeOf<Set<ResponseUserTimesheetPeriodList>>(): (value) => value.cast<ResponseUserTimesheetPeriodList>(),

      typeOf<List<TimesheetPeriod>>(): (value) => value.cast<TimesheetPeriod>(),
      typeOf<Set<TimesheetPeriod>>(): (value) => value.cast<TimesheetPeriod>(),

      typeOf<List<ModelTimesheetPeriods>>(): (value) => value.cast<ModelTimesheetPeriods>(),
      typeOf<Set<ModelTimesheetPeriods>>(): (value) => value.cast<ModelTimesheetPeriods>(),

      typeOf<List<ModelModulePermission>>(): (value) => value.cast<ModelModulePermission>(),
      typeOf<Set<ModelModulePermission>>(): (value) => value.cast<ModelModulePermission>(),

      typeOf<List<ModelTab>>(): (value) => value.cast<ModelTab>(),
      typeOf<Set<ModelTab>>(): (value) => value.cast<ModelTab>(),

      typeOf<List<ModelTimesheet>>(): (value) => value.cast<ModelTimesheet>(),
      typeOf<Set<ModelTimesheet>>(): (value) => value.cast<ModelTimesheet>(),

      typeOf<List<ResponseTimesheet>>(): (value) => value.cast<ResponseTimesheet>(),
      typeOf<Set<ResponseTimesheet>>(): (value) => value.cast<ResponseTimesheet>(),

      typeOf<List<RequestTimesheet>>(): (value) => value.cast<RequestTimesheet>(),
      typeOf<Set<RequestTimesheet>>(): (value) => value.cast<RequestTimesheet>(),
      
      typeOf<List<ResponseActivePeriod>>(): (value) => value.cast<ResponseActivePeriod>(),
      typeOf<Set<ResponseActivePeriod>>(): (value) => value.cast<ResponseActivePeriod>(),

      typeOf<List<ModelActivePeriod>>(): (value) => value.cast<ModelActivePeriod>(),
      typeOf<Set<ModelActivePeriod>>(): (value) => value.cast<ModelActivePeriod>(),

      typeOf<List<ModelForecastApproval>>(): (value) => value.cast<ModelForecastApproval>(),
      typeOf<Set<ModelForecastApproval>>(): (value) => value.cast<ModelForecastApproval>(),

      typeOf<List<ModelForecastApprovementWithDefinitionList>>(): (value) => value.cast<ModelForecastApprovementWithDefinitionList>(),
      typeOf<Set<ModelForecastApprovementWithDefinitionList>>(): (value) => value.cast<ModelForecastApprovementWithDefinitionList>(),

      typeOf<List<ModelForecastApprovementWithDefinition>>(): (value) => value.cast<ModelForecastApprovementWithDefinition>(),
      typeOf<Set<ModelForecastApprovementWithDefinition>>(): (value) => value.cast<ModelForecastApprovementWithDefinition>(),

      typeOf<List<ModelForeCastEacDetail>>(): (value) => value.cast<ModelForeCastEacDetail>(),
      typeOf<Set<ModelForeCastEacDetail>>(): (value) => value.cast<ModelForeCastEacDetail>(),

      typeOf<List<ModelRowType>>(): (value) => value.cast<ModelRowType>(),
      typeOf<Set<ModelRowType>>(): (value) => value.cast<ModelRowType>(),

      typeOf<List<ModelRowValues>>(): (value) => value.cast<ModelRowValues>(),
      typeOf<Set<ModelRowValues>>(): (value) => value.cast<ModelRowValues>(),

      typeOf<List<ModelForecastDetail>>(): (value) => value.cast<ModelForecastDetail>(),
      typeOf<Set<ModelForecastDetail>>(): (value) => value.cast<ModelForecastDetail>(),

      typeOf<List<ResponseForecastEacDetail>>(): (value) => value.cast<ResponseForecastEacDetail>(),
      typeOf<Set<ResponseForecastEacDetail>>(): (value) => value.cast<ResponseForecastEacDetail>(),

      typeOf<List<ResponseOdeYearsByProject>>(): (value) => value.cast<ResponseOdeYearsByProject>(),
      typeOf<Set<ResponseOdeYearsByProject>>(): (value) => value.cast<ResponseOdeYearsByProject>(),

      typeOf<List<ModelOdePeriodItem>>(): (value) => value.cast<ModelOdePeriodItem>(),
      typeOf<Set<ModelOdePeriodItem>>(): (value) => value.cast<ModelOdePeriodItem>(),

      typeOf<List<ModelForecastApproveOrReject>>(): (value) => value.cast<ModelForecastApproveOrReject>(),
      typeOf<Set<ModelForecastApproveOrReject>>(): (value) => value.cast<ModelForecastApproveOrReject>(),

      typeOf<List<ResponseNotification>>(): (value) => value.cast<ResponseNotification>(),
      typeOf<Set<ResponseNotification>>(): (value) => value.cast<ResponseNotification>(),

      typeOf<List<ModelNotification>>(): (value) => value.cast<ModelNotification>(),
      typeOf<Set<ModelNotification>>(): (value) => value.cast<ModelNotification>(),
      
      typeOf<List<ModelTimesheetList>>(): (value) => value.cast<ModelTimesheetList>(),
      typeOf<Set<ModelTimesheetList>>(): (value) => value.cast<ModelTimesheetList>(),
      
      typeOf<List<ResponseHoliday>>(): (value) => value.cast<ResponseHoliday>(),
      typeOf<Set<ResponseHoliday>>(): (value) => value.cast<ResponseHoliday>(),
      
      typeOf<List<ModelHoliday>>(): (value) => value.cast<ModelHoliday>(),
      typeOf<Set<ModelHoliday>>(): (value) => value.cast<ModelHoliday>(),

      typeOf<List<ModelTimesheetController>>(): (value) => value.cast<ModelTimesheetController>(),
      typeOf<Set<ModelTimesheetController>>(): (value) => value.cast<ModelTimesheetController>(),
      
      typeOf<List<ModelTimesheetDate>>(): (value) => value.cast<ModelTimesheetDate>(),
      typeOf<Set<ModelTimesheetDate>>(): (value) => value.cast<ModelTimesheetDate>(),
      
      typeOf<List<ResponseTimesheetLimit>>(): (value) => value.cast<ResponseTimesheetLimit>(),
      typeOf<Set<ResponseTimesheetLimit>>(): (value) => value.cast<ResponseTimesheetLimit>(),
      
      typeOf<List<ModelTimesheetLimit>>(): (value) => value.cast<ModelTimesheetLimit>(),
      typeOf<Set<ModelTimesheetLimit>>(): (value) => value.cast<ModelTimesheetLimit>(),

      typeOf<List<ModelCreateTimesheet>>(): (value) => value.cast<ModelCreateTimesheet>(),
      typeOf<Set<ModelCreateTimesheet>>(): (value) => value.cast<ModelCreateTimesheet>(),
      
      typeOf<List<ModelCheckTimesheet>>(): (value) => value.cast<ModelCheckTimesheet>(),
      typeOf<Set<ModelCheckTimesheet>>(): (value) => value.cast<ModelCheckTimesheet>(),

      typeOf<List<ModelUserPaidTimeOfBalance>>(): (value) => value.cast<ModelUserPaidTimeOfBalance>(),
      typeOf<Set<ModelUserPaidTimeOfBalance>>(): (value) => value.cast<ModelUserPaidTimeOfBalance>(),

      typeOf<List<ResponseUserPaidTimeOfBalance>>(): (value) => value.cast<ResponseUserPaidTimeOfBalance>(),
      typeOf<Set<ResponseUserPaidTimeOfBalance>>(): (value) => value.cast<ResponseUserPaidTimeOfBalance>(),

      typeOf<List<FinanceWbsModel>>(): (value) => value.cast<FinanceWbsModel>(),
      typeOf<Set<FinanceWbsModel>>(): (value) => value.cast<FinanceWbsModel>(),

      typeOf<List<RealTimeMetricsModel>>(): (value) => value.cast<RealTimeMetricsModel>(),
      typeOf<Set<RealTimeMetricsModel>>(): (value) => value.cast<RealTimeMetricsModel>(),

      typeOf<List<RealTimeMetricsResponse>>(): (value) => value.cast<RealTimeMetricsResponse>(),
      typeOf<Set<RealTimeMetricsResponse>>(): (value) => value.cast<RealTimeMetricsResponse>(),

      typeOf<List<ResponseFinanceReport>>(): (value) => value.cast<ResponseFinanceReport>(),
      typeOf<Set<ResponseFinanceReport>>(): (value) => value.cast<ResponseFinanceReport>(),

      typeOf<List<ModelFinanceReportFilter>>(): (value) => value.cast<ModelFinanceReportFilter>(),
      typeOf<Set<ModelFinanceReportFilter>>(): (value) => value.cast<ModelFinanceReportFilter>(),

      typeOf<List<ResponseMobileInvoiceGraphicReport>>(): (value) => value.cast<ResponseMobileInvoiceGraphicReport>(),
      typeOf<Set<ResponseMobileInvoiceGraphicReport>>(): (value) => value.cast<ResponseMobileInvoiceGraphicReport>(),

      typeOf<List<ResponseInvoiceTimesheetPeriods>>(): (value) => value.cast<ResponseInvoiceTimesheetPeriods>(),
      typeOf<Set<ResponseInvoiceTimesheetPeriods>>(): (value) => value.cast<ResponseInvoiceTimesheetPeriods>(),

      typeOf<List<ModelTimesheetTimeResponse>>(): (value) => value.cast<ModelTimesheetTimeResponse>(),
      typeOf<Set<ModelTimesheetTimeResponse>>(): (value) => value.cast<ModelTimesheetTimeResponse>(),

      typeOf<List<ModelMobileInvoiceGraphicReportResponse>>(): (value) => value.cast<ModelMobileInvoiceGraphicReportResponse>(),
      typeOf<Set<ModelMobileInvoiceGraphicReportResponse>>(): (value) => value.cast<ModelMobileInvoiceGraphicReportResponse>(),

      typeOf<List<ModelCollection>>(): (value) => value.cast<ModelCollection>(),
      typeOf<Set<ModelCollection>>(): (value) => value.cast<ModelCollection>(),

      typeOf<List<ModelBilling>>(): (value) => value.cast<ModelBilling>(),
      typeOf<Set<ModelBilling>>(): (value) => value.cast<ModelBilling>(),

      typeOf<List<ModelMobileInvoice>>(): (value) => value.cast<ModelMobileInvoice>(),
      typeOf<Set<ModelMobileInvoice>>(): (value) => value.cast<ModelMobileInvoice>(),

      typeOf<List<ModelMobileInvoiceGraphicReportResponse>>(): (value) => value.cast<ModelMobileInvoiceGraphicReportResponse>(),
      typeOf<Set<ModelMobileInvoiceGraphicReportResponse>>(): (value) => value.cast<ModelMobileInvoiceGraphicReportResponse>(),

      typeOf<List<ResponseExpensePdf>>(): (value) => value.cast<ResponseExpensePdf>(),
      typeOf<Set<ResponseExpensePdf>>(): (value) => value.cast<ResponseExpensePdf>(),

      typeOf<List<ModelExpensePdfById>>(): (value) => value.cast<ModelExpensePdfById>(),
      typeOf<Set<ModelExpensePdfById>>(): (value) => value.cast<ModelExpensePdfById>(),
      typeOf<List<ModelExpenseFormExport>>(): (value) => value.cast<ModelExpenseFormExport>(),
      typeOf<Set<ModelExpenseFormExport>>(): (value) => value.cast<ModelExpenseFormExport>(),
      typeOf<List<ModelExpensePdf>>(): (value) => value.cast<ModelExpensePdf>(),
      typeOf<Set<ModelExpensePdf>>(): (value) => value.cast<ModelExpensePdf>(),
      typeOf<List<ModelPermission>>(): (value) => value.cast<ModelPermission>(),
      typeOf<Set<ModelPermission>>(): (value) => value.cast<ModelPermission>(),
      typeOf<List<ResponseExpenseReport>>(): (value) => value.cast<ResponseExpenseReport>(),
      typeOf<Set<ResponseExpenseReport>>(): (value) => value.cast<ResponseExpenseReport>(),
      typeOf<List<ModelExpenseReport>>(): (value) => value.cast<ModelExpenseReport>(),
      typeOf<Set<ModelExpenseReport>>(): (value) => value.cast<ModelExpenseReport>(),
    }));
  }
}
