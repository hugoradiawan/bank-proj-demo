import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart';

class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  final String _getCountriesWithFlagKey = 'countries_with_flag';
  @override
  Future<List<CountryWithFlagModel>> getCountriesWithFlag(
    BuildContext context,
  ) async {
    final List<Map<String, dynamic>>? response = local(
      context,
    ).getJsonList(_getCountriesWithFlagKey);
    if (response == null) {
      return <CountryWithFlagModel>[];
    }
    return response
        .map<CountryWithFlagModel>(CountryWithFlagModel.fromJson)
        .toList();
  }

  @override
  LocalDataRepository local(BuildContext context) =>
      context.read<LocalDataRepository>();

  @override
  Future<void> saveCountriesWithFlag(
    BuildContext context,
    List<CountryWithFlagModel> countries,
  ) {
    final List<Map<String, dynamic>> countriesJson = countries
        .map<Map<String, dynamic>>(
          (CountryWithFlagModel country) => country.toJson(),
        )
        .toList();
    return local(context).saveJsonList(_getCountriesWithFlagKey, countriesJson);
  }
}
