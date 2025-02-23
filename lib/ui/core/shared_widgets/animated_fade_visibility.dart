import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AnimatedFadeVisibility extends StatefulWidget {
  final bool visible;
  final Duration? duration;
  final Curve curve;
  final Widget? child;

  const AnimatedFadeVisibility({
    super.key,
    this.visible = true,
    this.child,
    this.duration,
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedFadeVisibility> createState() => _AnimatedFadeVisibilityState();
}

class _AnimatedFadeVisibilityState extends State<AnimatedFadeVisibility> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacity;

  final double minOpacity = 0.0;
  final double maxOpacity = 1.0;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _opacity = Tween<double>(
      begin: widget.visible ? maxOpacity : minOpacity,
      end: widget.visible ? maxOpacity : minOpacity,
    ).animate(_animationController);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedFadeVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.visible != widget.visible)) {
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) return const SizedBox();
    final duration = widget.duration ?? context.durations.fasterAnimationDuration;

    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => AnimatedOpacity(
          opacity: _opacity.value.clamp(minOpacity, maxOpacity),
          duration: duration,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _animate() async {
    _animationController.stop();

    _opacity = Tween<double>(
      begin: _opacity.value,
      end: widget.visible ? maxOpacity : minOpacity,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          1.0,
          curve: widget.curve,
        ),
      ),
    );

    _animationController.reset();
    await _animationController.forward();
  }
}
