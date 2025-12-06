import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premium/src/data/providers/country_repository.provider.dart'
    show CountryRepositoryProvider;
import 'package:premium/src/presentation/cubits/registration_cubit.dart';
import 'package:premium/src/presentation/cubits/success_confetti_cubit.dart';
import 'package:premium/src/presentation/pages/premium_bridge/premium_bridge.page.dart';
import 'package:premium/src/presentation/pages/registration/registration.page.dart';
import 'package:premium/src/presentation/pages/success/success.page.dart';

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

@TypedGoRoute<SuccessRoute>(path: '/success')
class SuccessRoute extends GoRouteData with $SuccessRoute {
  factory SuccessRoute() => SuccessRoute._();
  SuccessRoute._();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      BlocProvider<SuccessConfettiCubit>(
        create: (_) => SuccessConfettiCubit(),
        child: const SuccessPage(),
      );
}

@TypedGoRoute<RegistrationRoute>(path: '/registration')
class RegistrationRoute extends GoRouteData with $RegistrationRoute {
  factory RegistrationRoute() => RegistrationRoute._();
  RegistrationRoute._();

  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
    providers: <SingleChildWidget>[
      ...CountryRepositoryProvider.provider,
      const BlocProvider<RegistrationCubit>(create: RegistrationCubit.new),
    ],
    child: const RegistrationPage(),
  );
}

List<RouteBase> get premiumRoutes => $appRoutes;
