import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wellness_score_app/ui/widgets/text/input/currency_text_input_formatter.dart';

void main() {
  late CurrencyTextInputFormatter formatter;

  setUp(() {
    formatter = CurrencyTextInputFormatter();
  });

  TextEditingValue createTextEditingValue(String text) {
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  group('CurrencyTextInputFormatter', () {
    test('should format whole numbers correctly', () {
      final result = formatter.formatEditUpdate(
        createTextEditingValue(''),
        createTextEditingValue('1234'),
      );

      expect(result.text, '1,234');
    });

    test('should handle empty input', () {
      final result = formatter.formatEditUpdate(
        createTextEditingValue('1,234'),
        createTextEditingValue(''),
      );

      expect(result.text, '0');
    });

    test('should remove non-numeric characters', () {
      final result = formatter.formatEditUpdate(
        createTextEditingValue(''),
        createTextEditingValue('1a2b3c4'),
      );

      expect(result.text, '1,234');
    });

    test('should format large numbers with correct thousand separators', () {
      final result = formatter.formatEditUpdate(
        createTextEditingValue(''),
        createTextEditingValue('1234567'),
      );

      expect(result.text, '1,234,567');
    });

    test('should maintain cursor position at end of input', () {
      final result = formatter.formatEditUpdate(
        createTextEditingValue(''),
        createTextEditingValue('1234'),
      );

      expect(result.selection.baseOffset, '1,234'.length);
      expect(result.selection.extentOffset, '1,234'.length);
    });
  });
}
