import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AppText extends StatelessWidget {
  AppText.title1(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.title1;

  AppText.title2(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.title2;

  AppText.subtitle1(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.subtitle1;

  AppText.subtitle2(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.subtitle2;

  AppText.paragraph1(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.paragraph1;

  AppText.paragraph2(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.paragraph2;

  AppText.paragraph3(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.paragraph3;

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final appliedStyle = TextStyle(
      color: color ?? context.colors.foreground,
    ).merge(style);

    return Text(
      text,
      style: appliedStyle,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
