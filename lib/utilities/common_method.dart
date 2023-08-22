import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonMethod {
  CommonMethod._();

  static String numberFormat(String stringNumber) {
    return NumberFormat.decimalPattern().format(num.parse(stringNumber)
        // int.parse(stringNumber)
        // double.parse(stringNumber)
        );
  }

  static void numberFormatForTextEditing(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      String string =
          CommonMethod.numberFormat(controller.text.replaceAll(',', ''));
      controller.text = string;
    }
  }
}
