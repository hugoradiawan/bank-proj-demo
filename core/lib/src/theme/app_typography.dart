import 'package:flutter/material.dart' show Color, TextTheme;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class AppTypography {
  AppTypography._();

  static void init() =>
    GoogleFonts.config.allowRuntimeFetching = false;

  static TextTheme buildTextTheme(Color textColor) =>
      GoogleFonts.figtreeTextTheme().apply(bodyColor: textColor, displayColor: textColor);
}
