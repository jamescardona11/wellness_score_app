import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  final NumberFormat format;
  final bool enableNegative;

  CurrencyTextInputFormatter({
    required this.format,
    this.enableNegative = true,
  });

  num _newNum = 0;
  String _newString = '';
  bool _isNegative = false;

  void _formatter(String newText) {
    _newNum = _parseStrToNum(newText);
    _newString = (_isNegative ? '-' : '') + format.format(_newNum).trim();
  }

  num _parseStrToNum(String text) {
    num value = num.tryParse(text) ?? 0;
    if (format.decimalDigits! > 0) {
      value /= pow(10, format.decimalDigits!);
    }
    return value;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (enableNegative) {
      _isNegative = newValue.text.startsWith('-');
    } else {
      _isNegative = false;
    }

    String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    _formatter(newText);

    if (newText.trim().isEmpty || newText == '00' || newText == '000') {
      return TextEditingValue(
        text: _isNegative ? '-' : '',
        selection: TextSelection.collapsed(offset: _isNegative ? 1 : 0),
      );
    }

    return TextEditingValue(
      text: _newString,
      selection: TextSelection.collapsed(offset: _newString.length),
    );
  }
}
