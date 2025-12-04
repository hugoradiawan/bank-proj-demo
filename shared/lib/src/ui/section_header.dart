import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';

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
            splashColor: LightColors().primaryLight.withValues(alpha: 0.3),
            onTap: onActionTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 6),
                Text(
                  actionText!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: LightColors().info,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(Icons.chevron_right, color: LightColors().info, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}
