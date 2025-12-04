import 'dart:ui' show lerpDouble;

import 'package:core/src/theme/app_colors.dart' show LightColors;
import 'package:core/src/theme/app_typography.dart' show AppTypography;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        Color,
        ColorScheme,
        Colors,
        EdgeInsets,
        FilledButton,
        FilledButtonThemeData,
        FontWeight,
        InkRipple,
        InputDecorationTheme,
        OutlineInputBorder,
        RoundedRectangleBorder,
        TextTheme,
        ThemeData,
        ThemeExtension,
        immutable;

@immutable
class HighlightTileTheme extends ThemeExtension<HighlightTileTheme> {
  const HighlightTileTheme({
    required this.splashColor,
    required this.highlightColor,
    required this.borderColor,
    required this.borderRadius,
  });

  final Color splashColor;
  final Color highlightColor;
  final Color borderColor;
  final double borderRadius;

  @override
  HighlightTileTheme copyWith({
    Color? splashColor,
    Color? highlightColor,
    Color? borderColor,
    double? borderRadius,
  }) => HighlightTileTheme(
    splashColor: splashColor ?? this.splashColor,
    highlightColor: highlightColor ?? this.highlightColor,
    borderColor: borderColor ?? this.borderColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );

  @override
  HighlightTileTheme lerp(ThemeExtension<HighlightTileTheme>? other, double t) {
    if (other is! HighlightTileTheme) return this;
    return HighlightTileTheme(
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final ThemeData base = ThemeData.light();
    final LightColors colors = LightColors();
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: colors.primary,
    );
    final TextTheme textTheme = AppTypography.buildTextTheme(
      colors.textPrimary,
    );
    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.surface,
      textTheme: textTheme,
      splashFactory: InkRipple.splashFactory,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.white,
        foregroundColor: colors.textPrimary,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      progressIndicatorTheme: base.progressIndicatorTheme.copyWith(
        color: colorScheme.primary,
      ),
      extensions: <ThemeExtension<dynamic>>[
        HighlightTileTheme(
          splashColor: colorScheme.primary.withValues(alpha: 0.075),
          highlightColor: colorScheme.primary.withValues(alpha: 0.075),
          borderColor: colorScheme.outlineVariant,
          borderRadius: 16,
        ),
      ],
    );
  }
}

extension HighlightTileThemeX on ThemeData {
  HighlightTileTheme get highlightTileTheme {
    final HighlightTileTheme? ext = extension<HighlightTileTheme>();
    final ColorScheme cs = colorScheme;
    return ext ??
        HighlightTileTheme(
          splashColor: cs.primary.withValues(alpha: 0.075),
          highlightColor: cs.primary.withValues(alpha: 0.075),
          borderColor: cs.outlineVariant,
          borderRadius: 16,
        );
  }
}
