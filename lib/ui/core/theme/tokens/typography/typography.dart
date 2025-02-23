import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography extends ThemeExtension<AppTypography> {
  static final typography = AppTypography._(
    title1: GoogleFonts.rubik(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 28.8 / 24,
    ),
    title2: GoogleFonts.rubik(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 24 / 20,
    ),
    subtitle1: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 24 / 20,
    ),
    subtitle2: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 27 / 18,
    ),
    paragraph1: GoogleFonts.workSans(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 16 / 16,
    ),
    paragraph2: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 21 / 14,
    ),
    paragraph3: GoogleFonts.workSans(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 18 / 12,
    ),
  );

  const AppTypography._({
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    required this.paragraph1,
    required this.paragraph2,
    required this.paragraph3,
  });

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle paragraph1;
  final TextStyle paragraph2;
  final TextStyle paragraph3;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? paragraph1,
    TextStyle? paragraph2,
    TextStyle? paragraph3,
  }) {
    return AppTypography._(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      paragraph1: paragraph1 ?? this.paragraph1,
      paragraph2: paragraph2 ?? this.paragraph2,
      paragraph3: paragraph3 ?? this.paragraph3,
    );
  }

  @override
  AppTypography lerp(covariant ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;

    return AppTypography._(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      paragraph1: TextStyle.lerp(paragraph1, other.paragraph1, t)!,
      paragraph2: TextStyle.lerp(paragraph2, other.paragraph2, t)!,
      paragraph3: TextStyle.lerp(paragraph3, other.paragraph3, t)!,
    );
  }
}
