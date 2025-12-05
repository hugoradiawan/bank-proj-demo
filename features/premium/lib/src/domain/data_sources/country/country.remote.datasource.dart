import 'package:core/core.dart' show RemoteDataSource;
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart'
    show CountryWithFlagModel;

abstract class CountryRemoteDataSource extends RemoteDataSource {
  Future<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  );
}
