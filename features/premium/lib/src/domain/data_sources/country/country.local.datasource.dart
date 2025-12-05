import 'package:core/core.dart' show LocalDataSource;
import 'package:flutter/material.dart' show BuildContext;
import 'package:premium/src/data/models/country_with_flag.model.dart'
    show CountryWithFlagModel;

abstract class CountryLocalDataSource extends LocalDataSource {
  Future<List<CountryWithFlagModel>> getCountriesWithFlag(BuildContext context);

  Future<void> saveCountriesWithFlag(
    BuildContext context,
    List<CountryWithFlagModel> countries,
  );
}
