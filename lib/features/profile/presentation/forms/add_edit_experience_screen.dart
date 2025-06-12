// lib/features/profile/presentation/forms/add_edit_experience_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditExperienceScreen extends HookWidget {
  final EmployeeExperienceModel? initialExperience;
  final String employeeId;

  const AddEditExperienceScreen({
    super.key,
    this.initialExperience,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final organizationController = useTextEditingController(
      text: initialExperience?.organization ?? '',
    );
    final positionController = useTextEditingController(
      text: initialExperience?.position ?? '',
    );
    final responsibilitiesController = useTextEditingController(
      text: initialExperience?.responsibilities ?? '',
    );
    final selectedOrgType = useState<OrganizationType>(
      initialExperience?.organizationType ?? OrganizationType.plc,
    );
    final selectedProficiency = useState<ProficiencyLevel>(
      initialExperience?.proficiencyLevel ?? ProficiencyLevel.beginner,
    );
    final selectedJoinDate = useState<DateTime?>(initialExperience?.joinDate);
    final selectedSeparationDate = useState<DateTime?>(
      initialExperience?.separationDate,
    );
    final isCurrentJob = useState<bool>(
      initialExperience?.separationDate == null && initialExperience != null,
    );

    useEffect(() {
      if (isCurrentJob.value) {
        selectedSeparationDate.value = null;
      }
      return null;
    }, [isCurrentJob.value]);

    void handleSaveChanges() {
      if (formKey.currentState!.validate()) {
        final experienceRecord = EmployeeExperienceModel(
          experienceId: initialExperience?.experienceId,
          employeeId: employeeId,
          organization: organizationController.text,
          organizationType: selectedOrgType.value,
          position: positionController.text,
          responsibilities: responsibilitiesController.text,
          proficiencyLevel: selectedProficiency.value,
          joinDate: selectedJoinDate.value!,
          separationDate:
              isCurrentJob.value ? null : selectedSeparationDate.value,
        );
        Navigator.of(context).pop(experienceRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialExperience == null ? 'Add Experience' : 'Edit Experience',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: handleSaveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: organizationController,
                labelText: 'Organization *',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<OrganizationType>(
                labelText: 'Organization Type *',
                value: selectedOrgType.value,
                items:
                    OrganizationType.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedOrgType.value = val ?? OrganizationType.plc,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: positionController,
                labelText: 'Position *',
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: responsibilitiesController,
                labelText: 'Responsibilities',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              AppDropdownField<ProficiencyLevel>(
                labelText: 'Proficiency Level *',
                value: selectedProficiency.value,
                items:
                    ProficiencyLevel.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedProficiency.value =
                            val ?? ProficiencyLevel.beginner,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: 'Join Date *',
                selectedDate: selectedJoinDate.value,
                onDateSelected: (d) => selectedJoinDate.value = d,
                validator: (d) => d == null ? 'Required' : null,
              ),
              CheckboxListTile(
                title: const Text('I currently work here'),
                value: isCurrentJob.value,
                onChanged: (val) => isCurrentJob.value = val ?? false,
              ),
              if (!isCurrentJob.value)
                AppDateField(
                  labelText: 'Separation Date',
                  selectedDate: selectedSeparationDate.value,
                  onDateSelected: (d) => selectedSeparationDate.value = d,
                ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: handleSaveChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
