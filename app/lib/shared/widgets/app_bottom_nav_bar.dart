import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(height: 1, color: LightColors().gray200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _NavItem(
              icon: PhosphorIconsBold.house,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavItem(
              icon: PhosphorIconsBold.wallet,
              label: 'Finance',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavItem(
              icon: PhosphorIconsBold.qrCode,
              label: 'QRIS',
              isQris: true,
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _NavItem(
              icon: PhosphorIconsBold.chartLineUp,
              label: 'Portfolio',
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
            _NavItem(
              icon: PhosphorIconsBold.userCircle,
              label: 'Profile',
              isSelected: currentIndex == 4,
              onTap: () => onTap(4),
            ),
          ],
        ),
      ],
    ),
  );
}

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
    final LightColors colors = LightColors();
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
