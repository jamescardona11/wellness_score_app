import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class AppSizes extends ThemeExtension<AppSizes> {
  static const sizes = AppSizes(
    x: 2,
    x1: 4,
    x2: 8,
    x3: 12,
    x4: 16,
    x5: 20,
    x6: 24,
    x7: 28,
    x8: 32,
    x10: 40,
    x12: 48,
    x14: 56,
    x16: 64,
  );

  final double x;
  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final double x5;
  final double x6;
  final double x7;
  final double x8;
  final double x10;
  final double x12;
  final double x14;
  final double x16;

  const AppSizes({
    required this.x,
    required this.x1,
    required this.x2,
    required this.x3,
    required this.x4,
    required this.x5,
    required this.x6,
    required this.x7,
    required this.x8,
    required this.x10,
    required this.x12,
    required this.x14,
    required this.x16,
  });

  @override
  AppSizes copyWith({
    double? x,
    double? x1,
    double? x2,
    double? x3,
    double? x4,
    double? x5,
    double? x6,
    double? x7,
    double? x8,
    double? x10,
    double? x12,
    double? x14,
    double? x16,
  }) {
    return AppSizes(
      x: x ?? this.x,
      x1: x1 ?? this.x1,
      x2: x2 ?? this.x2,
      x3: x3 ?? this.x3,
      x4: x4 ?? this.x4,
      x5: x5 ?? this.x5,
      x6: x6 ?? this.x6,
      x7: x7 ?? this.x7,
      x8: x8 ?? this.x8,
      x10: x10 ?? this.x10,
      x12: x12 ?? this.x12,
      x14: x14 ?? this.x14,
      x16: x16 ?? this.x16,
    );
  }

  @override
  AppSizes lerp(ThemeExtension<AppSizes>? other, double t) {
    if (other is! AppSizes) return this;

    return AppSizes(
      x: lerpDouble(x, other.x, t)!,
      x1: lerpDouble(x1, other.x1, t)!,
      x2: lerpDouble(x2, other.x2, t)!,
      x3: lerpDouble(x3, other.x3, t)!,
      x4: lerpDouble(x4, other.x4, t)!,
      x5: lerpDouble(x5, other.x5, t)!,
      x6: lerpDouble(x6, other.x6, t)!,
      x7: lerpDouble(x7, other.x7, t)!,
      x8: lerpDouble(x8, other.x8, t)!,
      x10: lerpDouble(x10, other.x10, t)!,
      x12: lerpDouble(x12, other.x12, t)!,
      x14: lerpDouble(x14, other.x14, t)!,
      x16: lerpDouble(x16, other.x16, t)!,
    );
  }
}

extension PaddingFromSizes on double {
  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get paddingTop => EdgeInsets.only(top: this);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: this);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: this);
  EdgeInsets get paddingRight => EdgeInsets.only(right: this);
}

extension MarginFromSizes on double {
  EdgeInsets get marginAll => EdgeInsets.all(this);
  EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: this);
}
