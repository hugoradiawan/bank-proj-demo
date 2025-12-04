import 'package:core/core.dart' show LightColors;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        Center,
        Colors,
        IconData,
        InkWell,
        Material,
        SizedBox,
        StatelessWidget,
        VoidCallback,
        Widget;
import 'package:phosphor_flutter/phosphor_flutter.dart' show PhosphorIcon;

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({required this.icon, super.key, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(_) {
    final LightColors colors = LightColors();
    return Material(
      color: colors.primary,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(200),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: PhosphorIcon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
