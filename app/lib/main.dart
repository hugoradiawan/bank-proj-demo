import 'package:app/home/route/home_route.dart' show homeRoutes;
import 'package:core/core.dart' show AppTheme, AppTypography;
import 'package:flutter/material.dart'
    show
        AnnotatedRegion,
        Brightness,
        Colors,
        MaterialApp,
        StatelessWidget,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlayStyle;
import 'package:go_router/go_router.dart' show GoRouter, RouteBase;
import 'package:premium/route.dart' show premiumRoutes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTypography.init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
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
    child: MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    ),
  );
}

class AppRouter {
  AppRouter._();

  static GoRouter get router =>
      GoRouter(routes: <RouteBase>[...premiumRoutes, ...homeRoutes]);
}
