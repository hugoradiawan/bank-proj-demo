part of '../../registration_cubit.dart';

class _RegistrationState {
  const _RegistrationState({
    this.fullName = '',
    this.email = '',
    this.country,
    this.password = '',
    this.isPasswordVisible = false,
    this.countries = const <Country>[],
    this.isFullNameTouched = false,
    this.isEmailTouched = false,
    this.isPasswordTouched = false,
  });

  final String fullName;
  final String email;
  final Country? country;
  final String password;
  final bool isPasswordVisible;
  final List<Country> countries;
  final bool isFullNameTouched;
  final bool isEmailTouched;
  final bool isPasswordTouched;

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

  bool get showFullNameError => isFullNameTouched && !isFullNameValid;
  bool get showEmailError => isEmailTouched && !isEmailValid;
  bool get showPasswordError => isPasswordTouched && !isPasswordValid;

  String? get fullNameErrorText =>
      showFullNameError ? 'Full name is required' : null;

  String? get emailErrorText {
    if (!isEmailTouched) return null;
    if (email.trim().isEmpty) return 'Email address is required';
    if (!_emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  _RegistrationState copyWith({
    String? fullName,
    String? email,
    Country? country,
    String? password,
    bool? isPasswordVisible,
    List<Country>? countries,
    bool? isFullNameTouched,
    bool? isEmailTouched,
    bool? isPasswordTouched,
  }) => _RegistrationState(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    country: country ?? this.country,
    password: password ?? this.password,
    isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    countries: countries ?? this.countries,
    isFullNameTouched: isFullNameTouched ?? this.isFullNameTouched,
    isEmailTouched: isEmailTouched ?? this.isEmailTouched,
    isPasswordTouched: isPasswordTouched ?? this.isPasswordTouched,
  );
}
