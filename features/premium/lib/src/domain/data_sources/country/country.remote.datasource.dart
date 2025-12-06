import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';

abstract class CountryRemoteDataSource extends RemoteDataSource {
  Future<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  );
}
