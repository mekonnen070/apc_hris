import 'dart:io'; // For File
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_upload_model.dart';

// Reusable Widgets
import '../../../widgets/app_text_field.dart';
import '../../../widgets/app_dropdown_field.dart';
import '../../../widgets/app_date_field.dart';
import '../../../widgets/app_file_upload_field.dart';


// Helper for String capitalization if not globally available
extension StringExtensionForDocumentScreen on String {
   String toDisplayCase() {
    if (isEmpty) return this;
    return replaceAllMapped(RegExp(r'(?<!^)(?=[A-Z])'), (match) => ' ${match.group(0)}')
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}


class AddEditEmployeeDocumentScreen extends HookWidget {
  final EmployeeUploadModel? initialDocument;
  final String employeeId;

  const AddEditEmployeeDocumentScreen({
    super.key,
    this.initialDocument,
    required this.employeeId,
  });

  static List<DropdownMenuItem<T>> _buildDropdownItems<T extends Enum>(
      List<T> enumValues, String Function(T) getDisplayName) {
    return enumValues.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(getDisplayName(value)),
      );
    }).toList();
  }

  static String _getDocumentTypeDisplayName(DocumentType d) => d.name.toDisplayCase();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final documentNameController = useTextEditingController(text: initialDocument?.documentName ?? '');
    final descriptionController = useTextEditingController(text: initialDocument?.description ?? '');

    final selectedDocumentType = useState<DocumentType>(initialDocument?.documentType ?? DocumentType.other); // Default
    final selectedExpiryDate = useState<DateTime?>(initialDocument?.expiryDate);
    final pickedDocumentFile = useState<File?>(initialDocument?.documentFile); // Local file for upload/edit
    // initialDocument.filePath would be the URL if editing an already uploaded doc
    final isActiveFlag = useState<bool>(initialDocument?.isActive ?? true);


    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        // A file is mandatory if it's a new document or if no existing filePath (URL) exists
        if (pickedDocumentFile.value == null && (initialDocument == null || initialDocument?.filePath == null)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a document file to upload.')),
          );
          return;
        }

        final documentRecord = EmployeeUploadModel(
          documentId: initialDocument?.documentId ?? UniqueKey().toString(),
          employeeId: initialDocument?.employeeId ?? employeeId,
          documentName: documentNameController.text,
          documentType: selectedDocumentType.value,
          description: descriptionController.text.isEmpty ? null : descriptionController.text,
          documentFile: pickedDocumentFile.value, // This is the local File object
          filePath: initialDocument?.filePath, // Preserve existing URL if file not changed
          expiryDate: selectedExpiryDate.value,
          isActive: isActiveFlag.value,
          // uploadedBy, uploadDate are backend handled
        );
        Navigator.of(context).pop(documentRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(initialDocument == null ? 'Add Document' : 'Edit Document'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Document',
            onPressed: handleSaveChanges,
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
                controller: documentNameController,
                labelText: "Document Name / Title *",
                validator: (val) => (val == null || val.isEmpty) ? "Document name is required" : null,
              ),
              AppDropdownField<DocumentType>(
                labelText: "Document Type *",
                value: selectedDocumentType.value,
                items: _buildDropdownItems(DocumentType.values, _getDocumentTypeDisplayName),
                onChanged: (val) => selectedDocumentType.value = val ?? DocumentType.other,
                validator: (val) => val == null ? "Document type is required" : null,
              ),
              AppFileUploadField(
                labelText: "Document File *",
                pickedFile: pickedDocumentFile.value,
                onFileSelected: (file) => pickedDocumentFile.value = file,
                // Validator on FormField itself will use the value of pickedDocumentFile
                // but can be supplemented by the check in handleSaveChanges.
                validator: (file) {
                    if (file == null && (initialDocument == null || initialDocument?.filePath == null)) {
                        return "Please select a file.";
                    }
                    return null;
                }
              ),
              if (initialDocument?.filePath != null && pickedDocumentFile.value == null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Text("Current file: ${initialDocument!.filePath!.split('/').last}", style: TextStyle(color: Theme.of(context).hintColor)),
                ),
              AppTextField(
                controller: descriptionController,
                labelText: "Description (Optional)",
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              AppDateField(
                labelText: "Expiry Date (Optional)",
                selectedDate: selectedExpiryDate.value,
                onDateSelected: (date) => selectedExpiryDate.value = date,
                firstDate: DateTime.now(), // Expiry cannot be in the past
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isActiveFlag.value,
                      onChanged: (val) => isActiveFlag.value = val ?? true,
                    ),
                    const Text("Document is Active"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(initialDocument == null ? 'Add Document' : 'Save Changes'),
                onPressed: handleSaveChanges,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}