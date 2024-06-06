import 'package:flutter/material.dart';

// Text theme for application
class ApplicationTextTheme {
  ApplicationTextTheme._();
  static const defaultFamily = 'Averta';

  // static final defaultFamily = GoogleFonts.roboto().fontFamily;

  static TextTheme getTheme() {
    return const TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        headlineLarge: _headlineLarge,
        headlineMedium: _headlineMedium,
        titleLarge: _titleLarge,
        labelMedium: _labelMedium,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall);
  }

  // static final _displayLarge = GoogleFonts.roboto(
  //   fontSize: 74,
  //   fontWeight: FontWeight.w900,
  // );

  // static final _displayMedium = GoogleFonts.roboto(
  //   fontSize: 47,
  //   fontWeight: FontWeight.w800,
  // );

  // static final _headlineLarge =
  //     GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.w700);

  // static final _headlineMedium =
  //     GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w600);

  // static final _titleLarge =
  //     GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w500);

  // static final _labelMedium =
  //     GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w400);

  // static final _bodyLarge =
  //     GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w300);

  // static final _bodyMedium =
  //     GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w200);

  // static final _bodySmall =
  //     GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w100);

  /// Text Styles for font using assets.

  static const _displayLarge = TextStyle(
    fontSize: 74,
    fontWeight: FontWeight.w900,
  );

  static const _displayMedium = TextStyle(
    fontSize: 47,
    fontWeight: FontWeight.w800,
  );

  static const _headlineLarge =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w700);

  static const _headlineMedium =
      TextStyle(fontSize: 36, fontWeight: FontWeight.w600);

  static const _titleLarge =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  static const _labelMedium =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w400);

  static const _bodyLarge =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w300);

  static const _bodyMedium =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w200);

  static const _bodySmall =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w100);
}

extension TextThemeExtension on TextTheme {
  TextStyle? get proximaNovaThin => titleMedium?.copyWith(
      fontFamily: 'ProximaNova', fontWeight: FontWeight.w300);

  TextStyle? get proximaNovaRegular => titleMedium?.copyWith(
      fontFamily: 'ProximaNova', fontWeight: FontWeight.w400);

  TextStyle? get proximaNovaSemibold => titleMedium?.copyWith(
      fontFamily: 'ProximaNova', fontWeight: FontWeight.w600);

  TextStyle? get proximaNovaBold => titleMedium?.copyWith(
      fontFamily: 'ProximaNova', fontWeight: FontWeight.w700);
}
