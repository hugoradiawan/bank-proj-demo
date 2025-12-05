import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:go_router/go_router.dart'
    show GoRouteData, GoRouterHelper, GoRouterState, RouteBase, TypedGoRoute;
import 'package:premium/src/presentation/pages/premium_bridge/premium_bridge.page.dart'
    show PremiumBridgePage;
import 'package:premium/src/presentation/pages/registration/registration.page.dart'
    show RegistrationPage;

part 'premium.route.g.dart';

@TypedGoRoute<PremiumBridgeRoute>(path: '/premium-bridge')
class PremiumBridgeRoute extends GoRouteData with $PremiumBridgeRoute {
  factory PremiumBridgeRoute() => PremiumBridgeRoute._();
  PremiumBridgeRoute._();

  @override
  Widget build(BuildContext context, GoRouterState state) => PremiumBridgePage(
    onAccessPremiumNow: () => RegistrationRoute().pushReplacement(context),
  );
}

@TypedGoRoute<RegistrationRoute>(path: '/registration')
class RegistrationRoute extends GoRouteData with $RegistrationRoute {
  factory RegistrationRoute() => RegistrationRoute._();
  RegistrationRoute._();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegistrationPage();
}

List<RouteBase> get premiumRoutes => $appRoutes;
