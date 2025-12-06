part of 'initialize.dart';

class _CoreProvider {
  _CoreProvider._();

  static List<SingleChildWidget> get providers => <SingleChildWidget>[
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
  ];
}
