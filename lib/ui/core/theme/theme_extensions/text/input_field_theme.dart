import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

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
  })  : width = width ?? double.infinity,
        height = height ?? tokens.sizes.x14,
        style = style ?? tokens.typography.title1.copyWith(color: tokens.colors.foreground),
        contentPadding = contentPadding ?? EdgeInsets.symmetric(horizontal: tokens.sizes.x3, vertical: tokens.sizes.x4),
        iconPadding = iconPadding ?? EdgeInsets.only(left: tokens.sizes.x3, right: tokens.sizes.x2),
        textColor = textColor ?? tokens.colors.foreground,
        borderColor = borderColor ?? tokens.colors.background,
        errorBorderColor = errorBorderColor ?? tokens.colors.red,
        iconColor = iconColor ?? tokens.colors.grey50;

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
