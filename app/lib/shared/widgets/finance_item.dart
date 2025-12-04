import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';

class FinanceItem extends StatelessWidget {
  const FinanceItem({
    required this.icon,
    required this.label,
    this.iconColor,
    this.onTap,
    super.key,
  });

  final Widget icon;
  final String label;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LightColors colors = LightColors();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 40, height: 40, child: Center(child: icon)),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
