import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart'
    show
        Alignment,
        BorderRadius,
        BoxDecoration,
        BoxShape,
        BuildContext,
        Center,
        Column,
        Container,
        EdgeInsets,
        FilledButton,
        FontWeight,
        MainAxisSize,
        MediaQuery,
        Navigator,
        Padding,
        Positioned,
        Radius,
        RoundedRectangleBorder,
        SafeArea,
        Scaffold,
        Size,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        ThemeData,
        Widget;
import 'package:shared/shared.dart' show PhosphorIcon, PhosphorIconsBold;

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LightColors colors = LightColors();
    final ThemeData theme = Theme.of(context);
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: screenHeight * 0.15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colors.success,
                        shape: BoxShape.circle,
                      ),
                      child: PhosphorIcon(
                        PhosphorIconsBold.check,
                        color: colors.surface,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Registration Sent! 🥳',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
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
        ],
      ),
    );
  }
}
