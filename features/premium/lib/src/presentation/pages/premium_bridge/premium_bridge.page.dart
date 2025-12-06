import 'package:core/core.dart' show AppColors, AppColorsContextX;
import 'package:flutter/material.dart'
    show
        Alignment,
        AnnotatedRegion,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        Brightness,
        BuildContext,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        FontWeight,
        Hero,
        Image,
        Matrix4,
        MediaQuery,
        Padding,
        Positioned,
        RoundedRectangleBorder,
        SafeArea,
        Scaffold,
        Size,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        TextStyle,
        Transform,
        VoidCallback,
        Widget;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart'
    show AutoSizeText;
import 'package:premium/src/presentation/pages/premium_bridge/components/src/premium_bridge.component.dart'
    show CheckListTile;
import 'package:shared/shared.dart' show FloatingBackButton;

class PremiumBridgePage extends StatelessWidget {
  const PremiumBridgePage({required this.onAccessPremiumNow, super.key});

  final VoidCallback? onAccessPremiumNow;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
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
              top: 70,
              right: 10,
              child: Hero(
                tag: 'premium_crown',
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(0.28)
                    ..scaleByDouble(2.1, 2.1, 1, 1),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/crown.webp',
                    width: MediaQuery.of(context).size.width * .42,
                    height: MediaQuery.of(context).size.width * .42,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size.fromHeight(50),
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
            Positioned(
              top: 240,
              left: 16,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .54,
                width: MediaQuery.of(context).size.width * .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: AutoSizeText(
                        'More Benefits,\nMore Fun!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: colors.gold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
                        ].map(CheckListTile.new).toList(),
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
