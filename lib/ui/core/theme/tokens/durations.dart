import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AppDurations extends ThemeExtension<AppDurations> {
  static const durations = AppDurations._(
    fasterAnimationDuration: Duration(milliseconds: 150),
    defaultAnimationDuration: Duration(milliseconds: 300),
    slowerAnimationDuration: Duration(milliseconds: 500),
    defaultTransitionCurve: Curves.ease,
  );

  const AppDurations._({
    required this.fasterAnimationDuration,
    required this.defaultAnimationDuration,
    required this.slowerAnimationDuration,
    required this.defaultTransitionCurve,
  });

  final Duration fasterAnimationDuration;
  final Duration defaultAnimationDuration;
  final Duration slowerAnimationDuration;
  final Curve defaultTransitionCurve;

  @override
  AppDurations copyWith({
    Duration? fasterAnimationDuration,
    Duration? defaultAnimationDuration,
    Duration? slowerAnimationDuration,
    Curve? defaultTransitionCurve,
  }) =>
      AppDurations._(
        fasterAnimationDuration: fasterAnimationDuration ?? this.fasterAnimationDuration,
        defaultAnimationDuration: defaultAnimationDuration ?? this.defaultAnimationDuration,
        slowerAnimationDuration: slowerAnimationDuration ?? this.slowerAnimationDuration,
        defaultTransitionCurve: defaultTransitionCurve ?? this.defaultTransitionCurve,
      );

  @override
  AppDurations lerp(ThemeExtension<AppDurations>? other, double t) {
    if (other is! AppDurations) return this;

    return AppDurations._(
      fasterAnimationDuration: lerpDuration(fasterAnimationDuration, other.fasterAnimationDuration, t),
      defaultAnimationDuration: lerpDuration(defaultAnimationDuration, other.defaultAnimationDuration, t),
      slowerAnimationDuration: lerpDuration(slowerAnimationDuration, other.slowerAnimationDuration, t),
      defaultTransitionCurve: other.defaultTransitionCurve,
    );
  }
}
