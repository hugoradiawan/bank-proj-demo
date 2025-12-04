import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FinanceGrid extends StatelessWidget {
  const FinanceGrid({
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
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        SectionHeader(
          title: 'Finance',
          actionText: 'View more',
          onActionTap: onViewMore,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            QuickActionButton(
              icon: Image.asset(
                'assets/images/insurance.webp',
                width: 45,
                height: 45,
              ),
              label: 'Insurance',
              onTap: onInsurance,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/gold.webp',
                width: 45,
                height: 45,
              ),
              label: 'Gold',
              onTap: onGold,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/bills.webp',
                width: 45,
                height: 45,
              ),
              label: 'Bills',
              onTap: onBills,
            ),
            QuickActionButton(
              icon: Image.asset(
                'assets/images/electricity.webp',
                width: 45,
                height: 45,
              ),
              label: 'Electricity',
              onTap: onElectricity,
            ),
          ],
        ),
      ],
    );
}
