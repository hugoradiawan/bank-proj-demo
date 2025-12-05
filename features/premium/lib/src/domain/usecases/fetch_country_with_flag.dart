import 'package:core/core.dart' show NoParams, UseCase;
import 'package:flutter/material.dart' show BuildContext;
import 'package:premium/src/data/models/country_with_flag.model.dart'
    show CountryWithFlagModel;
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart';
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart';
import 'package:premium/src/domain/repositories/country.repository.dart'
    show CountryRepository;

class FetchCountryWithFlagUseCase
    extends
        UseCase<
          CountryRepository<CountryRemoteDataSource, CountryLocalDataSource>,
          NoParams
        > {
  @override
  Stream<List<CountryWithFlagModel>> call(BuildContext context, _) =>
      repository(context).fetchCountriesWithFlag(context);
}
