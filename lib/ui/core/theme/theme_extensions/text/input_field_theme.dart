import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

/// A theme extension for the input field widget.
///
/// This class extends [ThemeExtension] and defines the theme properties for the input field widget.
/// It includes properties for width, height, text style, content padding, icon padding, text color,
/// border color, error border color, icon color, and border radius.
///
/// Example usage:
/// ```dart
/// final inputFieldTheme = AppInputFieldTheme(
///   tokens: tokens,
/// );
/// ```

class AppInputFieldTheme extends ThemeExtension<AppInputFieldTheme> {
  final Tokens tokens;
  final double width;
  final double height;
  final TextStyle style;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry iconPadding;
  final Color textColor;
  final Color borderColor;
  final Color errorBorderColor;
  final Color iconColor;
  final BorderRadius borderRadius;

  AppInputFieldTheme({
    required this.tokens,
    double? width,
    double? height,
    TextStyle? style,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? iconPadding,
    Color? textColor,
    Color? borderColor,
    Color? errorBorderColor,
    Color? iconColor,
    BorderRadius? borderRadius,
  })  : width = width ?? double.infinity,
        height = height ?? tokens.sizes.x14,
        style = style ?? tokens.typography.headingLG.copyWith(color: tokens.colors.grey300),
        contentPadding = contentPadding ?? EdgeInsets.symmetric(horizontal: tokens.sizes.x3, vertical: tokens.sizes.x4),
        iconPadding = iconPadding ?? EdgeInsets.only(left: tokens.sizes.x3, right: tokens.sizes.x2),
        textColor = textColor ?? tokens.colors.grey300,
        borderColor = borderColor ?? tokens.colors.grey50,
        errorBorderColor = errorBorderColor ?? tokens.colors.red,
        iconColor = iconColor ?? tokens.colors.grey50,
        borderRadius = borderRadius ?? tokens.borders.x1;

  @override
  AppInputFieldTheme copyWith({
    double? width,
    double? height,
    TextStyle? style,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? iconPadding,
    Color? textColor,
    Color? borderColor,
    Color? errorBorderColor,
    Color? iconColor,
    BorderRadius? borderRadius,
  }) {
    return AppInputFieldTheme(
      tokens: tokens,
      width: width ?? this.width,
      height: height ?? this.height,
      style: style ?? this.style,
      contentPadding: contentPadding ?? this.contentPadding,
      iconPadding: iconPadding ?? this.iconPadding,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  AppInputFieldTheme lerp(
    ThemeExtension<AppInputFieldTheme>? other,
    double t,
  ) {
    if (other is! AppInputFieldTheme) return this;

    return AppInputFieldTheme(
      tokens: tokens.lerp(other.tokens, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      style: TextStyle.lerp(style, other.style, t),
      contentPadding: EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t),
      iconPadding: EdgeInsetsGeometry.lerp(iconPadding, other.iconPadding, t),
      iconColor: colorPremulLerp(iconColor, other.iconColor, t),
      textColor: colorPremulLerp(textColor, other.textColor, t),
      borderColor: colorPremulLerp(borderColor, other.borderColor, t),
      errorBorderColor: colorPremulLerp(errorBorderColor, other.errorBorderColor, t),
    );
  }
}
