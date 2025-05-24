import 'package:flutter/material.dart';

// A standardized dropdown form field.
class AppDropdownField<T> extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;

  const AppDropdownField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
        isExpanded: true, // Often desirable for dropdowns in forms
      ),
    );
  }
}