import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p; // For basename

// A field for picking a single file, integrating with FormField for validation.
class AppFileUploadField extends StatelessWidget {
  final String labelText;
  final File? pickedFile; // The currently picked file, managed by parent state
  final Function(File?)
  onFileSelected; // Callback when a file is picked or cleared
  final List<String>? allowedExtensions; // e.g., ['pdf', 'jpg']
  final String? Function(File?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String noFileSelectedText;
  final bool enabled;

  const AppFileUploadField({
    super.key,
    required this.labelText,
    this.pickedFile,
    required this.onFileSelected,
    this.allowedExtensions,
    this.validator,
    this.autovalidateMode,
    this.noFileSelectedText = 'No file selected',
    this.enabled = true,
  });

  Future<void> _pickFile(FormFieldState<File> field) async {
    if (!enabled) return;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type:
          allowedExtensions != null && allowedExtensions!.isNotEmpty
              ? FileType.custom
              : FileType.any, // Allow any if no extensions specified
      allowedExtensions: allowedExtensions,
    );

    File? selectedFile;
    if (result != null && result.files.single.path != null) {
      selectedFile = File(result.files.single.path!);
    }
    // Always call onFileSelected to update parent state
    onFileSelected(selectedFile);
    // Update FormField state so validation runs with the new value
    field.didChange(selectedFile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormField<File>(
        key: ValueKey(
          pickedFile?.path,
        ), // Rebuild FormField if file path changes
        validator: validator,
        initialValue: pickedFile, // Initial value from parent state
        enabled: enabled,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        builder: (FormFieldState<File> field) {
          // Note: field.value here is the FormField's internal state for the file.
          // We primarily use the `pickedFile` prop for display consistency,
          // and `field.didChange` to sync them.
          final displayFileName =
              pickedFile != null
                  ? p.basename(pickedFile!.path)
                  : noFileSelectedText;

          return InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              errorText: field.errorText,
              // contentPadding is handled by button/text layout
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    displayFileName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: enabled ? null : Theme.of(context).disabledColor,
                    ),
                  ),
                ),
                if (pickedFile != null && enabled)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () {
                      onFileSelected(null); // Inform parent to clear file
                      field.didChange(null); // Update FormField state
                    },
                    tooltip: 'Clear file',
                    constraints: const BoxConstraints(), // Remove extra padding
                    padding: EdgeInsets.zero,
                  ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.attach_file_outlined, size: 18),
                  label: Text(pickedFile != null ? 'Change' : 'Select'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    // Visual feedback for disabled state could be added here too
                  ),
                  onPressed: enabled ? () => _pickFile(field) : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
