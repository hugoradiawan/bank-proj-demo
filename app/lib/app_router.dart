import 'package:app/home/route/home_route.dart';
import 'package:go_router/go_router.dart';
import 'package:premium/route.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[...premiumRoutes, ...homeRoutes],
  );
}
