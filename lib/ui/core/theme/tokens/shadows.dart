import 'package:flutter/material.dart';

@immutable
class AppShadows extends ThemeExtension<AppShadows> {
  static const shadows = AppShadows(
    sm: [
      BoxShadow(
        color: Color(0x28000000),
        offset: Offset(0, 2),
        blurRadius: 10,
      ),
    ],
    md: [
      BoxShadow(
        color: Color(0x28000000),
        offset: Offset(0, 12),
        blurRadius: 12,
      ),
    ],
    lg: [
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 8,
        spreadRadius: -3,
        offset: Offset(0, -3),
      ),
    ],
  );

  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;

  const AppShadows({
    required this.sm,
    required this.md,
    required this.lg,
  });

  @override
  AppShadows copyWith({
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
  }) {
    return AppShadows(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  AppShadows lerp(ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) return this;

    return AppShadows(
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
      lg: BoxShadow.lerpList(lg, other.lg, t)!,
    );
  }
}

extension ShadowsX on List<BoxShadow> {
  List<BoxShadow> addBorderShadow() {
    return [
      const BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      ...this,
    ];
  }
}
