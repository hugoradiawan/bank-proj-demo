import 'package:app/home/route/home_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:premium/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Core.initialize();
  runApp(const MondooliApp());
}

class MondooliApp extends StatelessWidget {
  const MondooliApp({super.key});

  static const SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  @override
  Widget build(_) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: _overlayStyle,
    child: Core.init(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (_, ThemeMode themeMode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          routerConfig: AppRouter.router,
        ),
      ),
    ),
  );
}

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[...premiumRoutes, ...homeRoutes],
  );
}
