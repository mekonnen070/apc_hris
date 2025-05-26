import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// A standardized text input field for consistent styling and behavior.
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool enabled; // New: To explicitly enable/disable the field
  final InputDecoration? decoration; // New: Allow full decoration override
  final List<TextInputFormatter>? inputFormatters; // New: For input formatting

  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.autovalidateMode,
    this.enabled = true,
    this.decoration,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration =
        decoration ??
        InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          // Consider adding filled: true and fillColor from theme for consistency
          // errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
        );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ), // Consistent vertical spacing
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: effectiveDecoration,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        onSaved: onSaved,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        enabled: enabled,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
