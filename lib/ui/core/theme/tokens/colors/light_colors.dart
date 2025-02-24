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
    Color? grey200,
    Color? grey300,
    Color? red,
    Color? progressBarGreen,
    Color? progressBarYellow,
    Color? progressBarRed,
    Color? progressBarGrey,
  }) : super(
          primary: primary ?? const Color(0xFF001C95),
          background: background ?? const Color(0xFFF4F8FA),
          foreground: foreground ?? const Color(0xFF1E2A32),
          grey50: grey50 ?? const Color(0xFFCBD5DC),
          grey100: grey100 ?? const Color(0xFF708797),
          grey200: grey200 ?? const Color(0xFF8A9CA9),
          grey300: grey300 ?? const Color(0xFF4D6475),
          red: red ?? const Color(0xFFE57373),
          progressBarGreen: progressBarGreen ?? const Color(0xFF04C761),
          progressBarYellow: progressBarYellow ?? const Color(0xFFFFC032),
          progressBarRed: progressBarRed ?? const Color(0xFFD32A36),
          progressBarGrey: progressBarGrey ?? const Color(0xFFE9EEF2),
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
    Color? grey200,
    Color? grey300,
    Color? red,
    Color? progressBarGreen,
    Color? progressBarYellow,
    Color? progressBarRed,
    Color? progressBarGrey,
  }) {
    return LightColors._(
      black: black ?? this.black,
      white: white ?? this.white,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      foreground: foreground ?? this.foreground,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      red: red ?? this.red,
      progressBarGreen: progressBarGreen ?? this.progressBarGreen,
      progressBarYellow: progressBarYellow ?? this.progressBarYellow,
      progressBarRed: progressBarRed ?? this.progressBarRed,
      progressBarGrey: progressBarGrey ?? this.progressBarGrey,
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
      grey200: colorPremulLerp(grey200, other.grey200, t)!,
      grey300: colorPremulLerp(grey300, other.grey300, t)!,
      red: colorPremulLerp(red, other.red, t)!,
      progressBarGreen: colorPremulLerp(progressBarGreen, other.progressBarGreen, t)!,
      progressBarYellow: colorPremulLerp(progressBarYellow, other.progressBarYellow, t)!,
      progressBarRed: colorPremulLerp(progressBarRed, other.progressBarRed, t)!,
      progressBarGrey: colorPremulLerp(progressBarGrey, other.progressBarGrey, t)!,
    );
  }
}
