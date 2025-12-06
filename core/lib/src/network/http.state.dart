import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/http.state.freezed.dart';

@freezed
sealed class HttpState with _$HttpState {
  const factory HttpState.initial(Dio client) = HttpInitial;
}
