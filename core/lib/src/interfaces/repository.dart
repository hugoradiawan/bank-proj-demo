import 'package:core/src/interfaces/data_source.dart'
    show LocalDataSource, RemoteDataSource;
import 'package:flutter/material.dart';

abstract class Repository<
  Remote extends RemoteDataSource,
  Local extends LocalDataSource
> {
  Remote remote(BuildContext context);
  Local local(BuildContext context);
}
