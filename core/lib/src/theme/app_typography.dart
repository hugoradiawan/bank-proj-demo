import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static void init() =>
    GoogleFonts.config.allowRuntimeFetching = false;

  static TextTheme buildTextTheme(Color textColor) =>
      GoogleFonts.figtreeTextTheme().apply(bodyColor: textColor, displayColor: textColor);
}
