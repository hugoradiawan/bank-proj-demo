import 'package:core/core.dart' show AppColors, AppColorsContextX;
import 'package:flutter/material.dart'
    show
        Alignment,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        Clip,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        InkWell,
        MainAxisSize,
        Positioned,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        VoidCallback,
        Widget;

class QuickActionButton extends StatelessWidget {
  const QuickActionButton({
    required this.icon,
    required this.label,
    this.badge,
    this.onTap,
    super.key,
  });

  final Widget icon;
  final String label;
  final String? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;
    return Expanded(
      child: InkWell(
        splashColor: colors.primaryLight.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: <Widget>[
                SizedBox(child: Center(child: icon)),
                if (badge != null)
                  Positioned(
                    top: -10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceVariant,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: colors.success.withValues(alpha: .2),
                        ),
                      ),
                      child: Text(
                        badge!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colors.success,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
