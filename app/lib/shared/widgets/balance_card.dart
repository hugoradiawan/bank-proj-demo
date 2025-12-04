import 'package:app/shared/widgets/quick_action_button.dart'
    show QuickActionButton;
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your Balance',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        balance,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                _DepositButton(onTap: onDeposit),
              ],
            ),
          ),
          Divider(color: colors.gray200, height: 1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                QuickActionButton(
                  icon: PhosphorIcon(
                    PhosphorIconsBold.paperPlaneTilt,
                    color: colors.primary,
                    size: 24,
                  ),
                  label: 'Transfer',
                  onTap: onTransfer,
                ),
                Container(width: 1, height: 32, color: colors.gray200),
                QuickActionButton(
                  icon: PhosphorIcon(
                    PhosphorIconsBold.vault,
                    color: colors.primary,
                    size: 24,
                  ),
                  label: 'Savings',
                  badge: '5% p.a',
                  onTap: onSavings,
                ),
                Container(width: 1, height: 32, color: colors.gray200),
                QuickActionButton(
                  icon: PhosphorIcon(
                    PhosphorIconsBold.barcode,
                    color: colors.primary,
                    size: 24,
                  ),
                  label: 'My QR',
                  onTap: onMyQr,
                ),
              ],
            ),
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
    final LightColors colors = LightColors();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.primaryLight.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.add_circle, color: colors.primary, size: 16),
            const SizedBox(width: 4),
            Text(
              'Deposit',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
