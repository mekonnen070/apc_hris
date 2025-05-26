import 'dart:io'; // For File

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';

import '../../../widgets/app_date_field.dart';
import '../../../widgets/app_dropdown_field.dart';
// Reusable Widgets
import '../../../widgets/app_text_field.dart';

class AddEditEmployeeEducationScreen extends HookWidget {
  final EmployeeEducationModel? initialEducation;
  final String employeeId;

  const AddEditEmployeeEducationScreen({
    super.key,
    this.initialEducation,
    required this.employeeId,
  });

  // Helper for Enum Dropdown Items
  static List<DropdownMenuItem<T>> _buildDropdownItems<T extends Enum>(
    List<T> enumValues,
    String Function(T) getDisplayName,
  ) {
    return enumValues.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(getDisplayName(value), overflow: TextOverflow.ellipsis),
      );
    }).toList();
  }

  // Example display name getters (ideally these would be extensions or part of localization)
  static String _getEducationLevelDisplayName(EducationLevel e) =>
      e.name
          .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
          .trim()
          .capitalizeFirst();
  static String _getUniversityDisplayName(EthiopianUniversity u) =>
      u.name
          .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
          .trim()
          .capitalizeFirst();
  static String _getFieldOfStudyDisplayName(FieldOfStudy f) =>
      f.name
          .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
          .trim()
          .capitalizeFirst();
  static String _getEducationStatusDisplayName(EducationStatus s) =>
      s.name
          .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
          .trim()
          .capitalizeFirst();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final cgpaController = useTextEditingController(
      text: initialEducation?.cgpa ?? '',
    );
    // Assuming 'educationLevel' (mapped from C# 'Education' string)
    final selectedEducationLevel = useState<EducationLevel>(
      initialEducation?.educationLevel ?? EducationLevel.other,
    ); // Default
    final selectedUniversity = useState<EthiopianUniversity>(
      initialEducation?.university ?? EthiopianUniversity.other,
    ); // Default
    final selectedFieldOfStudy = useState<FieldOfStudy>(
      initialEducation?.fieldOfStudy ?? FieldOfStudy.other,
    ); // Default
    final selectedStartDate = useState<DateTime?>(initialEducation?.startDate);
    final selectedEndDate = useState<DateTime?>(initialEducation?.endDate);
    final selectedEducationStatus = useState<EducationStatus>(
      initialEducation?.educationStatus ?? EducationStatus.completed,
    ); // Default
    final certificateFile = useState<File?>(
      null,
    ); // For new file upload, initialEducation would have URL
    // isApproved, entryBy, entryDate are typically backend handled

    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        if (selectedStartDate.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start date is required.')),
          );
          return;
        }

        final educationRecord = EmployeeEducationModel(
          educationId: initialEducation?.educationId ?? UniqueKey().toString(),
          employeeId: initialEducation?.employeeId ?? employeeId,
          educationLevel: selectedEducationLevel.value,
          university: selectedUniversity.value,
          cgpa: cgpaController.text.isEmpty ? null : cgpaController.text,
          fieldOfStudy: selectedFieldOfStudy.value,
          startDate: selectedStartDate.value!, // Validated
          endDate: selectedEndDate.value,
          educationStatus: selectedEducationStatus.value,
          // certificateFile is handled by EmployeeUploadModel if we follow that pattern
          // For now, if EmployeeEducationModel itself handles a file:
          // certificateFile: certificateFile.value, // This assumes EmployeeEducationModel has this field
          // certificateUrl: initialEducation?.certificateUrl, // Preserve if not re-uploading
          // isApproved and audit fields are backend responsibility
        );
        Navigator.of(context).pop(educationRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialEducation == null
              ? 'Add Education Record'
              : 'Edit Education Record',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Education',
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
              AppDropdownField<EducationLevel>(
                labelText: 'Education Level *',
                value: selectedEducationLevel.value,
                items: _buildDropdownItems(
                  EducationLevel.values,
                  _getEducationLevelDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedEducationLevel.value =
                            val ?? EducationLevel.other,
                validator:
                    (val) => val == null ? 'Education level is required' : null,
              ),
              AppDropdownField<EthiopianUniversity>(
                labelText: 'University/Institution *',
                value: selectedUniversity.value,
                items: _buildDropdownItems(
                  EthiopianUniversity.values,
                  _getUniversityDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedUniversity.value =
                            val ?? EthiopianUniversity.other,
                validator:
                    (val) => val == null ? 'Institution is required' : null,
              ),
              AppDropdownField<FieldOfStudy>(
                labelText: 'Field Of Study *',
                value: selectedFieldOfStudy.value,
                items: _buildDropdownItems(
                  FieldOfStudy.values,
                  _getFieldOfStudyDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedFieldOfStudy.value = val ?? FieldOfStudy.other,
                validator:
                    (val) => val == null ? 'Field of study is required' : null,
              ),
              AppTextField(
                controller: cgpaController,
                labelText: 'CGPA (e.g., 3.75)',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (val) {
                  if (val != null && val.isNotEmpty) {
                    final gpa = double.tryParse(val);
                    if (gpa == null || gpa < 0 || gpa > 4) {
                      // Or 5 depending on scale
                      return 'Enter a valid CGPA (0.00 - 4.00)';
                    }
                  }
                  return null;
                },
              ),
              AppDateField(
                labelText: 'Start Date *',
                selectedDate: selectedStartDate.value,
                onDateSelected: (date) => selectedStartDate.value = date,
                validator:
                    (val) => val == null ? 'Start date is required' : null,
                lastDate: DateTime.now(), // Cannot start in future
              ),
              AppDateField(
                labelText: 'End Date (or Expected)',
                selectedDate: selectedEndDate.value,
                onDateSelected: (date) => selectedEndDate.value = date,
                firstDate:
                    selectedStartDate
                        .value, // End date should be after start date
                validator: (endDate) {
                  if (selectedStartDate.value != null &&
                      endDate != null &&
                      endDate.isBefore(selectedStartDate.value!)) {
                    return 'End date must be after start date';
                  }
                  return null;
                },
              ),
              AppDropdownField<EducationStatus>(
                labelText: 'Education Status *',
                value: selectedEducationStatus.value,
                items: _buildDropdownItems(
                  EducationStatus.values,
                  _getEducationStatusDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedEducationStatus.value =
                            val ?? EducationStatus.completed,
                validator: (val) => val == null ? 'Status is required' : null,
              ),
              // TODO: If EmployeeEducationModel should include a certificate upload:
              // AppFileUploadField(
              //   labelText: "Certificate/Transcript (Optional)",
              //   pickedFile: certificateFile.value,
              //   onFileSelected: (file) => certificateFile.value = file,
              //   allowedExtensions: const ['pdf', 'jpg', 'png', 'doc', 'docx'],
              // ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialEducation == null ? 'Add Education' : 'Save Changes',
                ),
                onPressed: handleSaveChanges,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper extension for String capitalization
extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
