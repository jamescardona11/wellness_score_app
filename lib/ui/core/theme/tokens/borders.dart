import 'dart:ui';

import 'package:flutter/material.dart';

/// A theme extension for border tokens.
///
/// This class extends [ThemeExtension] and defines the border properties for the application.
/// It includes properties for different border radius.
///

@immutable
class AppBorders extends ThemeExtension<AppBorders> {
  static const borders = AppBorders(
    x1: BorderRadius.all(Radius.circular(4)),
    x2: BorderRadius.all(Radius.circular(8)),
    x3: BorderRadius.all(Radius.circular(12)),
    x4: BorderRadius.all(Radius.circular(16)),
    x5: BorderRadius.all(Radius.circular(20)),
    x8: BorderRadius.all(Radius.circular(32)),
    defaultBorderWidth: 1,
    activeBorderWidth: 1.5,
  );

  final BorderRadius x1;
  final BorderRadius x2;
  final BorderRadius x3;
  final BorderRadius x4;
  final BorderRadius x5;
  final BorderRadius x8;
  final double defaultBorderWidth;
  final double activeBorderWidth;

  const AppBorders({
    required this.x1,
    required this.x2,
    required this.x3,
    required this.x4,
    required this.x5,
    required this.x8,
    required this.defaultBorderWidth,
    required this.activeBorderWidth,
  });

  @override
  AppBorders copyWith({
    BorderRadius? x1,
    BorderRadius? x2,
    BorderRadius? x3,
    BorderRadius? x4,
    BorderRadius? x5,
    BorderRadius? x8,
    double? defaultBorderWidth,
    double? activeBorderWidth,
  }) {
    return AppBorders(
      x1: x1 ?? this.x1,
      x2: x2 ?? this.x2,
      x3: x3 ?? this.x3,
      x4: x4 ?? this.x4,
      x5: x5 ?? this.x5,
      x8: x8 ?? this.x8,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
      activeBorderWidth: activeBorderWidth ?? this.activeBorderWidth,
    );
  }

  @override
  AppBorders lerp(ThemeExtension<AppBorders>? other, double t) {
    if (other is! AppBorders) return this;

    return AppBorders(
      x1: BorderRadius.lerp(x1, other.x1, t)!,
      x2: BorderRadius.lerp(x2, other.x2, t)!,
      x3: BorderRadius.lerp(x3, other.x3, t)!,
      x4: BorderRadius.lerp(x4, other.x4, t)!,
      x5: BorderRadius.lerp(x5, other.x5, t)!,
      x8: BorderRadius.lerp(x8, other.x8, t)!,
      defaultBorderWidth: lerpDouble(defaultBorderWidth, other.defaultBorderWidth, t)!,
      activeBorderWidth: lerpDouble(activeBorderWidth, other.activeBorderWidth, t)!,
    );
  }
}

extension BorderRadiusX on BorderRadius {
  BorderRadius upper() => BorderRadius.only(
        topLeft: topLeft,
        topRight: topRight,
      );

  BorderRadius lower() => BorderRadius.only(
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );
}
