// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isQris = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isQris;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;
    final Color color = isSelected ? colors.primary : colors.gray400;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                bottom: !isQris ? 0 : 4,
                top: !isQris ? 0 : 6,
              ),
              padding: EdgeInsets.fromLTRB(8, 8, 8, isQris ? 8 : 0),
              decoration: BoxDecoration(
                color: isQris ? colors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: PhosphorIcon(
                icon,
                color: isQris ? colors.surface : color,
                size: 24,
              ),
            ),
            if (!isQris) const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isQris ? colors.primary : color,
                fontWeight: isQris
                    ? FontWeight.w900
                    : isSelected
                    ? FontWeight.w600
                    : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
