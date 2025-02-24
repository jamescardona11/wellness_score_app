import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  CurrencyTextInputFormatter();

  static final NumberFormat format = NumberFormat.currency(
    symbol: '',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    final newString = format.format(num.tryParse(newText) ?? 0).trim();

    if (newText.trim().isEmpty || newText == '00' || newText == '000') {
      return const TextEditingValue(
        text: '0',
        selection: TextSelection.collapsed(offset: 1),
      );
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
