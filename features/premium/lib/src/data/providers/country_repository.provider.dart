import 'package:core/core.dart';
import 'package:premium/src/data/data_sources/country/country.local.datasource.dart';
import 'package:premium/src/data/data_sources/country/country.remote.datasource.dart';
import 'package:premium/src/data/repositories/country.repository.implementation.dart';
import 'package:premium/src/domain/data_sources/country/country.local.datasource.dart';
import 'package:premium/src/domain/data_sources/country/country.remote.datasource.dart';
import 'package:premium/src/domain/repositories/country.repository.dart';

class CountryRepositoryProvider {
  CountryRepositoryProvider._();

  static List<SingleChildWidget> get provider => <SingleChildWidget>[
    RepositoryProvider<CountryRemoteDataSource>(
      create: (_) => CountryRemoteDataSourceImpl(),
    ),
    RepositoryProvider<CountryLocalDataSource>(
      create: (_) => CountryLocalDataSourceImpl(),
    ),
    RepositoryProvider<
      CountryRepository<CountryRemoteDataSource, CountryLocalDataSource>
    >(create: (_) => CountryRepositoryImpl()),
  ];
}
