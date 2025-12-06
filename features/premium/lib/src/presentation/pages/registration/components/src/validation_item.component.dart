part of '../registration.component.dart';

class _ValidationItem extends StatelessWidget {
  const _ValidationItem({required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);
    final Color checkColor = isValid ? colors.success : colors.gray400;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PhosphorIcon(PhosphorIconsBold.check, color: checkColor, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isValid ? colors.success : colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
