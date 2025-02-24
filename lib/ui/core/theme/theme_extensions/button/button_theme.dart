import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

/// A theme extension for the button widget.
///
/// This class extends [ThemeExtension] and defines the theme properties for the button widget.
/// It includes properties for width, height, primary color, secondary color, accent color,
/// border radius, border width, and label style.
///
/// Example usage:
/// ```dart
/// final buttonTheme = AppButtonTheme(
///   tokens: tokens,
/// );
/// ```

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final Tokens tokens;
  final double width;
  final double height;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final BorderRadius borderRadius;
  final double borderWidth;
  final TextStyle labelStyle;

  AppButtonTheme({
    required this.tokens,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    double? borderWidth,
    Color? primaryColor,
    Color? secondaryColor,
    Color? accentColor,
    TextStyle? labelStyle,
  })  : width = width ?? double.infinity,
        height = height ?? tokens.sizes.x14,
        primaryColor = primaryColor ?? tokens.colors.primary,
        secondaryColor = secondaryColor ?? tokens.colors.white,
        accentColor = accentColor ?? tokens.colors.grey50,
        borderRadius = borderRadius ?? tokens.borders.x8,
        borderWidth = borderWidth ?? tokens.sizes.x,
        labelStyle = labelStyle ?? tokens.typography.button;

  @override
  AppButtonTheme copyWith({
    double? width,
    double? height,
    BorderRadius? borderRadius,
    double? borderWidth,
    Color? primaryColor,
    Color? secondaryColor,
    Color? accentColor,
    TextStyle? labelStyle,
    double? iconSize,
    double? iconPadding,
  }) {
    return AppButtonTheme(
      tokens: tokens,
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      accentColor: accentColor ?? this.accentColor,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }

  @override
  AppButtonTheme lerp(
    ThemeExtension<AppButtonTheme>? other,
    double t,
  ) {
    if (other is! AppButtonTheme) return this;

    return AppButtonTheme(
      tokens: tokens.lerp(other.tokens, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t),
      primaryColor: colorPremulLerp(primaryColor, other.primaryColor, t),
      secondaryColor: colorPremulLerp(secondaryColor, other.secondaryColor, t),
      accentColor: colorPremulLerp(accentColor, other.accentColor, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
    );
  }
}
