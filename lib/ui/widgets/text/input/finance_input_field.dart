import 'package:flutter/material.dart';
import 'package:wellness_score_app/config/assets/app_icons.dart';
import 'package:wellness_score_app/config/constants/en_text_constants.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';
import 'package:wellness_score_app/ui/widgets/text/app_text.dart';

import 'currency_text_input_formatter.dart';

class FinanceInputField extends StatelessWidget {
  const FinanceInputField({
    super.key,
    required this.label,
    required this.onChanged,
    this.action,
    this.theme,
    this.validatorMessage,
  });

  final String label;
  final ValueChanged<double> onChanged;
  final TextInputAction? action;
  final AppInputFieldTheme? theme;
  final String? validatorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? context.theme.inputFieldTheme;
    final sizes = context.sizes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.paragraph3(label),
        SizedBox(height: sizes.x1),
        SizedBox(
          width: theme.width,
          height: theme.height,
          child: TextFormField(
            maxLength: 17,
            onChanged: (value) => onChanged(_stringValueToDouble(value)),
            keyboardType: TextInputType.number,
            inputFormatters: [CurrencyTextInputFormatter()],
            textInputAction: action,
            style: theme.style,
            initialValue: '0',
            decoration: InputDecoration(
              counterText: '',
              contentPadding: theme.contentPadding,
              prefixIcon: Padding(
                padding: theme.iconPadding,
                child: Icon(
                  AppIcons.dollarIcon,
                  size: sizes.x6,
                  color: theme.iconColor,
                ),
              ),
              prefixIconConstraints: BoxConstraints.tightFor(height: sizes.x5),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: theme.borderColor),
                borderRadius: theme.borderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.borderColor),
                borderRadius: theme.borderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.borderColor),
                borderRadius: theme.borderRadius,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.errorBorderColor),
                borderRadius: theme.borderRadius,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || _stringValueToDouble(value) == 0) {
                return validatorMessage ?? TextConstants.enterValueGreaterThanZero;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  double _stringValueToDouble(String value) {
    return double.tryParse(value.replaceAll(',', '').replaceAll('.', '')) ?? 0;
  }
}
