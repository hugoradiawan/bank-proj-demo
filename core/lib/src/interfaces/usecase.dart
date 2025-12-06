import 'package:core/src/interfaces/data_source.dart';
import 'package:core/src/interfaces/params.dart';
import 'package:core/src/interfaces/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UseCase<
  R extends Repository<RemoteDataSource, LocalDataSource>,
  P extends Params
> {
  R repository(BuildContext context) => RepositoryProvider.of<R>(context);

  Stream<dynamic> call(BuildContext context, P params);
}
