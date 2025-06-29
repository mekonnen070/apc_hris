import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditEducationScreen extends HookWidget {
  final EmployeeEducationModel? initialEducation;
  final String employeeId;

  const AddEditEducationScreen({
    super.key,
    this.initialEducation,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final cgpaController = useTextEditingController(
      text: initialEducation?.cgpa ?? '',
    );
    final selectedEducationLevel = useState<EducationLevel>(
      initialEducation?.educationLevel ?? EducationLevel.other,
    );
    final selectedUniversity = useState<EthiopianUniversity>(
      initialEducation?.university ?? EthiopianUniversity.other,
    );
    final selectedFieldOfStudy = useState<FieldOfStudy>(
      initialEducation?.fieldOfStudy ?? FieldOfStudy.other,
    );
    final selectedStartDate = useState<DateTime?>(initialEducation?.startDate);
    final selectedEndDate = useState<DateTime?>(initialEducation?.endDate);
    final selectedEducationStatus = useState<EducationStatus>(
      initialEducation?.educationStatus ?? EducationStatus.completed,
    );

    void handleSaveChanges() {
      if (formKey.currentState!.validate()) {
        final educationRecord = EmployeeEducationModel(
          educationId: initialEducation?.educationId,
          employeeId: employeeId,
          educationLevel: selectedEducationLevel.value,
          university: selectedUniversity.value,
          cgpa: cgpaController.text.isEmpty ? null : cgpaController.text,
          fieldOfStudy: selectedFieldOfStudy.value,
          startDate: selectedStartDate.value!,
          endDate: selectedEndDate.value,
          educationStatus: selectedEducationStatus.value,
        );
        Navigator.of(context).pop(educationRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialEducation == null ? context.lango.addEducation : context.lango.editEducation, // <-- REPLACED
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
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
                labelText: context.lango.educationLevelLabel, // <-- REPLACED
                value: selectedEducationLevel.value,
                items:
                    EducationLevel.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedEducationLevel.value =
                            val ?? EducationLevel.other,
                validator: (val) => val == null ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDropdownField<EthiopianUniversity>(
                labelText: context.lango.universityLabel, // <-- REPLACED
                value: selectedUniversity.value,
                items:
                    EthiopianUniversity.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedUniversity.value =
                            val ?? EthiopianUniversity.other,
                validator: (val) => val == null ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDropdownField<FieldOfStudy>(
                labelText: context.lango.fieldOfStudyLabel, // <-- REPLACED
                value: selectedFieldOfStudy.value,
                items:
                    FieldOfStudy.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedFieldOfStudy.value = val ?? FieldOfStudy.other,
                validator: (val) => val == null ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: cgpaController,
                labelText: context.lango.cgpa, // <-- REPLACED
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.startDateLabel, // <-- REPLACED
                selectedDate: selectedStartDate.value,
                onDateSelected: (date) => selectedStartDate.value = date,
                validator:
                    (val) => val == null ? context.lango.startDateIsRequired : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.endDateLabel, // <-- REPLACED
                selectedDate: selectedEndDate.value,
                onDateSelected: (date) => selectedEndDate.value = date,
              ),
              const SizedBox(height: 16),
              AppDropdownField<EducationStatus>(
                labelText: context.lango.educationStatusLabel, // <-- REPLACED
                value: selectedEducationStatus.value,
                items:
                    EducationStatus.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedEducationStatus.value =
                            val ?? EducationStatus.completed,
                validator: (val) => val == null ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: handleSaveChanges,
                child: Text(context.lango.saveChanges), // <-- REPLACED
              ),
            ],
          ),
        ),
      ),
    );
  }
}