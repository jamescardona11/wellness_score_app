import 'package:flutter/material.dart';

import 'borders.dart';
import 'colors/base_colors.dart';
import 'colors/light_colors.dart';
import 'durations.dart';
import 'shadows.dart';
import 'sizes.dart';
import 'typography/typography.dart';

@immutable
class Tokens extends ThemeExtension<Tokens> {
  static final Tokens light = Tokens(
    colors: LightColors.def,
    sizes: AppSizes.sizes,
    typography: AppTypography.typography,
    durations: AppDurations.durations,
    shadows: AppShadows.shadows,
    borders: AppBorders.borders,
  );

  final BaseColors colors;
  final AppSizes sizes;
  final AppTypography typography;
  final AppDurations durations;
  final AppShadows shadows;
  final AppBorders borders;

  const Tokens({
    required this.colors,
    required this.sizes,
    required this.typography,
    required this.durations,
    required this.shadows,
    required this.borders,
  });

  @override
  Tokens copyWith({
    BaseColors? colors,
    AppSizes? sizes,
    AppTypography? typography,
    AppDurations? durations,
    AppShadows? shadows,
    AppBorders? borders,
  }) {
    return Tokens(
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      typography: typography ?? this.typography,
      durations: durations ?? this.durations,
      shadows: shadows ?? this.shadows,
      borders: borders ?? this.borders,
    );
  }

  @override
  Tokens lerp(ThemeExtension<Tokens>? other, double t) {
    if (other is! Tokens) return this;

    return Tokens(
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
      typography: typography.lerp(other.typography, t),
      durations: durations.lerp(other.durations, t),
      shadows: shadows.lerp(other.shadows, t),
      borders: borders.lerp(other.borders, t),
    );
  }
}
