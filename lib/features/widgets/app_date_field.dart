import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// A standardized date input field.
class AppDateField extends StatelessWidget {
  final String labelText;
  final DateTime? selectedDate;
  final Function(DateTime? date)
  onDateSelected; // Callback when date is selected or cleared
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate; // Initial date for the picker when opened
  final String? Function(DateTime?)? validator;
  final String dateFormat;
  final String? hintText; // New: To show hint when no date is selected
  final bool enabled; // New: To enable/disable the field

  const AppDateField({
    super.key,
    required this.labelText,
    this.selectedDate, // Made optional, as onDateSelected will provide it
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.validator,
    this.dateFormat = 'yyyy-MM-dd',
    this.hintText,
    this.enabled = true,
  });

  Future<void> _selectDate(BuildContext context) async {
    if (!enabled) return; // Do nothing if not enabled

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2101),
      // helpText: labelText, // Can be useful
      // errorFormatText: 'Enter valid date',
      // errorInvalidText: 'Enter date in valid range',
    );
    // Call onDateSelected even if picked is null, allowing parent to clear date if desired
    // if (picked != null && picked != selectedDate) { // Original logic
    onDateSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    // Using a TextEditingController to leverage TextFormField's decoration and validation lifecycle
    final controller = TextEditingController(
      text:
          selectedDate != null
              ? DateFormat(dateFormat).format(selectedDate!)
              : '',
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: enabled ? () => _selectDate(context) : null,
        child: AbsorbPointer(
          // Prevents keyboard from appearing on TextFormField tap
          child: TextFormField(
            controller: controller,
            enabled: enabled, // Visual cue for disabled state
            readOnly: true,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: selectedDate == null ? hintText : null,
              border: const OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.calendar_today,
                color:
                    enabled
                        ? Theme.of(context).iconTheme.color
                        : Theme.of(context).disabledColor,
              ),
            ),
            validator:
                (_) =>
                    validator != null
                        ? validator!(selectedDate)
                        : null, // Validates the DateTime object
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ),
    );
  }
}
