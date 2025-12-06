import 'package:core/core.dart'
    show BlocProvider, MultiBlocProvider, RepositoryProvider;
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:go_router/go_router.dart'
    show GoRouteData, GoRouterHelper, GoRouterState, RouteBase, TypedGoRoute;
import 'package:premium/src/data/data_sources/country/country.local.datasource.dart'
    show CountryLocalDataSourceImpl;
import 'package:premium/src/data/data_sources/country/country.remote.datasource.dart'
    show CountryRemoteDataSourceImpl;
import 'package:premium/src/data/repositories/country.repository.implementation.dart';
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart';
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart';
import 'package:premium/src/domain/repositories/country.repository.dart';
import 'package:premium/src/presentation/cubits/registration_cubit.dart'
  show RegistrationCubit;
import 'package:premium/src/presentation/cubits/success_confetti_cubit.dart'
  show SuccessConfettiCubit;
import 'package:premium/src/presentation/pages/premium_bridge/premium_bridge.page.dart'
    show PremiumBridgePage;
import 'package:premium/src/presentation/pages/registration/registration.page.dart'
    show RegistrationPage;
import 'package:premium/src/presentation/pages/success/success.page.dart'
    show SuccessPage;

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
    //
    // ignore: always_specify_types
    providers: [
      RepositoryProvider<CountryRemoteDataSource>(
        create: (_) => CountryRemoteDataSourceImpl(),
      ),
      RepositoryProvider<CountryLocalDataSource>(
        create: (_) => CountryLocalDataSourceImpl(),
      ),
      RepositoryProvider<
        CountryRepository<CountryRemoteDataSource, CountryLocalDataSource>
      >(create: (_) => CountryRepositoryImpl()),
      const BlocProvider<RegistrationCubit>(create: RegistrationCubit.new),
    ],
    child: const RegistrationPage(),
  );
}

List<RouteBase> get premiumRoutes => $appRoutes;
