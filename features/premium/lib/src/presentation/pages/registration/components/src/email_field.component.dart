part of '../registration.component.dart';

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);
    final RegistrationCubit cubit = context.read<RegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Email address',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<RegistrationCubit, RegistrationState>(
          buildWhen: (RegistrationState prev, RegistrationState curr) =>
              prev.showEmailError != curr.showEmailError ||
              prev.emailErrorText != curr.emailErrorText,
          builder: (BuildContext context, RegistrationState state) =>
              AppTextField(
                hintText: 'example@mail.com',
                prefixIcon: PhosphorIcon(
                  PhosphorIconsBold.envelope,
                  color: colors.gray400,
                  size: 20,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: cubit.setEmail,
                hasError: state.showEmailError,
                errorText: state.emailErrorText,
              ),
        ),
      ],
    );
  }
}
