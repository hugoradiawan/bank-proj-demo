import 'package:app/home/home_page.dart' show HomePage;
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:go_router/go_router.dart'
    show GoRouteData, GoRouterHelper, GoRouterState, RouteBase, TypedGoRoute;

part 'home_route.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

List<RouteBase> get homeRoutes => $appRoutes;
