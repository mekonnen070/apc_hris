import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// A standardized date input field.
class AppDateField extends StatelessWidget {
  final String labelText;
  final DateTime? selectedDate;
  final Function(DateTime? date) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String? Function(DateTime?)? validator;
  final String dateFormat;

  const AppDateField({
    super.key,
    required this.labelText,
    required this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.validator,
    this.dateFormat = 'yyyy-MM-dd', // Default date format
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using a TextEditingController internally to display the date via AppTextField.
    // This makes it visually consistent with other fields.
    final controller = TextEditingController(
      text:
          selectedDate != null
              ? DateFormat(dateFormat).format(selectedDate!)
              : '',
    );

    return InkWell(
      // Use InkWell to make the entire field tappable
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        // AbsorbPointer to prevent keyboard from appearing
        child: TextFormField(
          controller: controller,
          readOnly: true, // Make the text field read-only
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (_) => validator != null ? validator!(selectedDate) : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
