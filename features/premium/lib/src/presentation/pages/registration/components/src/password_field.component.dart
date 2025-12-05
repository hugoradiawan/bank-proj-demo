part of '../registration.component.dart';

class _PasswordField extends StatelessWidget {
  const _PasswordField();

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
          'Password',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<RegistrationCubit, RegistrationState>(
          buildWhen: (RegistrationState prev, RegistrationState curr) =>
              prev.isPasswordVisible != curr.isPasswordVisible,
          builder: (BuildContext context, RegistrationState state) =>
              AppTextField(
                hintText: '••••••••',
                prefixIcon: PhosphorIcon(
                  PhosphorIconsBold.key,
                  color: colors.gray400,
                  size: 20,
                ),
                suffixIcon: GestureDetector(
                  onTap: cubit.togglePasswordVisibility,
                  child: PhosphorIcon(
                    state.isPasswordVisible
                        ? PhosphorIconsBold.eye
                        : PhosphorIconsBold.eyeSlash,
                    color: colors.gray400,
                    size: 20,
                  ),
                ),
                obscureText: !state.isPasswordVisible,
                textInputAction: TextInputAction.done,
                onChanged: cubit.setPassword,
              ),
        ),
      ],
    );
  }
}
