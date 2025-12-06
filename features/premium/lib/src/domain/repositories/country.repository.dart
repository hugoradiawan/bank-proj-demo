import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';

abstract class CountryRepository<
  R extends RemoteDataSource,
  L extends LocalDataSource
>
    extends Repository<R, L> {
  Stream<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  );
}
