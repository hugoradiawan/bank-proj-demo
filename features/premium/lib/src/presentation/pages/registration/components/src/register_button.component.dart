part of '../registration.component.dart';

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();
    final ThemeData theme = Theme.of(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: BlocBuilder<RegistrationCubit, RegistrationState>(
              buildWhen: (RegistrationState prev, RegistrationState curr) =>
                  prev.isValid != curr.isValid,
              builder: (BuildContext context, RegistrationState state) {
                final RegistrationCubit cubit = context
                    .read<RegistrationCubit>();

                return FilledButton(
                  onPressed: state.isValid ? () => cubit.submit(context) : null,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: state.isValid
                        ? colors.primary
                        : colors.gray200,
                    foregroundColor: state.isValid
                        ? colors.textOnPrimary
                        : colors.gray400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Register for Premium',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: state.isValid
                          ? colors.textOnPrimary
                          : colors.gray400,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
