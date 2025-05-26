import 'package:flutter/material.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged; // Keep this, parent handles state
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool enabled; // New
  final Widget? prefixIcon; // New

  const AppDropdownField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.value, // Value is managed by parent state
    required this.items,
    required this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.prefixIcon,
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
          prefixIcon: prefixIcon,
          // filled: !enabled, // Example: visual cue for disabled
          // fillColor: Theme.of(context).disabledColor.withOpacity(0.1),
        ),
        value: value,
        items:
            enabled
                ? items
                : null, // Pass null items if disabled to prevent interaction
        onChanged: enabled ? onChanged : null,
        validator: validator,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        isExpanded: true,
        disabledHint:
            value != null && items.any((item) => item.value == value)
                ? Text(
                  items
                      .firstWhere((item) => item.value == value)
                      .child
                      .toStringDeep(),
                ) // Show selected value if disabled
                : (hintText != null ? Text(hintText!) : null),
      ),
    );
  }
}
