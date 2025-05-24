import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/features/employee_profile/domain/academic_qualification.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
// import 'package/your_app/models/academic_qualification_model.dart';
// import 'package/your_app/widgets/...'; // Your reusable widgets

class AddEditQualificationScreen extends HookWidget {
  const AddEditQualificationScreen({super.key, this.initialQualification});

  final AcademicQualification? initialQualification;
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final institutionController = useTextEditingController(
      text: initialQualification?.institutionName,
    );
    final degreeController = useTextEditingController(
      text: initialQualification?.degreeOrCertificate,
    );
    final fieldOfStudyController = useTextEditingController(
      text: initialQualification?.fieldOfStudy,
    );
    final selectedGraduationDate = useState<DateTime?>(
      initialQualification?.graduationDate,
    );
    final pickedCertificateFile = useState<File?>(
      initialQualification?.certificateFile,
    );
    // TODO: Handle displaying existing certificateUrl if initialQualification.certificateUrl exists

    void onSave() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        final newQualification = AcademicQualification(
          id: initialQualification?.id ?? UniqueKey().toString(),
          institutionName: institutionController.text,
          degreeOrCertificate: degreeController.text,
          fieldOfStudy: fieldOfStudyController.text,
          graduationDate: selectedGraduationDate.value,
          certificateFile: pickedCertificateFile.value,
          // certificateUrl: initialQualification?.certificateUrl, // Preserve if not re-uploading
        );
        Navigator.of(
          context,
        ).pop(newQualification); // Return the new/updated qualification
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialQualification == null
              ? 'Add Qualification'
              : 'Edit Qualification',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: onSave,
            tooltip: 'Save Qualification',
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
                controller: institutionController,
                labelText: 'Institution Name',
                validator:
                    (val) => (val == null || val.isEmpty) ? 'Required' : null,
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: degreeController,
                labelText: 'Degree / Certificate Obtained',
                validator:
                    (val) => (val == null || val.isEmpty) ? 'Required' : null,
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: fieldOfStudyController,
                labelText: 'Field of Study',
                validator:
                    (val) => (val == null || val.isEmpty) ? 'Required' : null,
                textInputAction: TextInputAction.next,
              ),
              AppDateField(
                labelText: 'Graduation Date (Optional)',
                selectedDate: selectedGraduationDate.value,
                onDateSelected: (date) => selectedGraduationDate.value = date,
                // No validator means it's optional
              ),
              AppFileUploadField(
                labelText: 'Certificate/Transcript (Optional)',
                pickedFile: pickedCertificateFile.value,
                onFileSelected: (file) => pickedCertificateFile.value = file,
                allowedExtensions: const ['pdf', 'jpg', 'png'],
                // No validator means it's optional
              ),
              // TODO: If initialQualification.certificateUrl exists and pickedCertificateFile.value is null,
              // display a way to see the existing file or indicate it's already uploaded.
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Save Qualification'),
                onPressed: onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
