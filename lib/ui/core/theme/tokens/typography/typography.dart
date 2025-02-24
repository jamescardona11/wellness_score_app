import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A theme extension for typography.
///
/// This class extends [ThemeExtension] and defines the typography properties for the application.
/// It includes properties for different text styles such as heading, subtitle, button, paragraph,
/// and description.
///

class AppTypography extends ThemeExtension<AppTypography> {
  static final typography = AppTypography._(
    headingLG: GoogleFonts.rubik(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 28.8 / 24,
    ),
    headingXS: GoogleFonts.rubik(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 24 / 20,
    ),
    subtitleLG: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 24 / 20,
    ),
    subtitleXS: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 27 / 18,
    ),
    button: GoogleFonts.workSans(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 16 / 16,
    ),
    paragraph: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 21 / 14,
    ),
    paragraphBold: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 21 / 16,
    ),
    description: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 18 / 12,
    ),
  );

  const AppTypography._({
    required this.headingLG,
    required this.headingXS,
    required this.subtitleLG,
    required this.subtitleXS,
    required this.button,
    required this.paragraph,
    required this.paragraphBold,
    required this.description,
  });

  final TextStyle headingLG;
  final TextStyle headingXS;
  final TextStyle subtitleLG;
  final TextStyle subtitleXS;
  final TextStyle button;
  final TextStyle paragraph;
  final TextStyle paragraphBold;
  final TextStyle description;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? headingLG,
    TextStyle? headingXS,
    TextStyle? subtitleLG,
    TextStyle? subtitleXS,
    TextStyle? button,
    TextStyle? paragraph,
    TextStyle? paragraphBold,
    TextStyle? description,
  }) {
    return AppTypography._(
      headingLG: headingLG ?? this.headingLG,
      headingXS: headingXS ?? this.headingXS,
      subtitleLG: subtitleLG ?? this.subtitleLG,
      subtitleXS: subtitleXS ?? this.subtitleXS,
      button: button ?? this.button,
      paragraph: paragraph ?? this.paragraph,
      paragraphBold: paragraphBold ?? this.paragraphBold,
      description: description ?? this.description,
    );
  }

  @override
  AppTypography lerp(covariant ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;

    return AppTypography._(
      headingLG: TextStyle.lerp(headingLG, other.headingLG, t)!,
      headingXS: TextStyle.lerp(headingXS, other.headingXS, t)!,
      subtitleLG: TextStyle.lerp(subtitleLG, other.subtitleLG, t)!,
      subtitleXS: TextStyle.lerp(subtitleXS, other.subtitleXS, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      paragraph: TextStyle.lerp(paragraph, other.paragraph, t)!,
      paragraphBold: TextStyle.lerp(paragraphBold, other.paragraphBold, t)!,
      description: TextStyle.lerp(description, other.description, t)!,
    );
  }
}
