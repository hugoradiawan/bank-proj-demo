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
  Widget build(BuildContext context) => Positioned(
    top: 50,
    left: 20,
    child: Container(
      height: 42,
      width: 42,
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
          size: 15,
        ),
      ),
    ),
  );
}
