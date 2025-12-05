import 'package:core/src/interfaces/local_data_repository.dart'
    show LocalDataRepository;
import 'package:core/src/network/http_cubit.dart';
import 'package:flutter/material.dart';

sealed class DataSource {}

// We need this to simplify the httpCubit access from remote data sources
// ignore: one_member_abstracts
abstract class RemoteDataSource {
  HttpCubit client(BuildContext context);
}

// We need this to simplify the LocalDataRepository access from remote data sources
// ignore: one_member_abstracts
abstract class LocalDataSource {
  LocalDataRepository local(BuildContext context);
}
