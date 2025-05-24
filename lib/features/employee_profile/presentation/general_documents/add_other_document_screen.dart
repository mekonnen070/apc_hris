import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/features/employee_profile/domain/general_document.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddOtherDocumentScreen extends HookWidget {
  final GeneralDocument? initialDocument; // Null if adding new

  const AddOtherDocumentScreen({super.key, this.initialDocument});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final descriptionController = useTextEditingController(
      text: initialDocument?.documentDescription,
    );
    final pickedFile = useState<File?>(initialDocument?.documentFile);

    void onSave() {
      if (formKey.currentState?.validate() ?? false) {
        if (pickedFile.value == null && initialDocument?.documentUrl == null) {
          // If it's a new document or an existing one without a URL, a file is mandatory
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a file to upload.')),
          );
          return;
        }
        formKey.currentState?.save();
        final newDoc = GeneralDocument(
          id: initialDocument?.id ?? UniqueKey().toString(),
          documentDescription: descriptionController.text,
          documentFile: pickedFile.value,
          // documentUrl: initialDocument?.documentUrl, // Preserve if not re-uploading
        );
        Navigator.of(context).pop(newDoc);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialDocument == null ? 'Add Other Document' : 'Edit Document Info',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: onSave,
            tooltip: 'Save Document',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppTextField(
                controller: descriptionController,
                labelText: 'Document Description',
                hintText: 'e.g., Passport, Driving License',
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Description is required'
                            : null,
              ),
              AppFileUploadField(
                labelText: 'Document File',
                pickedFile: pickedFile.value,
                onFileSelected: (file) => pickedFile.value = file,
                // Validator for the FormField, not directly here if file is mandatory on save
                validator: (file) {
                  // If it's a new entry, a file is required.
                  // If editing, a file might not be newly picked if one already exists (URL).
                  // This logic is partially handled in onSave.
                  if (initialDocument == null && file == null) {
                    return 'Please select a file.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Save Document'),
                onPressed: onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
