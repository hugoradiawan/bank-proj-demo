import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:premium/src/domain/entities/country_with_flag.entity.dart'
    show CountryWithFlag, Flag, Name;

part 'generated/country_with_flag.model.freezed.dart';
part 'generated/country_with_flag.model.g.dart';

@freezed
abstract class CountryWithFlagModel
    with _$CountryWithFlagModel
    implements CountryWithFlag {
  const factory CountryWithFlagModel({
    required String cca2,
    required NameModel name,
    required FlagModel? flags,
  }) = _CountryWithFlagModel;

  factory CountryWithFlagModel.fromJson(Map<String, dynamic> json) =>
      _$CountryWithFlagModelFromJson(json);
}

@freezed
abstract class FlagModel with _$FlagModel implements Flag {
  const factory FlagModel({
    required String png,
    required String svg,
    required String alt,
  }) = _FlagModel;

  factory FlagModel.fromJson(Map<String, dynamic> json) =>
      _$FlagModelFromJson(json);
}

@freezed
abstract class NameModel with _$NameModel implements Name {
  const factory NameModel({required String common, required String official}) =
      _NameModel;

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);
}
