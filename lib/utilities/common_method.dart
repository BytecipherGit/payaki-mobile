import 'package:intl/intl.dart';

class CommonMethod {
  CommonMethod._();

  static String numberFormat(String stringNumber) {
    return NumberFormat.decimalPattern().format(num.parse(stringNumber));
  }
}
