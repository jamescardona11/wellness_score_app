import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

/// A widget that scales the child when tapped.
///
/// This widget provides a visual feedback by scaling the child widget when tapped.
/// It can be configured to scale up or down when tapped.
///
/// The widget is built using [AnimatedBuilder] to animate the scale transformation.

class BounceWrapper extends StatefulWidget {
  const BounceWrapper.up({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.onTap,
    this.enable = true,
    this.controller,
  }) : assert(scale > 1.0);

  const BounceWrapper.down({
    super.key,
    required this.child,
    this.scale = 0.95,
    this.onTap,
    this.enable = true,
    this.controller,
  }) : assert(scale < 1.0);

  final Widget child;
  final double scale;
  final bool enable;
  final VoidCallback? onTap;
  final AnimationController? controller;

  @override
  BounceWrapperState createState() => BounceWrapperState();
}

class BounceWrapperState extends State<BounceWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final _defaultScaleCurve = AppDurations.durations.defaultTransitionCurve;

  @override
  void initState() {
    final duration = AppDurations.durations.fasterAnimationDuration;

    _animationController = widget.controller ??
        AnimationController(
          vsync: this,
          duration: duration,
        );

    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _defaultScaleCurve,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.enable,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          SystemSound.play(SystemSoundType.click);
          widget.onTap?.call();
        },
        onTapUp: (_) => _anim(),
        onTapDown: (_) => _anim(widget.scale),
        onTapCancel: () => _anim(),
        behavior: HitTestBehavior.opaque,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _anim([double scale = 1.0]) {
    _animationController.stop();

    _scaleAnimation = Tween<double>(
      begin: _scaleAnimation.value,
      end: scale,
    ).animate(
      CurvedAnimation(
        curve: _defaultScaleCurve,
        parent: _animationController,
      ),
    );

    _animationController.reset();
    _animationController.forward();
  }
}
