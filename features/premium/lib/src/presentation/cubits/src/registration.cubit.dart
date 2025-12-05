part of '../registration_cubit.dart';

class _RegistrationCubit extends Cubit<_RegistrationState> {
  _RegistrationCubit(BuildContext context) : super(const _RegistrationState()) {
    _fetchCountry(context);
  }
  final FetchCountryWithFlagUseCase _usecase = FetchCountryWithFlagUseCase();

  void _fetchCountry(BuildContext context) {
    _usecase(context, const NoParams()).listen(
      (List<CountryWithFlagModel> countries) => emit(
        state.copyWith(
          countries: countries
              .map(
                (CountryWithFlagModel e) => Country(
                  name: e.name.official,
                  code: e.cca2,
                  flag: e.flags?.png,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void setFullName(String value) => emit(state.copyWith(fullName: value));

  void setEmail(String value) => emit(state.copyWith(email: value));

  void setCountry(Country country) => emit(state.copyWith(country: country));

  void setPassword(String value) => emit(state.copyWith(password: value));

  void togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  void submit(BuildContext context) {
    if (state.isValid) {
      SuccessRoute().pushReplacement(context);
    }
  }
}
