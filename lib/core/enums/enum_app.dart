enum AppLanguage {
  locale(-1),
  en(0),
  tr(1);

  const AppLanguage(this.id);
  final int id;

  factory AppLanguage.fromId(int id) {
    return values.firstWhere((e) => e.id == id);
  }
}

enum ResponseType { error, success }

enum ActivityState { isLoading, isLoaded, isError }

enum ActivityErrorActionState { none, gotoBack, gotoLogin, logout }

enum Flavor {
  PROD('prod'),
  DEV('dev');

  const Flavor(this.value);
  final String value;
}

enum ExpenseType {
  your(0),
  approves(1);

  const ExpenseType(this.value);
  final int value;
}

enum ExpenseFormStatus {
  all(0),
  draft(1),
  reject(2),
  sentForApproval(3),
  approved(4);

  const ExpenseFormStatus(this.status);
  final int status;

  factory ExpenseFormStatus.fromStatus(int status) {
    return values.firstWhere((e) => e.status == status);
  }
}

enum ProjectStatus {
  active(1),
  passive(2),
  draft(3);

  const ProjectStatus(this.value);
  final int value;
}

enum ModuleType {
  timeSheet(1),
  expense(2),
  finance(3);

  const ModuleType(this.value);
  final int value;
}

enum FileType {
  camera(1),
  gallery(2),
  pdf(3);

  const FileType(this.value);

  final int value;
}

enum NotificationStatus {
  NotSent(1),
  Sent(2),
  Read(3);

  const NotificationStatus(this.value);
  final int value;

  factory NotificationStatus.fromStatus(int value) {
    return values.firstWhere((e) => e.value == value);
  }
}

enum GridType {
  year(1),
  month(2),
  quarter(3),
  target(4);

  const GridType(this.value);

  final int value;
}

enum FieldVariableType {
  money(1),
  text(2),
  number(3),
  percent(4);

  const FieldVariableType(this.value);

  final int value;
}

enum CurrencyFormatType {
  standard(''),
  thousand('K'),
  million('M');

  const CurrencyFormatType(this.value);
  final String value;
}

enum TimeSheetStatus {
  draft(1),
  updated(2),
  adjusted(3),
  submitted(4),
  processed(5);

  const TimeSheetStatus(this.status);
  final int status;

  factory TimeSheetStatus.fromStatus(int status) {
    return values.firstWhere((e) => e.status == status);
  }
}

enum ForecastStatus {
  waitingForApprove(1),
  approved(2),
  declined(3),
  fCWaitingForApprove(4),
  fCDeclined(5);

  const ForecastStatus(this.status);
  final int status;

  factory ForecastStatus.fromStatus(int status) {
    return values.firstWhere((e) => e.status == status);
  }
}

enum ReplyStatus {
  reject(1),
  approve(2);

  const ReplyStatus(this.status);
  final int status;

  factory ReplyStatus.fromStatus(int status) {
    return values.firstWhere((e) => e.status == status);
  }
}

enum ParameterType {
  vat(3),
  category(4),
  currency(6);

  const ParameterType(this.value);

  final int value;
}

enum CurrencyType {
  tl('TRY');

  const CurrencyType(this.value);
  final String value;
}

enum BarType {
  multiBarType('MULTI_BAR_TYPE'),
  odeBarType('ODE_BAR_TYPE');

  const BarType(this.value);

  final String value;
}

enum ThemeApperance { light, dark, system }

enum PasswordStrength { weak, medium, strong }

enum PlatformType {
  web(1),
  mobile(2);

  const PlatformType(this.value);
  final int value;
}

enum ViewType { edit, create, viewOnly }

enum TimesheetHoldiyatType {
  fullDay(1),
  halfDay(2);

  const TimesheetHoldiyatType(this.value);
  final int value;
}
