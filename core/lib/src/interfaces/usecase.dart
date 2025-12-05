import 'package:core/src/interfaces/data_source.dart'
    show LocalDataSource, RemoteDataSource;
import 'package:core/src/interfaces/params.dart' show Params;
import 'package:core/src/interfaces/repository.dart' show Repository;
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart' show RepositoryProvider;

abstract class UseCase<
  R extends Repository<RemoteDataSource, LocalDataSource>,
  P extends Params
> {
  R repository(BuildContext context) => RepositoryProvider.of<R>(context);

  Future<dynamic> call(BuildContext context, P params);
}
