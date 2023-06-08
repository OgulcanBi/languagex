import '../extensions/extension_string.dart';

class AppStrings {

  String getErrorMsg(String errorCode) => errorCode.tr();  

  final String appName = 'Languagex';
  final String turkish = 'turkish'.tr();
  final String english = 'english'.tr();
  final String ok = 'ok'.tr();
  final String cancel = 'cancel'.tr();
  final String january = 'january'.tr();
  final String february = 'february'.tr();
  final String march = 'march'.tr();
  final String april = 'april'.tr();
  final String may = 'may'.tr();
  final String june = 'june'.tr();
  final String july = 'july'.tr();
  final String august = 'august'.tr();
  final String september = 'september'.tr();
  final String october = 'october'.tr();
  final String november = 'november'.tr();
  final String december = 'december'.tr();
  final String genericError = 'genericError'.tr();
  final String networkError = 'networkError'.tr();
  final String connectionTimeOut = 'connectionTimeOut'.tr();
  final String accessStoragePermission = 'accessStoragePermission'.tr();
  final String accessCameraPermission = 'accessCameraPermission'.tr();
  final String accessGalleryPermission = 'accessGalleryPermission'.tr();
  final String accessLocationPermission = 'accessLocationPermission'.tr();

  final String error = 'error'.tr();
  final String errorAuthorization = '10107'.tr();
  final String refresh = 'refresh'.tr();

  final String loginTitle = 'loginTitle'.tr();
  final String loginSubtitle = 'loginSubtitle'.tr();
  final String email = 'email'.tr();
  final String enterYourEmail = 'enterYourEmail'.tr();
  final String enterYourPassword = 'enterYourPassword'.tr();
  final String password = 'password'.tr();
  String rememberForDays(String days) => 'rememberForDays'.tr(namedArgs: {'value': days});
  final String forgotPassword = 'forgotPassword'.tr();
  final String signIn = 'signIn'.tr();
  final String invalidEmail = 'invalidEmail'.tr();
  final String invalidPassword = 'invalidPassword'.tr();
  final String home = 'home'.tr();
  final String projectFinance = 'projectFinance'.tr();
  final String expense = 'expense'.tr();
  final String timesheet = 'timesheet'.tr();
  String welcomeBack(String name) =>  'welcomeBack'.tr(namedArgs: {'name': name});
  final String invoicePaidTitle = 'invoicePaidTitle'.tr();
  final String invoiceBilledTitle = 'invoiceBilledTitle'.tr();
  final String homeScreenDescription = 'homeScreenDescription'.tr();
  final String homeScreenRealTimeTitle = 'homeScreenRealTimeTitle'.tr();
  final String homeScreenInvoiceTitle = 'homeScreenInvoiceTitle'.tr();

  String homeScreenRemainingTimesheetTitle(String monthName) => 'homeScreenRemainingTimesheetTitle'.tr(namedArgs: {'name': monthName});
  final String indicatorOverdue = 'indicatorOverdue'.tr();
  final String indicatorSubmitted = 'indicatorSubmitted'.tr();
  final String seeDetails = 'seeDetails'.tr();
  final String wbsClient = 'wbsClient'.tr();
  final String revenue = 'revenue'.tr();
  final String billing = 'billing'.tr();
  final String cost = 'cost'.tr();
  final String cCI = 'cCI'.tr();
  final String expenses = 'expenses'.tr();
  final String expenseDesc = 'expenseDesc'.tr();
  final String newForm = 'newForm'.tr();
  final String yourExpenses = 'yourExpenses'.tr();
  final String approves = 'approves'.tr();
  final String dontHaveExpenseForm = 'dontHaveExpenseForm'.tr();
  final String dontHaveExpense = 'dontHaveExpense'.tr();
  final String dontHaveNotification = 'dontHaveNotification'.tr();
  final String createExpenseFormMsg = 'createExpenseFormMsg'.tr();
  final String notificationNotFoundMessage = 'notificationNotFoundMessage'.tr();
  final String search = 'search'.tr();

  final String createdNewest = 'createdNewest'.tr();
  final String createdOldest = 'createdOldest'.tr();
  final String clientAZ = 'clientAZ'.tr();
  final String clientZA = 'clientZA'.tr();
  final String expenseFormHighestFirst = 'expenseFormHighestFirst'.tr();
  final String expenseFormLowestFirst = 'expenseFormLowestFirst'.tr();
  final String searchWBS = 'searchWBS'.tr();
  final String notFound = 'notFound'.tr();
  final String addNewExpenseForm = 'addNewExpenseForm'.tr();
  final String wbs = 'wbs'.tr();
  final String formNo = 'formNo'.tr();
  final String description = 'description'.tr();
  final String expenseDescriptionHint = 'expenseDescriptionHint'.tr();
  final String createNew = 'createNew'.tr();
  final String updateForm = 'updateForm'.tr();
  final String camera = 'camera'.tr();
  final String gallery = 'gallery'.tr();
  final String documentPDF = 'documentPDF'.tr();
  final String whichSelectReceipt = 'whichSelectReceipt'.tr();
  final String expenseFormDetail = 'expenseFormDetail'.tr();
  final String sentForApproval = 'sentForApproval'.tr();
  final String errorCorporationNull = 'errorCorporationNull'.tr();
  final String errorCategoryNull = 'errorCategoryNull'.tr();
  final String errorDateNull = 'errorDateNull'.tr();
  final String errorAmountNull = 'errorAmountNull'.tr();
  final String errorCurrencyTypeNull = 'errorCurrencyTypeNull'.tr();
  final String receiptImage = 'receiptImage'.tr();
  final String max2ImagesOrFiles = 'max2ImagesOrFiles'.tr();
  final String click = 'click'.tr();
  final String clickAndUploadImage = 'clickAndUploadImage'.tr();
  final String corporation = 'corporation'.tr();
  final String searchCorporationHint = 'searchCorporationHint'.tr();
  final String category = 'category'.tr();
  final String pleaseSelectCategory = 'pleaseSelectCategory'.tr();
  final String receiptDate = 'receiptDate'.tr();
  final String pleaseSelectDate = 'pleaseSelectDate'.tr();
  final String amountForVAT = 'amountForVAT'.tr();
  final String amountWithoutVAT = 'amountWithoutVAT'.tr();
  final String pleaseTypeAmount = 'pleaseTypeAmount'.tr();
  final String currencyType = 'currencyType'.tr();
  final String select = 'select'.tr();
  final String vatRatio = 'vatRatio'.tr();
  final String billedTheClient = 'billedTheClient'.tr();
  final String save = 'save'.tr();
  final String friendlyReminder = 'friendlyReminder'.tr();

  String approveSendExpenseForm(String name) => 'approveSendExpenseForm'.tr(namedArgs: {'name': name});
  final String approveSendExpenseFormDesc = 'approveSendExpenseFormDesc'.tr();
  final String yesIamSureAndSendApproval = 'yesIamSureAndSendApproval'.tr();
  final String addAnotherExpense = 'addAnotherExpense'.tr();
  final String all = 'all'.tr();
  final String approved = 'approved'.tr();
  final String rejected = 'rejected'.tr();
  final String pendingApproval = 'pendingApproval'.tr();
  final String draft = 'draft'.tr();
  final String pending = 'pending'.tr();
  final String moreActions = 'moreActions'.tr();
  final String editExpenseForm = 'editExpenseForm'.tr();
  final String editTimeSheet = 'editTimeSheet'.tr();
  final String sendTheTimeSheet = 'sendTheTimeSheet'.tr();
  final String removeWbs = 'removeWbs'.tr();
  final String addNewWbs = 'addNewWbs'.tr();
  final String changeWbs = 'changeWbs'.tr();
  final String removeForm = 'removeForm'.tr();
  final String filterBy = 'filterBy'.tr();
  final String filterByStatus = 'filterByStatus'.tr();
  final String filterByFormDetail = 'filterByFormDetail'.tr();
  final String filterNow = 'filterNow'.tr();
  final String expenseDetail = 'expenseDetail'.tr();
  final String formRemoved = 'formRemoved'.tr();
  final String formSendToApproval = 'formSendToApproval'.tr();

  //Forgot Password
  final String resetYourPassWord = 'resetYourPassWord'.tr();
  final String enterResetEmail = 'enterResetEmail'.tr();
  final String backToSignIn = 'backToSignIn'.tr();
  final String resetPassword = 'resetPassword'.tr();
  final String resetLinkSent = 'resetLinkSent'.tr();
  final String resetLinkResent = 'resetLinkResent'.tr();
  final String checkYourEmail = 'checkYourEmail'.tr();
  final String notReceivedMail = 'notReceivedMail'.tr();
  final String checkYourInbox = 'checkYourInbox'.tr();
  final String newPasswordSubtitle = 'newPasswordSubtitle'.tr();
  final String newPasswordConditionLabel = 'newPasswordConditionLabel'.tr();
  final String newPasswordHintTitle = 'newPasswordHintTitle'.tr();
  final String newPasswordHintLabel = 'newPasswordHintLabel'.tr();
  final String checkPasswordHintTitle = 'checkPasswordHintTitle'.tr();
  final String checkPasswordErrorLabel = 'checkPasswordErrorLabel'.tr();
  final String checkPasswordIsSmallerThenFifteen = 'checkPasswordIsSmallerThenFifteen'.tr();
  final String checkPasswordHintLabel = 'checkPasswordHintLabel'.tr();
  final String selectEmailApp = 'selectEmailApp'.tr();
  final String emailAppNotFount = 'emailAppNotFount'.tr();
  final String passwordWeak = 'passwordWeak'.tr();
  final String passwordMedium = 'passwordMedium'.tr();
  final String passwordStrong = 'passwordStrong'.tr();
  final String passwordChangedSuccessfully = 'passwordChangedSuccessfully'.tr();
  final String tryWithNewPassword = 'tryWithNewPassword'.tr();
  final String refreshPasswordLinkExpired = 'refreshPasswordLinkExpired'.tr();
  final String delete = 'delete'.tr();
  final String sort = 'sort'.tr();
  final String period = 'period'.tr();
  final String periods = 'periods'.tr();
  final String notificationsTitle = 'notificationsTitle'.tr();
  final String notificationsUnread = 'notificationsUnread'.tr();
  String notificationsNew(String value) => 'notificationsNew'.tr(namedArgs: {'value': value});
  final String addNewExpense = 'addNewExpense'.tr();
  final String dontHaveFinanceForm = 'dontHaveFinanceForm'.tr();
  final String clientOrWbs = 'clientOrWbs'.tr();
  final String projectFinanceTitle = 'projectFinanceTitle'.tr();
  final String projectFinanceDescription = 'projectFinanceDescription'.tr();
  final String forecastDetailTitle = 'forecastDetailTitle'.tr();
  final String forecastNotesTitle = 'forecastNotesTitle'.tr();
  final String forecastReject = 'forecastReject'.tr();
  final String forecastApprove = 'forecastApprove'.tr();
  final String forecastReplyHint = 'forecastReplyHint'.tr();
  final String forecastApproveButtonText = 'forecastApproveButtonText'.tr();
  final String forecastApproved = 'forecastApproved'.tr();
  final String forecastRejectButtonText = 'forecastRejectButtonText'.tr();
  final String forecastRejected = 'forecastRejected'.tr();
  final String forecastRejectHelperText = 'forecastRejectHelperText'.tr();
  final String forecastApproveHelperText = 'forecastApproveHelperText'.tr();
  final String forecastReplyRejectTitle = 'forecastReplyRejectTitle'.tr();
  final String forecastReplyApproveTitle = 'forecastReplyApproveTitle'.tr();
  final String forecastSelectOdePeriod = 'forecastSelectOdePeriod'.tr();
  final String forecastOwnerTitle = 'forecastOwnerTitle'.tr();
  final String odeTitle = 'odeTitle'.tr();
  final String deltaTitle = 'deltaTitle'.tr();
  final String categoryTitle = 'categoryTitle'.tr();
  final String actualTitle = 'actualTitle'.tr();
  final String etcTitle = 'etcTitle'.tr();
  final String eacTitle = 'eacTitle'.tr();
  final String forecastRole = 'forecastRole'.tr();
  final String manager = 'manager'.tr();
  final String forecastSender = 'forecastSender'.tr();
  final String forecastFinancialController = 'forecastFinancialController'.tr();
  final String forecastApprover = 'forecastApprover'.tr();
  final String forecastNoMessage = 'forecastNoMessage'.tr();
  final String expenseNoMessage = 'expenseNoMessage'.tr();
  final String forecastReview = 'forecastReview'.tr();
  final String expenseReview = 'expenseReview'.tr();
  final String forecastDefaultOdeName = 'forecastDefaultOdeName'.tr();
  final String selectPeriod = 'selectPeriod'.tr();
  final String timeSheetSummaryTitle = 'timeSheetSummaryTitle'.tr();
  final String timeSheetSubmissionTitle = 'timeSheetSubmissionTitle'.tr(); // türkçesi eklenmemiş
  final String timeSheetSummaryDesc = 'timeSheetSummaryDesc'.tr();
  final String annualLeaveDesc = 'annualLeaveDesc'.tr();
  final String overviewTitle = 'overviewTitle'.tr();
  final String annualLeaveTitle = 'annualLeaveTitle'.tr();
  final String timeSheetGraphTargetTitle = 'timeSheetGraphTargetTitle'.tr();
  final String timeSheetGraphChargeablityTitle = 'timeSheetGraphChargeablityTitle'.tr();
  final String monthlyFilter = 'monthlyFilter'.tr();
  final String quarterlyFilter = 'quarterlyFilter'.tr();
  final String yearlyFilter = 'yearlyFilter'.tr();
  final String adjusted = 'adjusted'.tr();
  final String submitted = 'submitted'.tr();
  final String processed = 'processed'.tr();
  final String updated = 'updated'.tr();
  String remainingHours(String value) => 'remainingHours'.tr(namedArgs: {'value': value});
  String week(String value) => 'week'.tr(namedArgs: {'value': value});
  String hours(String value) => 'hours'.tr(namedArgs: {'value': value});
  final String saveDraft = 'saveDraft'.tr();
  final String send = 'send'.tr();
  final String succesMessage = 'succesMessage'.tr();
  final String timesheetSpecificRangeError = 'timesheetSpecificRangeError'.tr();
  final String confirmDelete = 'confirmDelete'.tr();
  final String clear = 'clear'.tr();
  final String confirmLogout = 'confirmLogout'.tr();
  final String pleaseAddRejectReason = 'pleaseAddRejectReason'.tr();
  final String user = 'user'.tr();
  final String pleaseUpdateApp = 'pleaseUpdateApp'.tr();

  String versionCheckMessage(String value) => 'versionCheckMessage'.tr(namedArgs: {'value': value});
  final String labelModeulesTimesheetClosed = 'labelModeulesTimesheetClosed'.tr();
  final String labelModeulesExpenseClosed = 'labelModeulesExpenseClosed'.tr();
  final String labelModeulesFinanceClosed = 'labelModeulesFinanceClosed'.tr();






  final String writing = 'writing'.tr();
  final String test = 'test'.tr();
  final String speaking = 'speaking'.tr();






}