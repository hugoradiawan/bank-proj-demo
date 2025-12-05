import 'package:core/core.dart' show ReadContext;
import 'package:core/network.dart' show HttpCubit, Response;
import 'package:flutter/material.dart';
import 'package:premium/src/data/models/country_with_flag.model.dart';
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart'
    show CountryRemoteDataSource;

class CountryRemoteDataSourceImpl extends CountryRemoteDataSource {
  @override
  Future<List<CountryWithFlagModel>> fetchCountriesWithFlag(
    BuildContext context,
  ) async {
    final Response<List<dynamic>> response = await client(context)
        .get<List<dynamic>>(
          'https://restcountries.com/v3.1/all?fields=name,flags,cca2',
        );
    return response.data
            ?.map<CountryWithFlagModel>(
              (dynamic item) =>
                  CountryWithFlagModel.fromJson(item as Map<String, dynamic>),
            )
            .toList() ??
        <CountryWithFlagModel>[];
  }

  @override
  HttpCubit client(BuildContext context) => context.read<HttpCubit>();
}
