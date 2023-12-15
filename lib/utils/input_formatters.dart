import 'package:flutter/services.dart';

class NoSpaceAtEndInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final bool endsWithSpace = newValue.text.endsWith(' ');

    if (endsWithSpace) {
      return oldValue;
    }

    return newValue;
  }
}
