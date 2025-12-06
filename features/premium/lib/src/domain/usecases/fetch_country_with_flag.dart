import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart';
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart';
import 'package:premium/src/domain/repositories/country.repository.dart';

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
