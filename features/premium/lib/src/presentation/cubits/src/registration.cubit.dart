part of '../registration_cubit.dart';

class _RegistrationCubit extends Cubit<_RegistrationState> {
  _RegistrationCubit() : super(const _RegistrationState());

  void setFullName(String value) => emit(state.copyWith(fullName: value));

  void setEmail(String value) => emit(state.copyWith(email: value));

  void setCountry(Country country) => emit(state.copyWith(country: country));

  void setPassword(String value) => emit(state.copyWith(password: value));

  void togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  void submit() {
    if (state.isValid) {
      //TODO(me): Handle submission
    }
  }
}
