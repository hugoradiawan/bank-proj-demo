import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';

abstract class CountryLocalDataSource extends LocalDataSource {
  Future<List<CountryWithFlagModel>> getCountriesWithFlag(BuildContext context);

  Future<void> saveCountriesWithFlag(
    BuildContext context,
    List<CountryWithFlagModel> countries,
  );
}
