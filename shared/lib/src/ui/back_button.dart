import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FloatingBackButton extends StatelessWidget {
  const FloatingBackButton({
    required this.iconColor,
    required this.backgroundColor,
    super.key,
    this.borderColor,
  });

  final Color iconColor;
  final Color backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTabletOrLarger(context);
    final double buttonSize = isTablet ? 50 : 42;
    final double iconSize = isTablet ? 18 : 15;
    final double topOffset = isTablet ? 60 : 50;
    final double leftOffset = isTablet ? 30 : 20;

    return Positioned(
      top: topOffset,
      left: leftOffset,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
