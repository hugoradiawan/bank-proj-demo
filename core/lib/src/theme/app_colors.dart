import 'package:flutter/material.dart' show Alignment, Color, LinearGradient;

abstract class AppColors {
  // Primary
  Color get primary;
  Color get primaryLight;
  Color get primaryDark;

  // Text
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get textOnPrimary;

  // Surface & Background
  Color get surface;
  Color get surfaceVariant;
  Color get background;
  Color get backgroundSecondary;

  // Gray scale
  Color get gray50;
  Color get gray100;
  Color get gray200;
  Color get gray300;
  Color get gray400;
  Color get gray500;

  // Semantic
  Color get success;
  Color get warning;
  Color get error;
  Color get info;

  // Accent
  Color get gold;
  Color get gold2;
  Color get premium;

  // Gradients
  LinearGradient get premiumGradient;
  LinearGradient get premiumGradient2;
}

class LightColors implements AppColors {
  // Primary
  @override
  Color get primary => const Color(0xFF1D4ED8);
  @override
  Color get primaryLight => const Color(0xFF3B82F6);
  @override
  Color get primaryDark => const Color(0xFF1E40AF);

  // Text
  @override
  Color get textPrimary => const Color(0xFF1A233C);
  @override
  Color get textSecondary => const Color(0xFF64748B);
  @override
  Color get textTertiary => const Color(0xFF94A3B8);
  @override
  Color get textOnPrimary => const Color(0xFFFFFFFF);

  // Surface & Background
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF8FAFC);
  @override
  Color get background => const Color(0xFFF1F5F9);
  @override
  Color get backgroundSecondary => const Color(0xFFE2E8F0);

  // Gray scale
  @override
  Color get gray50 => const Color(0xFFF8FAFC);
  @override
  Color get gray100 => const Color(0xFFF1F5F9);
  @override
  Color get gray200 => const Color(0xFFE2E8F0);
  @override
  Color get gray300 => const Color(0xFFCBD5E1);
  @override
  Color get gray400 => const Color(0xFF94A3B8);
  @override
  Color get gray500 => const Color(0xFF64748B);

  // Semantic
  @override
  Color get success => const Color(0xFF22C55E);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get error => const Color(0xFFEF4444);
  @override
  Color get info => const Color(0xFF3B82F6);

  // Accent
  @override
  Color get gold => const Color(0xFFEAB308);
  @override
  Color get gold2 => const Color.fromARGB(255, 252, 191, 10);

  @override
  Color get premium => const Color(0xFFD97706);

  // Gradients

  @override
  LinearGradient get premiumGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: <double>[0, .75, .9, 1],
    colors: <Color>[
      Color.fromARGB(255, 173, 132, 10),
      Color(0xFF000000),
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );
  @override
  LinearGradient get premiumGradient2 => const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: <double>[0, .75, .9, 1],
    colors: <Color>[
      Color.fromARGB(255, 173, 132, 10),
      Color(0xFF000000),
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );
}

class DarkColors implements AppColors {
  @override
  Color get primary => const Color(0xFF14B8A6);
  @override
  Color get primaryLight => const Color(0xFF2DD4BF);
  @override
  Color get primaryDark => const Color(0xFF0D9488);

  // Text
  @override
  Color get textPrimary => const Color(0xFFF1F5F9);
  @override
  Color get textSecondary => const Color(0xFF94A3B8);
  @override
  Color get textTertiary => const Color(0xFF64748B);
  @override
  Color get textOnPrimary => const Color(0xFF0F172A);

  // Surface & Background
  @override
  Color get surface => const Color(0xFF1E293B);
  @override
  Color get surfaceVariant => const Color(0xFF334155);
  @override
  Color get background => const Color(0xFF0F172A);
  @override
  Color get backgroundSecondary => const Color(0xFF1E293B);

  // Gray scale
  @override
  Color get gray50 => const Color(0xFF334155);
  @override
  Color get gray100 => const Color(0xFF475569);
  @override
  Color get gray200 => const Color(0xFF64748B);
  @override
  Color get gray300 => const Color(0xFF94A3B8);
  @override
  Color get gray400 => const Color(0xFFCBD5E1);
  @override
  Color get gray500 => const Color(0xFFE2E8F0);

  // Semantic
  @override
  Color get success => const Color(0xFF4ADE80);
  @override
  Color get warning => const Color(0xFFFBBF24);
  @override
  Color get error => const Color(0xFFF87171);
  @override
  Color get info => const Color(0xFF60A5FA);

  // Accent - Amber/copper tones for dark mode premium feel
  @override
  Color get gold => const Color(0xFFFBBF24);
  @override
  Color get gold2 => const Color(0xFFF59E0B);

  @override
  Color get premium => const Color(0xFFF59E0B);

  // Gradients - Rich amber to deep purple for dark mode

  @override
  LinearGradient get premiumGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: <double>[0, .5, .75, 1],
    colors: <Color>[
      Color(0xFFF59E0B),
      Color(0xFFB45309),
      Color(0xFF7C2D12),
      Color(0xFF1E293B),
    ],
  );
  @override
  LinearGradient get premiumGradient2 => const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: <double>[0, .5, .75, 1],
    colors: <Color>[
      Color(0xFFF59E0B),
      Color(0xFFB45309),
      Color(0xFF7C2D12),
      Color(0xFF1E293B),
    ],
  );
}
