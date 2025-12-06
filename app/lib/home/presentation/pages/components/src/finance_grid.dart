// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _FinanceGrid extends StatelessWidget {
  const _FinanceGrid({
    this.onInsurance,
    this.onGold,
    this.onBills,
    this.onElectricity,
    this.onViewMore,
    super.key,
  });

  final VoidCallback? onInsurance;
  final VoidCallback? onGold;
  final VoidCallback? onBills;
  final VoidCallback? onElectricity;
  final VoidCallback? onViewMore;

  @override
  Widget build(BuildContext context) {
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);
    final double iconSize = Responsive.isTabletOrLarger(context) ? 56 : 45;

    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'Finance',
          actionText: 'View more',
          onActionTap: onViewMore,
        ),
        SizedBox(height: 16 * spacingMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            QuickActionButton(
              icon: Image.asset(
                'assets/images/insurance.webp',
                width: iconSize,
                height: iconSize,
              ),
              label: 'Insurance',
              onTap: onInsurance,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/gold.webp',
                width: iconSize,
                height: iconSize,
              ),
              label: 'Gold',
              onTap: onGold,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/bills.webp',
                width: iconSize,
                height: iconSize,
              ),
              label: 'Bills',
              onTap: onBills,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/electricity.webp',
                width: iconSize,
                height: iconSize,
              ),
              label: 'Electricity',
              onTap: onElectricity,
            ),
          ],
        ),
      ],
    );
  }
}
