import 'package:app/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

List<RouteBase> get homeRoutes => $appRoutes;
