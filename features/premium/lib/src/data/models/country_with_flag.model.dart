import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:premium/src/domain/entities/country_with_flag.entity.dart'
    show CountryWithFlag;

part 'generated/country_with_flag.model.freezed.dart';
part 'generated/country_with_flag.model.g.dart';

@freezed
sealed class CountryWithFlagModel
    with _$CountryWithFlagModel
    implements CountryWithFlag {
  const factory CountryWithFlagModel({
    required String cca2,
    required String officialName,
    String? flag,
  }) = _CountryWithFlagModel;

  factory CountryWithFlagModel.fromJson(Map<String, dynamic> json) =>
      _$CountryWithFlagModelFromJson(json);
}
