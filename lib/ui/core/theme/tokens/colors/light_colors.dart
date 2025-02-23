import 'package:flutter/material.dart';

import 'base_colors.dart';
import 'utils/color_premul_lerp.dart';

// Color palette
final class LightColors extends BaseColors {
  static const def = LightColors._(
    white: Colors.white,
    black: Colors.black,
  );

  const LightColors._({
    required super.black,
    required super.white,
    Color? background,
    Color? primary,
    Color? foreground,
    Color? grey50,
    Color? grey100,
    Color? red,
  }) : super(
          primary: primary ?? const Color(0xFF001C95),
          background: background ?? const Color(0xFFE9EEF2),
          foreground: foreground ?? const Color(0xFF1E2A32),
          grey50: grey50 ?? const Color(0xFF4D6475),
          grey100: grey100 ?? const Color(0xFF708797),
          red: red ?? const Color(0xFFE57373),
        );

  @override
  LightColors copyWith({
    Color? black,
    Color? white,
    Color? background,
    Color? primary,
    Color? foreground,
    Color? grey50,
    Color? grey100,
    Color? red,
  }) {
    return LightColors._(
      black: black ?? this.black,
      white: white ?? this.white,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      foreground: foreground ?? this.foreground,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      red: red ?? this.red,
    );
  }

  @override
  BaseColors lerp(covariant ThemeExtension<BaseColors>? other, double t) {
    if (other is! LightColors) return this;

    return LightColors._(
      black: colorPremulLerp(black, other.black, t)!,
      white: colorPremulLerp(white, other.white, t)!,
      background: colorPremulLerp(background, other.background, t)!,
      primary: colorPremulLerp(primary, other.primary, t)!,
      foreground: colorPremulLerp(foreground, other.foreground, t)!,
      grey50: colorPremulLerp(grey50, other.grey50, t)!,
      grey100: colorPremulLerp(grey100, other.grey100, t)!,
      red: colorPremulLerp(red, other.red, t)!,
    );
  }
}
