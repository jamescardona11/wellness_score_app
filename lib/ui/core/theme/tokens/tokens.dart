import 'package:flutter/material.dart';

import 'colors/base_colors.dart';
import 'colors/light_colors.dart';
import 'sizes.dart';
import 'typography/typography.dart';

@immutable
class Tokens extends ThemeExtension<Tokens> {
  static final Tokens light = Tokens(
    colors: LightColors.def,
    sizes: AppSizes.sizes,
    typography: AppTypography.typography,
  );

  final BaseColors colors;

  final AppSizes sizes;

  final AppTypography typography;

  const Tokens({
    required this.colors,
    required this.sizes,
    required this.typography,
  });

  @override
  Tokens copyWith({
    BaseColors? colors,
    AppSizes? sizes,
    AppTypography? typography,
  }) {
    return Tokens(
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      typography: typography ?? this.typography,
    );
  }

  @override
  Tokens lerp(ThemeExtension<Tokens>? other, double t) {
    if (other is! Tokens) return this;

    return Tokens(
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
      typography: typography.lerp(other.typography, t),
    );
  }
}
