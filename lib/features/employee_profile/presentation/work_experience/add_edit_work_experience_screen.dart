import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/features/employee_profile/domain/work_experience.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditWorkExperienceScreen extends HookWidget {
  final WorkExperience? initialExperience;

  const AddEditWorkExperienceScreen({super.key, this.initialExperience});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final companyNameController = useTextEditingController(
      text: initialExperience?.companyName,
    );
    final jobTitleController = useTextEditingController(
      text: initialExperience?.jobTitle,
    );
    final responsibilitiesController = useTextEditingController(
      text: initialExperience?.responsibilities,
    );

    final selectedStartDate = useState<DateTime?>(initialExperience?.startDate);
    final selectedEndDate = useState<DateTime?>(initialExperience?.endDate);
    final isCurrentJob = useState<bool>(
      initialExperience?.endDate == null && initialExperience != null,
    );
    final pickedExperienceLetterFile = useState<File?>(
      initialExperience?.experienceLetterFile,
    );

    // If 'isCurrentJob' is true, clear the endDate
    useEffect(() {
      if (isCurrentJob.value) {
        selectedEndDate.value = null;
      }
      return null;
    }, [isCurrentJob.value]);

    void onSave() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        final newExperience = WorkExperience(
          id: initialExperience?.id ?? UniqueKey().toString(),
          companyName: companyNameController.text,
          jobTitle: jobTitleController.text,
          responsibilities: responsibilitiesController.text,
          startDate: selectedStartDate.value!, // Start date is required
          endDate: isCurrentJob.value ? null : selectedEndDate.value,
          experienceLetterFile: pickedExperienceLetterFile.value,
          // experienceLetterUrl: initialExperience?.experienceLetterUrl,
        );
        Navigator.of(context).pop(newExperience);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialExperience == null
              ? 'Add Work Experience'
              : 'Edit Work Experience',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: onSave,
            tooltip: 'Save Experience',
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
                controller: companyNameController,
                labelText: 'Company Name',
                validator:
                    (val) => (val == null || val.isEmpty) ? 'Required' : null,
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: jobTitleController,
                labelText: 'Job Title',
                validator:
                    (val) => (val == null || val.isEmpty) ? 'Required' : null,
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: responsibilitiesController,
                labelText: 'Key Responsibilities (Optional)',
                textInputAction: TextInputAction.newline,
                maxLines: 3,
              ),
              AppDateField(
                labelText: 'Start Date',
                selectedDate: selectedStartDate.value,
                onDateSelected: (date) => selectedStartDate.value = date,
                validator:
                    (val) => val == null ? 'Start date is required' : null,
                lastDate: DateTime.now(), // Cannot be in the future
              ),
              Row(
                children: [
                  Checkbox(
                    value: isCurrentJob.value,
                    onChanged: (bool? value) {
                      isCurrentJob.value = value ?? false;
                    },
                  ),
                  const Text('I currently work here'),
                ],
              ),
              if (!isCurrentJob.value)
                AppDateField(
                  labelText: 'End Date (Optional if current)',
                  selectedDate: selectedEndDate.value,
                  onDateSelected: (date) => selectedEndDate.value = date,
                  // Validator could check if end date is after start date
                  validator: (endDate) {
                    if (selectedStartDate.value != null &&
                        endDate != null &&
                        endDate.isBefore(selectedStartDate.value!)) {
                      return 'End date must be after start date';
                    }
                    return null;
                  },
                  firstDate:
                      selectedStartDate
                          .value, // End date cannot be before start date
                  lastDate: DateTime.now(),
                ),
              AppFileUploadField(
                labelText: 'Experience Letter (Optional)',
                pickedFile: pickedExperienceLetterFile.value,
                onFileSelected:
                    (file) => pickedExperienceLetterFile.value = file,
                allowedExtensions: const ['pdf', 'jpg', 'png'],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Save Experience'),
                onPressed: onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
