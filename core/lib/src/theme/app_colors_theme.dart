import 'package:core/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme._({required this.colors});

  final AppColors colors;

  static AppColorsTheme get light => AppColorsTheme._(colors: LightColors());

  static AppColorsTheme get dark => AppColorsTheme._(colors: DarkColors());

  @override
  AppColorsTheme copyWith({AppColors? colors}) =>
      AppColorsTheme._(colors: colors ?? this.colors);

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;
    return t < 0.5 ? this : other;
  }
}

extension AppColorsThemeX on ThemeData {
  AppColors get appColors {
    final AppColorsTheme? ext = extension<AppColorsTheme>();
    return ext?.colors ?? LightColors();
  }
}

extension AppColorsContextX on BuildContext {
  AppColors get colors => Theme.of(this).appColors;
}
