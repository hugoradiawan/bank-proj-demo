import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.hasError = false,
    this.errorText,
    super.key,
  });

  final String hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final dynamic controller;
  final FocusNode? focusNode;
  final bool enabled;
  final bool hasError;
  final String? errorText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppColors colors = context.colors;

    final Color borderColor = widget.hasError
        ? colors.error
        : (_isFocused ? colors.primary : colors.gray200);
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor),
    );
    final InputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.error),
    );

    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onTap: widget.readOnly ? widget.onTap : null,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.gray400,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: colors.gray400,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: colors.gray400,
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: widget.hasError
            ? errorBorder
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colors.primary),
              ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.gray200),
        ),
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        errorText: widget.errorText,
        errorStyle: theme.textTheme.bodySmall?.copyWith(
          color: colors.error,
        ),
      ),
    );
  }
}
