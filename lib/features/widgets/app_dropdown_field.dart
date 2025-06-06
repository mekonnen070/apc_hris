import 'package:flutter/material.dart';

class AppDropdownField<T> extends StatelessWidget {
  final Key? fieldKey;
  final String labelText;
  final bool isRequired;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final Widget? prefixIcon;

  const AppDropdownField({
    super.key,
    this.fieldKey,
    required this.labelText,
    this.isRequired = false,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.prefixIcon,
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        key: fieldKey,
        decoration: InputDecoration(
          label: label,
          hintText: hintText,
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
        ),
        value: value,
        items: enabled ? items : null,
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
                      .toString(),
                )
                : (hintText != null ? Text(hintText!) : null),
      ),
    );
  }
}
