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
        ),
      ],
    );
  }
}

class WellnessTheme extends ThemeExtension<WellnessTheme> {
  final Tokens tokens;

  WellnessTheme._({
    required this.tokens,
  });

  static WellnessTheme of(BuildContext context) => context.theme;

  BaseColors get colors => tokens.colors;

  AppSizes get sizes => tokens.sizes;

  AppTypography get typography => tokens.typography;

  @override
  WellnessTheme copyWith({
    Tokens? tokens,
  }) {
    return WellnessTheme._(
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  WellnessTheme lerp(covariant ThemeExtension<WellnessTheme>? other, double t) {
    if (other is! WellnessTheme) return this;

    return WellnessTheme._(
      tokens: tokens.lerp(other.tokens, t),
    );
  }
}
