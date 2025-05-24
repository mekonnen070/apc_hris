import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/domain/general_document.dart';
import 'package:police_com/features/employee_profile/presentation/general_documents/add_other_document_screen.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';
// import 'package/your_app/models/general_document_model.dart';
// import 'package/your_app/screens/add_other_document_screen.dart';
// import 'package/your_app/widgets/...';

// TODO: Update Riverpod provider for registration state
// final registrationDataProvider = ... ;

class GeneralDocumentsScreen extends HookConsumerWidget {
  const GeneralDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // State for mandatory individual file uploads
    final pickedCVFile = useState<File?>(null);
    final pickedNationalIDFile = useState<File?>(null);

    // State for the list of "other" documents
    final otherDocumentsList = useState<List<GeneralDocument>>([]);

    void navigateToAddOtherDocumentScreen([GeneralDocument? docToEdit]) async {
      final result = await Navigator.of(context).push<GeneralDocument>(
        MaterialPageRoute(
          builder: (_) => AddOtherDocumentScreen(initialDocument: docToEdit),
        ),
      );

      if (result != null) {
        final index = otherDocumentsList.value.indexWhere(
          (doc) => doc.id == result.id,
        );
        if (index != -1) {
          final updatedList = List<GeneralDocument>.from(
            otherDocumentsList.value,
          );
          updatedList[index] = result;
          otherDocumentsList.value = updatedList;
        } else {
          otherDocumentsList.value = [...otherDocumentsList.value, result];
        }
        // TODO: Update Riverpod state
      }
    }

    void deleteOtherDocument(String id) {
      final updatedList =
          otherDocumentsList.value.where((doc) => doc.id != id).toList();
      otherDocumentsList.value = updatedList;
      // TODO: Update Riverpod state
    }

    void onNextPressed() {
      if (formKey.currentState?.validate() ?? false) {
        // Potentially collect file data and update Riverpod state
        // final cvFile = pickedCVFile.value;
        // final nationalIDFile = pickedNationalIDFile.value;
        // final otherDocs = otherDocumentsList.value;
        // ref.read(registrationDataProvider.notifier).updateGeneralDocuments(...);

        // TODO: Navigate to Review Screen or final step
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReviewRegistrationScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Documents (Conceptual) Saved! Moving to review.'),
          ),
        );
      }
    }

    return FormStepLayout(
      stepTitle: 'Upload Documents',
      formKey: formKey,
      onNext: onNextPressed,
      onPrevious: () => Navigator.of(context).pop(),
      nextButtonText: 'Next (Review)', // Assuming review is next
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppFileUploadField(
              labelText: 'CV / Resume',
              pickedFile: pickedCVFile.value,
              onFileSelected: (file) => pickedCVFile.value = file,
              validator:
                  (file) => file == null ? 'CV/Resume is required' : null,
              allowedExtensions: const ['pdf', 'doc', 'docx'],
            ),
            AppFileUploadField(
              labelText: 'National ID Card',
              pickedFile: pickedNationalIDFile.value,
              onFileSelected: (file) => pickedNationalIDFile.value = file,
              validator:
                  (file) => file == null ? 'National ID is required' : null,
              allowedExtensions: const ['pdf', 'jpg', 'png'],
            ),
            const SizedBox(height: 16),
            DynamicEntrySection<GeneralDocument>(
              sectionTitle: 'Other Supporting Documents (Optional)',
              addNewButtonText: '+ Add Document',
              emptyListMessage: 'No other documents added.',
              itemsData: otherDocumentsList.value,
              onAddNew: () => navigateToAddOtherDocumentScreen(),
              itemBuilder: (ctx, doc, onEdit, onDelete) {
                // onEdit/onDelete from builder are generic
                return EditableListItemCard(
                  title: doc.documentDescription,
                  subtitle:
                      doc.documentFile?.path.split('/').last ??
                      'No file attached',
                  onEdit:
                      () => navigateToAddOtherDocumentScreen(
                        doc,
                      ), // Specific edit
                  onDelete:
                      () => deleteOtherDocument(doc.id), // Specific delete
                  onTap: () => navigateToAddOtherDocumentScreen(doc),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
