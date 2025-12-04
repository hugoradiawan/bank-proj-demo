import 'package:flutter/material.dart' show Color;

abstract class AppColors {
  Color get primary;
  Color get textPrimary;
  Color get surface;
}

class LightColors implements AppColors {
  @override
  Color get primary => const Color(0xFF1D4ED8);
  @override
  Color get textPrimary => const Color(0xFF1A233C);
  @override
  Color get surface => const Color(0xFFFFFFFF);
}
