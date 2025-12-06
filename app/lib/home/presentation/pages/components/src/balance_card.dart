// ignore because of it does used
// ignore_for_file: unused_element_parameter

part of '../home.component.dart';

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
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
    final AppColors colors = context.colors;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      padding: EdgeInsets.symmetric(
        vertical: 8 * spacingMultiplier,
        horizontal: 20 * spacingMultiplier,
      ),
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
                      SizedBox(height: 8 * spacingMultiplier),
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
            child: Material(
              type: MaterialType.transparency,
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
          ),
        ],
      ),
    );
  }
}
