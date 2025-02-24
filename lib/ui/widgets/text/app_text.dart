import 'package:flutter/material.dart';
import 'package:wellness_score_app/ui/core/theme/theme.dart';

class AppText extends StatelessWidget {
  AppText.headingLG(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.headingLG;

  AppText.headingXS(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.headingXS;

  AppText.subtitleLG(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.subtitleLG;

  AppText.subtitleXS(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.subtitleXS;

  AppText.button(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.button;

  AppText.paragraph(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.paragraph;

  AppText.paragraphBold(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.paragraphBold;

  AppText.description(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  }) : style = AppTypography.typography.description;

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
    );
  }
}
