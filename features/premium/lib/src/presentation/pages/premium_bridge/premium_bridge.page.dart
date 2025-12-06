import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:premium/src/presentation/pages/premium_bridge/components/src/premium_bridge.component.dart';
import 'package:shared/shared.dart';

class PremiumBridgePage extends StatelessWidget {
  const PremiumBridgePage({required this.onAccessPremiumNow, super.key});

  final VoidCallback? onAccessPremiumNow;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isTablet = Responsive.isTabletOrLarger(context);
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);

    final double crownTop = isTablet ? 100 : 70;
    final double crownSize = isTablet
        ? screenSize.width * 0.35
        : screenSize.width * 0.42;

    final double contentTop = isTablet ? 200 : 240;
    final double contentWidth = isTablet
        ? (screenSize.width * 0.55).clamp(0, 500)
        : screenSize.width * 0.7;
    final double contentHeight = isTablet
        ? screenSize.height * 0.60
        : screenSize.height * 0.54;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(gradient: colors.premiumGradient2),
            ),
            FloatingBackButton(
              iconColor: colors.gray300,
              backgroundColor: colors.gray500.withValues(alpha: .3),
            ),
            Positioned(
              top: crownTop,
              right: isTablet ? 30 : 10,
              child: Hero(
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
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16 * spacingMultiplier),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: Size.fromHeight(
                              50 * spacingMultiplier,
                            ),
                            backgroundColor: colors.gold,
                          ),
                          onPressed: onAccessPremiumNow,
                          child: Text(
                            'Access Premium Now',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: colors.textOnPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: contentTop,
              left: horizontalPadding,
              child: SizedBox(
                height: contentHeight,
                width: contentWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: AutoSizeText(
                        'More Benefits,\nMore Fun!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 48 : 30,
                          color: colors.gold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <String>[
                          'Ad-free',
                          'Early access to new features',
                          'Premium customer service',
                          'Premium app look',
                          'Bigger transfer limit',
                          'Bigger saving limit',
                          'Cashback on every transaction',
                          'Unlimited service from app',
                          'Custom app icon',
                          'Higher saving from app',
                          'Birthday promo',
                          'More rewards',
                        ].map((String text) => CheckListTile(text, isTablet: isTablet)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
