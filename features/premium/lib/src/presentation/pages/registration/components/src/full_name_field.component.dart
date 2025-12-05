part of '../registration.component.dart';

class _FullNameField extends StatelessWidget {
  const _FullNameField();

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
          'Full name',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        AppTextField(
          hintText: 'Your name',
          prefixIcon: PhosphorIcon(
            PhosphorIconsBold.user,
            color: colors.gray400,
            size: 20,
          ),
          textInputAction: TextInputAction.next,
          onChanged: cubit.setFullName,
        ),
      ],
    );
  }
}
