import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({required this.icon, super.key, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
      color: context.colors.primary,
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
