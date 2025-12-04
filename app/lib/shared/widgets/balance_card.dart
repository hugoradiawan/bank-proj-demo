import 'package:app/shared/widgets/quick_action_button.dart';
import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    this.balance = 'Rp10.000.000',
    this.onDeposit,
    this.onTransfer,
    this.onSavings,
    this.onMyQr,
    super.key,
  });

  final String balance;
  final VoidCallback? onDeposit;
  final VoidCallback? onTransfer;
  final VoidCallback? onSavings;
  final VoidCallback? onMyQr;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LightColors colors = LightColors();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Your Balance',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              _DepositButton(onTap: onDeposit),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            balance,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              QuickActionButton(
                icon: PhosphorIcon(
                  PhosphorIconsBold.paperPlaneTilt,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                label: 'Transfer',
                onTap: onTransfer,
              ),
              QuickActionButton(
                icon: PhosphorIcon(
                  PhosphorIconsBold.piggyBank,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                label: 'Savings',
                badge: '5% p.a',
                onTap: onSavings,
              ),
              QuickActionButton(
                icon: PhosphorIcon(
                  PhosphorIconsBold.qrCode,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                label: 'My QR',
                onTap: onMyQr,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DepositButton extends StatelessWidget {
  const _DepositButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const PhosphorIcon(
              PhosphorIconsBold.plusCircle,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              'Deposit',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
