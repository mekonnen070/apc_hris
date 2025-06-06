import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final Key? fieldKey;
  final TextEditingController controller;
  final String labelText;
  final bool isRequired;
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
  final bool enabled;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.fieldKey,
    required this.controller,
    required this.labelText,
    this.isRequired = false,
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
    final label = RichText(
      text: TextSpan(
        text: labelText,
        style: TextStyle(color: Theme.of(context).hintColor),
        children:
            isRequired
                ? [
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ]
                : [],
      ),
    );

    final effectiveDecoration =
        decoration ??
        InputDecoration(
          label: label,
          hintText: hintText,
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        key: fieldKey,
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
