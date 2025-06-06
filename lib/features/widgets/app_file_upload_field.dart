import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class AppFileUploadField extends StatelessWidget {
  final Key? fieldKey;
  final String labelText;
  final bool isRequired;
  final File? pickedFile;
  final Function(File?) onFileSelected;
  final List<String>? allowedExtensions;
  final String? Function(File?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String noFileSelectedText;
  final bool enabled;

  const AppFileUploadField({
    super.key,
    this.fieldKey,
    required this.labelText,
    this.isRequired = false,
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
              : FileType.any,
      allowedExtensions: allowedExtensions,
    );

    File? selectedFile;
    if (result != null && result.files.single.path != null) {
      selectedFile = File(result.files.single.path!);
    }
    onFileSelected(selectedFile);
    field.didChange(selectedFile);
  }

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
      child: FormField<File>(
        key: fieldKey,
        validator: validator,
        initialValue: pickedFile,
        enabled: enabled,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        builder: (FormFieldState<File> field) {
          final displayFileName =
              pickedFile != null
                  ? p.basename(pickedFile!.path)
                  : noFileSelectedText;

          return InputDecorator(
            decoration: InputDecoration(
              label: label,
              border: const OutlineInputBorder(),
              errorText: field.errorText,
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
                      onFileSelected(null);
                      field.didChange(null);
                    },
                    tooltip: 'Clear file',
                    constraints: const BoxConstraints(),
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
