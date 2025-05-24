import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// A field for picking a single file.
class AppFileUploadField extends StatelessWidget {
  final String labelText;
  final File? pickedFile; // The currently picked file
  final Function(File?) onFileSelected;
  final List<String>? allowedExtensions; // e.g., ['pdf', 'jpg']
  final String? Function(File?)? validator;
  final AutovalidateMode? autovalidateMode;

  const AppFileUploadField({
    super.key,
    required this.labelText,
    this.pickedFile,
    required this.onFileSelected,
    this.allowedExtensions,
    this.validator,
    this.autovalidateMode,
  });

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      onFileSelected(File(result.files.single.path!));
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormField<File>(
        validator: validator,
        initialValue: pickedFile,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        builder: (FormFieldState<File> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              errorText: field.errorText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    pickedFile?.path.split('/').last ?? 'No file selected',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                if (pickedFile != null)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () {
                      onFileSelected(null); // Clear the file
                      field.didChange(null); // Update FormField state
                    },
                    tooltip: 'Clear file',
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.attach_file),
                  label: Text(pickedFile != null ? 'Change' : 'Select File'),
                  onPressed: () async {
                    await _pickFile();
                    // After onFileSelected is called by _pickFile,
                    // the parent widget will rebuild with the new pickedFile,
                    // and this FormField's builder will run again.
                    // We call didChange here if the validator needs to re-run based on the new value.
                    // Note: The 'pickedFile' prop itself is what the FormField should validate.
                    // The onFileSelected callback should update the state that provides this 'pickedFile'.
                    field.didChange(pickedFile);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
