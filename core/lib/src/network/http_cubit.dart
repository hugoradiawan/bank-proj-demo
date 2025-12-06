import 'package:core/src/network/http.state.dart';
import 'package:core/src/state_management/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HttpCubit extends Cubit<HttpState> {
  HttpCubit(BaseOptions baseOptions) : super(HttpInitial(Dio(baseOptions)));

  void setUserAgent(String userAgent) {
    state.client.options.headers['HTTP_USER_AGENT'] = userAgent;
  }

  Future<Response<Res>> get<Res>(
    String path, {
    Res? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) => state.client.get(
    path,
    queryParameters: queryParameters,
    options: options,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress,
  );

  Future<Response<Res>> post<Res>(
    String path, {
    Res? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) => state.client.post(
    path,
    data: data,
    queryParameters: queryParameters,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
  );

  Future<Response<Res>> put<Res>(
    String path, {
    Res? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) => state.client.put(
    path,
    data: data,
    options: options,
    cancelToken: cancelToken,
    queryParameters: queryParameters,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
  );

  Future<Response<Res>> patch<Res>(
    String path, {
    Res? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) => state.client.patch(
    path,
    data: data,
    cancelToken: cancelToken,
    options: options,
    queryParameters: queryParameters,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
  );

  Future<Response<Res>> delete<Res>(
    String path, {
    Res? data,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) => state.client.delete(
    path,
    data: data,
    cancelToken: cancelToken,
    options: options,
    queryParameters: queryParameters,
  );
}

extension HttpCubitContext on BuildContext {
  HttpCubit get httpClient => read<HttpCubit>();
}
