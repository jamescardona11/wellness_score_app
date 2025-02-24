import 'package:flutter/material.dart';

/// Base class for color tokens.
///
/// This abstract class defines the core color properties that can be extended by specific color token classes.
/// It provides a common interface for accessing and interpolating color values across different themes.
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
  final Color grey200;
  final Color grey300;
  final Color red;

  final Color progressBarGreen;
  final Color progressBarYellow;
  final Color progressBarRed;
  final Color progressBarGrey;

  const BaseColors({
    required this.black,
    required this.white,
    required this.primary,
    required this.background,
    required this.foreground,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.red,
    required this.progressBarGreen,
    required this.progressBarYellow,
    required this.progressBarRed,
    required this.progressBarGrey,
  });

  @override
  BaseColors lerp(covariant ThemeExtension<BaseColors>? other, double t);
}
