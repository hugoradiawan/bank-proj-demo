// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _AppBottomNavBar extends StatelessWidget {
  const _AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(_) => Padding(
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
              icon: currentIndex == 0
                  ? PhosphorIconsFill.house
                  : PhosphorIconsBold.house,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavItem(
              icon: currentIndex == 1
                  ? PhosphorIconsFill.coins
                  : PhosphorIconsBold.coins,
              label: 'Finance',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavItem(
              icon: currentIndex == 2
                  ? PhosphorIconsFill.qrCode
                  : PhosphorIconsBold.qrCode,
              label: 'QRIS',
              isQris: true,
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _NavItem(
              icon: currentIndex == 3
                  ? PhosphorIconsFill.chartPieSlice
                  : PhosphorIconsBold.chartPieSlice,
              label: 'Portfolio',
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
            _NavItem(
              icon: currentIndex == 4
                  ? PhosphorIconsFill.user
                  : PhosphorIconsBold.user,
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
