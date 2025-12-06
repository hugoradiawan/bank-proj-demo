import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({required this.icon, super.key, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTabletOrLarger(context);
    final double buttonSize = isTablet ? 48 : 40;
    final double iconSize = isTablet ? 24 : 20;

    return Material(
      color: context.colors.primary,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(200),
        onTap: onTap,
        child: SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: Center(
            child: PhosphorIcon(icon, color: Colors.white, size: iconSize),
          ),
        ),
      ),
    );
  }
}
