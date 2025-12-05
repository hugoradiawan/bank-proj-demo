part of '../registration_cubit.dart';

class _RegistrationState {
  const _RegistrationState({
    this.fullName = '',
    this.email = '',
    this.country,
    this.password = '',
    this.isPasswordVisible = false,
    this.countries = const <Country>[],
  });

  final String fullName;
  final String email;
  final Country? country;
  final String password;
  final bool isPasswordVisible;
  final List<Country> countries;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  bool get isFullNameValid => fullName.trim().isNotEmpty;

  bool get isEmailValid =>
      email.trim().isNotEmpty && _emailRegex.hasMatch(email.trim());

  bool get isCountrySelected => country != null;

  bool get passwordHas8To16Chars =>
      password.length >= 8 && password.length <= 16;

  bool get passwordHasSpecialChar =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\;/~`]').hasMatch(password);

  bool get passwordHasMultipleCapitals =>
      RegExp('[A-Z]').allMatches(password).length >= 2;

  bool get passwordHasMultipleNumbers =>
      RegExp('[0-9]').allMatches(password).length >= 2;

  bool get isPasswordValid =>
      passwordHas8To16Chars &&
      passwordHasSpecialChar &&
      passwordHasMultipleCapitals &&
      passwordHasMultipleNumbers;

  bool get isValid =>
      isFullNameValid && isEmailValid && isCountrySelected && isPasswordValid;

  _RegistrationState copyWith({
    String? fullName,
    String? email,
    Country? country,
    String? password,
    bool? isPasswordVisible,
    List<Country>? countries,
  }) => _RegistrationState(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    country: country ?? this.country,
    password: password ?? this.password,
    isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    countries: countries ?? this.countries,
  );
}
