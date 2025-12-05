import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:go_router/go_router.dart'
    show GoRouteData, GoRouterHelper, GoRouterState, RouteBase, TypedGoRoute;
import 'package:premium/src/premium_bridge.page.dart' show PremiumBridgePage;

part 'premium.route.g.dart';

@TypedGoRoute<PremiumBridgeRoute>(path: '/premium-bridge')
class PremiumBridgeRoute extends GoRouteData with $PremiumBridgeRoute {
  PremiumBridgeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PremiumBridgePage(onAccessPremiumNow: () {});
}

List<RouteBase> get premiumRoutes => $appRoutes;
