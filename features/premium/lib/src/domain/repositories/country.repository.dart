import 'package:core/core.dart'
    show LocalDataSource, RemoteDataSource, Repository;
import 'package:flutter/material.dart' show BuildContext;
import 'package:premium/src/data/models/country_with_flag.model.dart'
    show CountryWithFlagModel;

abstract class CountryRepository<
  R extends RemoteDataSource,
  L extends LocalDataSource
>
    extends Repository<R, L> {
  Stream<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  );
}
