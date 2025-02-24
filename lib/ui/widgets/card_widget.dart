import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.sizes.x5.paddingAll,
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: context.borders.x2,
        boxShadow: context.shadows.sm,
      ),
      child: child,
    );
  }
}
