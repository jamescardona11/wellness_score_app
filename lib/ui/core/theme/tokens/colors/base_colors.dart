import 'package:flutter/material.dart';

// Color palette
abstract base class BaseColors extends ThemeExtension<BaseColors> {
  // Base
  final Color black;
  final Color white;

  // Color scheme
  final Color primary;
  final Color background;
  final Color foreground;
  final Color grey50;
  final Color grey100;
  final Color red;

  const BaseColors({
    required this.black,
    required this.white,
    required this.primary,
    required this.background,
    required this.foreground,
    required this.grey50,
    required this.grey100,
    required this.red,
  });

  @override
  BaseColors lerp(covariant ThemeExtension<BaseColors>? other, double t);
}
