import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/route/premium.route.dart';
import 'package:shared/shared.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final bool isTablet = Responsive.isTabletOrLarger(context);
    final double crownSize = isTablet ? 100 : 80;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isTablet ? 8 : 5,
              horizontal: isTablet ? 24 : 16,
            ),
            decoration: BoxDecoration(
              gradient: colors.premiumGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'More Benefit, More Fun!',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colors.gold2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Text(
                            'Upgrade to Premium',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(width: 4),
                          PhosphorIcon(
                            PhosphorIconsBold.caretRight,
                            color: Colors.white.withValues(alpha: 0.9),
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: 'premium_crown',
                  child: Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(0.28)
                      ..scaleByDouble(2.1, 2.1, 1, 1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/crown.webp',
                      width: crownSize,
                      height: crownSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => PremiumBridgeRoute().push(context),
                  splashColor: colors.gold2.withValues(alpha: 0.4),
                  highlightColor: Colors.white10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
