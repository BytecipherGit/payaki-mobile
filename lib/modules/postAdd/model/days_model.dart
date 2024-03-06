import '../../../generated/l10n.dart';

class Day {
  final String name;
  final int value;

   Day(this.name, this.value);
}

 List<Day> daysList = [
  Day("1 ${S.current.days.toLowerCase()}", 1),
  Day("2 ${S.current.days.toLowerCase()}", 2),
  Day("5 ${S.current.days.toLowerCase()}", 5),
  Day("10 ${S.current.days.toLowerCase()}", 10),
  Day("20 ${S.current.days.toLowerCase()}", 20),
  Day("30 ${S.current.days.toLowerCase()}", 30),
  Day("45 ${S.current.days.toLowerCase()}", 45),
  Day("60 ${S.current.days.toLowerCase()}", 60)
];
