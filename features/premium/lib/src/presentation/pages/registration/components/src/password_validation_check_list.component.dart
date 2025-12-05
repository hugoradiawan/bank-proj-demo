part of '../registration.component.dart';

class _PasswordValidationChecklist extends StatelessWidget {
  const _PasswordValidationChecklist();

  @override
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (RegistrationState prev, RegistrationState curr) =>
          prev.password != curr.password,
      builder: (BuildContext context, RegistrationState state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Password must contain:',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          _ValidationItem(
            text: '8 - 16 characters',
            isValid: state.passwordHas8To16Chars,
          ),
          const SizedBox(height: 4),
          _ValidationItem(
            text: 'Special character (ex: @, ; , etc...)',
            isValid: state.passwordHasSpecialChar,
          ),
          const SizedBox(height: 4),
          _ValidationItem(
            text: 'Capital letters',
            isValid: state.passwordHasMultipleCapitals,
          ),
          const SizedBox(height: 4),
          _ValidationItem(
            text: 'Numbers',
            isValid: state.passwordHasMultipleNumbers,
          ),
        ],
      ),
    );
  }
}
