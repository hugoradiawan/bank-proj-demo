import 'package:core/src/interfaces/local_data_repository.dart';
import 'package:core/src/local_data/shared_prefenrences.dart';
import 'package:core/src/network/http_cubit.dart';
import 'package:core/src/state_management/bloc.dart';
import 'package:core/src/theme/app_typography.dart';
import 'package:core/src/theme/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class Core {
  Core._();

  static void _setOverlayStyle({required bool isDarkMode}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
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
        // can't import the type SingleChildWidget
        // ignore: always_specify_types
        providers: [
          BlocProvider<HttpCubit>(
            create: (_) => HttpCubit(
              BaseOptions(
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 30),
              ),
            ),
          ),
          BlocProvider<ThemeCubit>(
            create: (_) =>
                ThemeCubit(sharedPreferences: SharedPreferencesService().prefs),
          ),
          RepositoryProvider<LocalDataRepository>.value(
            value: SharedPreferencesService(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (BuildContext context, ThemeMode state) {
            final bool isDarkMode = state == ThemeMode.dark ||
                (state == ThemeMode.system &&
                    MediaQuery.platformBrightnessOf(context) == Brightness.dark);
            _setOverlayStyle(isDarkMode: isDarkMode);
            return builder(context, state);
          },
        ),
      );
}
