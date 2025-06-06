import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateField extends StatelessWidget {
  final Key? fieldKey;
  final String labelText;
  final bool isRequired;
  final DateTime? selectedDate;
  final Function(DateTime? date) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String? Function(DateTime?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String dateFormat;
  final String? hintText;
  final bool enabled;

  const AppDateField({
    super.key,
    this.fieldKey,
    required this.labelText,
    this.isRequired = false,
    this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.validator,
    this.autovalidateMode,
    this.dateFormat = 'yyyy-MM-dd',
    this.hintText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormField<DateTime>(
        key: fieldKey,
        initialValue: selectedDate,
        validator: validator,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        enabled: enabled,
        builder: (FormFieldState<DateTime> field) {
          final controller = TextEditingController(
            text:
                field.value != null
                    ? DateFormat(dateFormat).format(field.value!)
                    : '',
          );

          Future<void> selectDate() async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: field.value ?? initialDate ?? DateTime.now(),
              firstDate: firstDate ?? DateTime(1900),
              lastDate: lastDate ?? DateTime(2101),
            );

            if (picked != null) {
              field.didChange(picked);
              onDateSelected(picked);
            }
          }

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

          return InkWell(
            onTap: enabled ? selectDate : null,
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller,
                enabled: enabled,
                readOnly: true,
                decoration: InputDecoration(
                  label: label,
                  hintText: field.value == null ? hintText : null,
                  border: const OutlineInputBorder(),
                  errorText: field.errorText,
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color:
                        enabled
                            ? Theme.of(context).iconTheme.color
                            : Theme.of(context).disabledColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
