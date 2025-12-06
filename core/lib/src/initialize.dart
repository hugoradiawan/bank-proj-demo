import 'package:core/src/interfaces/local_data_repository.dart'
    show LocalDataRepository;
import 'package:core/src/local_data/shared_prefenrences.dart'
    show SharedPreferencesService;
import 'package:core/src/network/http_cubit.dart' show HttpCubit;
import 'package:core/src/state_management/bloc.dart';
import 'package:core/src/theme/app_typography.dart' show AppTypography;
import 'package:core/src/theme/theme_cubit.dart' show ThemeCubit;
import 'package:dio/dio.dart' show BaseOptions;
import 'package:flutter/material.dart' show AnnotatedRegion, Colors, Widget;
import 'package:flutter/services.dart'
    show
        Brightness,
        DeviceOrientation,
        SystemChrome,
        SystemUiMode,
        SystemUiOverlayStyle;

class Core {
  Core._();

  static const SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  static Future<void> initialize() async {
    AppTypography.init();
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await SharedPreferencesService().init();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static Widget init({required Widget child}) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: MultiBlocProvider(
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
              create: (_) => ThemeCubit(
                sharedPreferences: SharedPreferencesService().prefs,
              ),
            ),
            RepositoryProvider<LocalDataRepository>.value(
              value: SharedPreferencesService(),
            ),
          ],
          child: child,
        ),
      );
}
