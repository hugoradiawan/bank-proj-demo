part of '../registration.component.dart';

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12 * spacingMultiplier,
                  bottom: 8 * spacingMultiplier,
                ),
                child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  buildWhen: (RegistrationState prev, RegistrationState curr) =>
                      prev.isValid != curr.isValid,
                  builder: (BuildContext context, RegistrationState state) {
                    final RegistrationCubit cubit = context
                        .read<RegistrationCubit>();

                    return FilledButton(
                      onPressed: state.isValid ? () => cubit.submit(context) : null,
                      style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(52 * spacingMultiplier),
                        backgroundColor: state.isValid
                            ? colors.primary
                            : colors.primary.withValues(alpha: 0.5),
                        foregroundColor: colors.textOnPrimary,
                        disabledBackgroundColor: colors.primary.withValues(
                          alpha: 0.5,
                        ),
                        disabledForegroundColor: colors.textOnPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Register for Premium',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.textOnPrimary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
