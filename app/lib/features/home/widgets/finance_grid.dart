import 'package:app/shared/widgets/widgets.dart';
import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();

    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'Finance',
          actionText: 'View more',
          onActionTap: onViewMore,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FinanceItem(
              icon: PhosphorIcon(
                PhosphorIconsBold.shield,
                color: colors.primary,
                size: 24,
              ),
              label: 'Insurance',
              onTap: onInsurance,
            ),
            FinanceItem(
              icon: PhosphorIcon(
                PhosphorIconsBold.coins,
                color: colors.gold,
                size: 24,
              ),
              label: 'Gold',
              onTap: onGold,
            ),
            FinanceItem(
              icon: PhosphorIcon(
                PhosphorIconsBold.receipt,
                color: colors.info,
                size: 24,
              ),
              label: 'Bills',
              onTap: onBills,
            ),
            FinanceItem(
              icon: PhosphorIcon(
                PhosphorIconsBold.lightning,
                color: colors.warning,
                size: 24,
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
