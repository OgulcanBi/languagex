import '../resources/_r.dart';

extension ExtensionNum on int? {
  int sum(int? value) => (this ?? 0) + (value ?? 0);
  String getMonthNameByPeriod() => ((this ?? 0) % 100).getMonthName();

  int getRoundedPercentage(int total) {
    if (this == null || total == 0) return 0;
    return (this!*100 / total).round();
  }

  String getMonthName() {
    List<String> monthList = [
      '',
      R.string.january,
      R.string.february,
      R.string.march,
      R.string.april,
      R.string.may,
      R.string.june,
      R.string.july,
      R.string.august,
      R.string.september,
      R.string.october,
      R.string.november,
      R.string.december,
    ];
    return monthList[this ?? 0];
  }
}
