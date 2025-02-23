import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/shared_widgets/bounce_wrapper.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton.filled({
    super.key,
    required this.label,
    this.onPressed,
    this.enabled = true,
    this.buttonTheme,
  }) : type = ButtonType.filled;

  const AppButton.outlined({
    super.key,
    required this.label,
    this.onPressed,
    this.enabled = true,
    this.buttonTheme,
  }) : type = ButtonType.outlined;

  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  final AppButtonTheme? buttonTheme;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final theme = buttonTheme ?? context.theme.buttonTheme;

    return BounceWrapper.down(
      onTap: onPressed,
      enable: enabled,
      child: Container(
        height: theme.height,
        width: theme.width,
        padding: EdgeInsets.symmetric(
          horizontal: context.sizes.x3,
          vertical: context.sizes.x,
        ),
        decoration: BoxDecoration(
          color: _backgroundColor(theme),
          borderRadius: theme.borderRadius,
          border: Border.all(
            width: type._isOutlined ? theme.borderWidth : 0,
            color: _borderColor(theme) ?? _backgroundColor(theme) ?? Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: theme.labelStyle.copyWith(
              color: _textColor(theme),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Color? _borderColor(AppButtonTheme theme) {
    if (!enabled) return theme.accentColor;
    return theme.primaryColor;
  }

  Color? _backgroundColor(AppButtonTheme theme) {
    if (type._isFilled) return theme.primaryColor;
    return null;
  }

  Color _textColor(AppButtonTheme theme) {
    if (type._isOutlined && enabled) return theme.primaryColor;
    if (type._isOutlined && !enabled) return theme.accentColor;
    return theme.secondaryColor;
  }
}

enum ButtonType {
  filled,
  outlined;

  bool get _isFilled => this == ButtonType.filled;
  bool get _isOutlined => this == ButtonType.outlined;
}
