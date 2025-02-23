import 'package:flutter/material.dart';

import 'theme.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    final tokens = Tokens.light;
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      scaffoldBackgroundColor: tokens.colors.background,
      extensions: [
        WellnessTheme._(
          tokens: tokens,
          buttonTheme: AppButtonTheme(
            tokens: tokens,
          ),
        ),
      ],
    );
  }
}

class WellnessTheme extends ThemeExtension<WellnessTheme> {
  final Tokens tokens;
  final AppButtonTheme buttonTheme;

  WellnessTheme._({
    required this.tokens,
    required this.buttonTheme,
  });

  static WellnessTheme of(BuildContext context) => context.theme;

  BaseColors get colors => tokens.colors;

  AppSizes get sizes => tokens.sizes;

  AppTypography get typography => tokens.typography;

  @override
  WellnessTheme copyWith({
    Tokens? tokens,
    AppButtonTheme? buttonTheme,
  }) {
    return WellnessTheme._(
      tokens: tokens ?? this.tokens,
      buttonTheme: buttonTheme ?? this.buttonTheme,
    );
  }

  @override
  WellnessTheme lerp(covariant ThemeExtension<WellnessTheme>? other, double t) {
    if (other is! WellnessTheme) return this;

    return WellnessTheme._(
      tokens: tokens.lerp(other.tokens, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
    );
  }
}
