import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _themeModeKey = 'theme_mode';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences,
      super(_loadInitialTheme(sharedPreferences));

  final SharedPreferences _sharedPreferences;

  static ThemeMode _loadInitialTheme(SharedPreferences prefs) {
    final String? storedMode = prefs.getString(_themeModeKey);
    return switch (storedMode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _sharedPreferences.setString(_themeModeKey, mode.name);
    emit(mode);
  }

  Future<void> toggleTheme() async {
    final ThemeMode newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.dark,
    };
    await setThemeMode(newMode);
  }

  Future<void> useSystemTheme() async => setThemeMode(ThemeMode.system);

  bool get isDarkMode => state == ThemeMode.dark;

  bool get isLightMode => state == ThemeMode.light;

  bool get isSystemMode => state == ThemeMode.system;
}
