import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(_) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LightColors().premiumGradient,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
