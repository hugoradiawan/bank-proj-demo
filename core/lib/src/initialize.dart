import 'package:core/core.dart';
import 'package:core/src/local_data/shared_prefenrences.dart';
import 'package:core/src/network/http_cubit.dart';
import 'package:core/src/theme/app_typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'core.provider.dart';

class Core {
  Core._();

  static void _setOverlayStyle({required bool isDarkMode}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDarkMode
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDarkMode
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
  }

  static Future<void> initialize() async {
    AppTypography.init();
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await SharedPreferencesService().init();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  static Widget init({
    required Widget Function(BuildContext, ThemeMode) builder,
  }) => MultiBlocProvider(
    providers: _CoreProvider.providers,
    child: BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (BuildContext context, ThemeMode state) {
        final bool isDarkMode =
            state == ThemeMode.dark ||
            (state == ThemeMode.system &&
                MediaQuery.platformBrightnessOf(context) == Brightness.dark);
        _setOverlayStyle(isDarkMode: isDarkMode);
        return builder(context, state);
      },
    ),
  );
}
