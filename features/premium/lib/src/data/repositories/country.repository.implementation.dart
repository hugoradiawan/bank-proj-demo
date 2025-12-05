import 'dart:async';

import 'package:core/core.dart' show ReadContext;
import 'package:flutter/material.dart' show BuildContext;
import 'package:premium/src/data/models/country_with_flag.model.dart';
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart'
    show CountryLocalDataSource;
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart'
    show CountryRemoteDataSource;
import 'package:premium/src/domain/repositories/country.repository.dart'
    show CountryRepository;

class CountryRepositoryImpl
    implements
        CountryRepository<CountryRemoteDataSource, CountryLocalDataSource> {
  @override
  Stream<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  ) async* {
    final List<CountryWithFlagModel> localCountries = await local(
      context,
    ).getCountriesWithFlag(context);
    yield localCountries;
    if (!context.mounted) return;
    final List<CountryWithFlagModel> remoteCountries = await remote(
      context,
    ).fetchCountriesWithFlag(context);
    if (!context.mounted) return;
    unawaited(local(context).saveCountriesWithFlag(context, remoteCountries));
    yield remoteCountries;
  }

  @override
  CountryLocalDataSource local(BuildContext context) =>
      context.read<CountryLocalDataSource>();

  @override
  CountryRemoteDataSource remote(BuildContext context) =>
      context.read<CountryRemoteDataSource>();
}
