import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'tokens/colors/base_colors.dart';
import 'tokens/sizes.dart';
import 'tokens/tokens.dart';
import 'tokens/typography/typography.dart';

extension ThemeDataExtension on ThemeData {
  WellnessTheme get _theme => extension<WellnessTheme>()!;
  Tokens get _tokens => _theme.tokens;
}

extension ThemeContextExtension on BuildContext {
  WellnessTheme get theme => Theme.of(this)._theme;

  // Tokens
  Tokens get tokens => Theme.of(this)._tokens;

  // Colors
  BaseColors get colors => Theme.of(this)._tokens.colors;

  // Sizes
  AppSizes get sizes => Theme.of(this)._tokens.sizes;

  // Typography
  AppTypography get typography => Theme.of(this)._tokens.typography;
}
