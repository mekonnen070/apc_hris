import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee_profile/application/providers/add_new_employee_step_provider.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_upload_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/employee_profile/presentation/documents/add_edit_employee_document_screen.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

class EmployeeGeneralDocumentsScreen extends HookConsumerWidget {
  const EmployeeGeneralDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeeUploadModel> allDocumentsList =
        employeeData.generalDocuments;

    // Separate CV and National ID for specific UI display if needed, though they are part of allDocumentsList
    final cvDocument = allDocumentsList.firstWhere(
      (doc) => doc.documentType == DocumentType.cv,
      orElse:
          () => EmployeeUploadModel(
            // A temporary model for the UI if not yet added
            documentId:
                'temp_cv', // Temporary client-side ID for UI interaction
            employeeId: employeeData.employeeId,
            documentName: 'CV / Resume',
            documentType: DocumentType.cv,
          ),
    );

    final nationalIdDocument = allDocumentsList.firstWhere(
      (doc) => doc.documentType == DocumentType.id,
      orElse:
          () => EmployeeUploadModel(
            documentId: 'temp_id',
            employeeId: employeeData.employeeId,
            documentName: 'National ID Card',
            documentType: DocumentType.id,
          ),
    );

    // Filter out CV and National ID from the "Other Documents" list for the DynamicEntrySection
    final otherSupportingDocumentsList =
        allDocumentsList
            .where(
              (doc) =>
                  doc.documentType != DocumentType.cv &&
                  doc.documentType != DocumentType.id,
            )
            .toList();

    void _navigateToAddEditDocumentScreen({
      EmployeeUploadModel? docToEdit,
      DocumentType? defaultType,
      String? defaultName,
    }) async {
      EmployeeUploadModel tempInitialDoc;

      if (docToEdit != null) {
        tempInitialDoc = docToEdit;
      } else {
        // For creating a new document (CV, ID, or Other)
        tempInitialDoc = EmployeeUploadModel(
          documentId: UniqueKey().toString(), // Temporary client-side ID
          employeeId: employeeData.employeeId,
          documentName: defaultName ?? '',
          documentType:
              defaultType ??
              DocumentType.other, // Default to 'other' if not specified
          isActive: true,
        );
      }

      final result = await Navigator.of(context).push<EmployeeUploadModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeDocumentScreen(
                // This screen handles adding/editing ANY EmployeeUploadModel
                initialDocument: tempInitialDoc, // Pass the prepared model
                employeeId: employeeData.employeeId,
              ),
        ),
      );

      if (result != null) {
        // Check if it's an update to an existing one or a new one
        final existingDocIndex = allDocumentsList.indexWhere(
          (d) => d.documentId == result.documentId,
        );
        if (existingDocIndex != -1) {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateGeneralDocument(result);
        } else {
          // This handles CV, ID, or any other new document
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addGeneralDocument(result);
        }
      }
    }

    void _deleteDocument(String docId) {
      // Standard delete confirmation
      showDialog(
        context: context,
        builder:
            (BuildContext dialogContext) => AlertDialog(
              title: const Text("Confirm Deletion"),
              content: const Text(
                "Are you sure you want to delete this document?",
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                TextButton(
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    ref
                        .read(employeeCreationNotifierProvider.notifier)
                        .deleteGeneralDocument(docId);
                  },
                ),
              ],
            ),
      );
    }

    void _handleNext() {
      // Validate that mandatory CV and ID are present in the notifier's state
      final hasCV = ref
          .read(employeeCreationNotifierProvider)
          .employeeData
          .generalDocuments
          .any(
            (doc) =>
                doc.documentType == DocumentType.cv &&
                (doc.documentFile != null || doc.filePath != null),
          );
      final hasNationalID = ref
          .read(employeeCreationNotifierProvider)
          .employeeData
          .generalDocuments
          .any(
            (doc) =>
                doc.documentType == DocumentType.id &&
                (doc.documentFile != null || doc.filePath != null),
          );

      if (!hasCV) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('CV/Resume is required.')));
        return;
      }
      if (!hasNationalID) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('National ID Card is required.')),
        );
        return;
      }

      final currentStep = ref.read(currentEmployeeCreationStepProvider);
      if (currentStep < AddNewEmployeeHostScreen.totalSteps - 1) {
        ref.read(currentEmployeeCreationStepProvider.notifier).state++;
      }
    }

    void _handlePrevious() {
      final currentStep = ref.read(currentEmployeeCreationStepProvider);
      if (currentStep > 0) {
        ref.read(currentEmployeeCreationStepProvider.notifier).state--;
      }
    }

    return FormStepLayout(
      // No formKey needed at this top level if AppFileUploadField handles its own state via FormField
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          Text(
            "Mandatory Documents",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          // --- CV Upload ---
          AppFileUploadField(
            labelText: 'CV / Resume *',
            pickedFile:
                cvDocument.documentFile, // Display the file from the model
            onFileSelected: (file) {
              // Prepare an EmployeeUploadModel for the CV
              final updatedCV = cvDocument.copyWith(
                documentFile: file,
                // If file is null (cleared), we might want to remove a previously set filePath too
                filePath: file == null ? null : cvDocument.filePath,
              );
              if (allDocumentsList.any(
                (doc) => doc.documentType == DocumentType.cv,
              )) {
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .updateGeneralDocument(updatedCV);
              } else {
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .addGeneralDocument(updatedCV);
              }
            },
            validator: (file) {
              // Validator checks the actual file in the model
              final currentCV = ref
                  .read(employeeCreationNotifierProvider)
                  .employeeData
                  .generalDocuments
                  .firstWhere(
                    (d) => d.documentType == DocumentType.cv,
                    orElse: () => cvDocument,
                  );
              return (currentCV.documentFile == null &&
                      currentCV.filePath == null)
                  ? 'CV/Resume is required'
                  : null;
            },
            allowedExtensions: const ['pdf', 'doc', 'docx'],
          ),

          // --- National ID Upload ---
          AppFileUploadField(
            labelText: 'National ID Card *',
            pickedFile: nationalIdDocument.documentFile,
            onFileSelected: (file) {
              final updatedID = nationalIdDocument.copyWith(
                documentFile: file,
                filePath: file == null ? null : nationalIdDocument.filePath,
              );
              if (allDocumentsList.any(
                (doc) => doc.documentType == DocumentType.id,
              )) {
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .updateGeneralDocument(updatedID);
              } else {
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .addGeneralDocument(updatedID);
              }
            },
            validator: (file) {
              final currentID = ref
                  .read(employeeCreationNotifierProvider)
                  .employeeData
                  .generalDocuments
                  .firstWhere(
                    (d) => d.documentType == DocumentType.id,
                    orElse: () => nationalIdDocument,
                  );
              return (currentID.documentFile == null &&
                      currentID.filePath == null)
                  ? 'National ID Card is required'
                  : null;
            },
            allowedExtensions: const ['pdf', 'jpg', 'png'],
          ),
          const SizedBox(height: 24),

          // --- Other Supporting Documents ---
          DynamicEntrySection<EmployeeUploadModel>(
            sectionTitle: 'Other Supporting Documents (Optional)',
            addNewButtonText: '+ Add Other Document',
            emptyListMessage: 'No other documents added.',
            itemsData: otherSupportingDocumentsList, // Use the filtered list
            onAddNew:
                () => _navigateToAddEditDocumentScreen(
                  defaultType: DocumentType.other,
                  defaultName: "Other Document",
                ),
            itemBuilder: (ctx, docItem, index) {
              String fileName = "No file attached";
              if (docItem.documentFile != null) {
                fileName = p.basename(docItem.documentFile!.path);
              } else if (docItem.filePath != null &&
                  docItem.filePath!.isNotEmpty) {
                fileName = "Uploaded: ${p.basename(docItem.filePath!)}";
              }
              return EditableListItemCard(
                leading: const Icon(Icons.file_present_outlined),
                title: docItem.documentName,
                subtitle:
                    "${docItem.documentType.toDisplayString}\nFile: $fileName",
                isThreeLine: true,
                onEdit:
                    () => _navigateToAddEditDocumentScreen(docToEdit: docItem),
                onDelete: () {
                  if (docItem.documentId != null)
                    _deleteDocument(docItem.documentId!);
                },
              );
            },
          ),
        ],
      ),
      onNext: _handleNext,
      onPrevious: _handlePrevious,
      isLastStep:
          ref.watch(currentEmployeeCreationStepProvider) ==
          AddNewEmployeeHostScreen.totalSteps - 2,
      nextButtonText: "Next (Performance)", // Or "Next (Review)"
    );
  }
}
