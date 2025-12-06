import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:premium/src/presentation/cubits/success_confetti_cubit.dart';
import 'package:shared/shared.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final ThemeData theme = Theme.of(context);
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double horizontalPadding = Responsive.getHorizontalPadding(context);
    final double spacingMultiplier = Responsive.getSpacingMultiplier(context);
    final bool isTablet = Responsive.isTabletOrLarger(context);

    final double iconContainerSize = isTablet ? 100 : 80;
    final double iconSize = isTablet ? 50 : 40;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: <Widget>[
          BlocBuilder<SuccessConfettiCubit, SuccessConfettiState>(
            builder: (BuildContext context, SuccessConfettiState state) =>
                IgnorePointer(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController: state.controller,
                      blastDirection: math.pi / 2,
                      emissionFrequency: .04,
                      numberOfParticles: 25,
                      maxBlastForce: 8,
                      minBlastForce: 4,
                      gravity: .015,
                      colors: <Color>[
                        colors.primary,
                        colors.primaryLight,
                        colors.success,
                        colors.warning,
                        colors.gray400,
                      ],
                    ),
                  ),
                ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: horizontalPadding,
                    right: horizontalPadding,
                    bottom: screenHeight * 0.15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: iconContainerSize,
                        height: iconContainerSize,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colors.success,
                          shape: BoxShape.circle,
                        ),
                        child: PhosphorIcon(
                          PhosphorIconsBold.check,
                          color: colors.surface,
                          size: iconSize,
                        ),
                      ),
                      SizedBox(height: 24 * spacingMultiplier),
                      Text(
                        'Registration Sent! 🥳',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12 * spacingMultiplier),
                      Text(
                        'Please wait while we verify your data.\nIt will take 5 minutes!',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12 * spacingMultiplier,
                        bottom: 8 * spacingMultiplier,
                      ),
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(52 * spacingMultiplier),
                          backgroundColor: colors.gray100,
                          foregroundColor: colors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          'Back to Home',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
