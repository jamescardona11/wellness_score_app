import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class RichTextHeader extends StatelessWidget {
  const RichTextHeader({
    super.key,
    required this.span1,
    required this.span2,
  });

  final String span1;
  final String span2;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final colors = context.colors;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: span1,
        style: typography.subtitleXS.copyWith(
          color: colors.primary,
        ),
        children: [
          TextSpan(
            text: span2,
            style: typography.subtitleLG.copyWith(
              color: colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
