import 'package:core/core.dart' show AppColors, AppColorsContextX;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        FontWeight,
        Icon,
        Icons,
        InkWell,
        MainAxisAlignment,
        MainAxisSize,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        VoidCallback,
        Widget;

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.actionText,
    this.onActionTap,
    super.key,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        if (actionText != null)
          InkWell(
            borderRadius: BorderRadius.circular(4),
            splashColor: colors.primaryLight.withValues(alpha: 0.3),
            onTap: onActionTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 6),
                Text(
                  actionText!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.info,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(Icons.chevron_right, color: colors.info, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}
