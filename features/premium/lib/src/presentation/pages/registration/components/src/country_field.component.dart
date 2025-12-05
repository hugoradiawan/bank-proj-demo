part of '../registration.component.dart';

class _CountryField extends StatelessWidget {
  const _CountryField();

  @override
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();
    final ThemeData theme = Theme.of(context);
    final RegistrationCubit cubit = context.read<RegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Country',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<RegistrationCubit, RegistrationState>(
          buildWhen: (RegistrationState prev, RegistrationState curr) =>
              prev.country != curr.country,
          builder: (BuildContext context, RegistrationState state) =>
              CountrySelector(
                selectedCountry: state.country,
                onCountrySelected: cubit.setCountry,
              ),
        ),
      ],
    );
  }
}
