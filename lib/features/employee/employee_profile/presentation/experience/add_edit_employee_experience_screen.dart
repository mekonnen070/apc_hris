import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_experience_model.dart';

import '../../../../widgets/app_date_field.dart';
import '../../../../widgets/app_dropdown_field.dart';
// Reusable Widgets
import '../../../../widgets/app_text_field.dart';

// Helper for String capitalization if not globally available
extension StringExtensionLocal on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toDisplayCase() {
    if (isEmpty) return this;
    // Add space before capital letters, then capitalize first letter of each word
    return replaceAllMapped(
          RegExp(r'(?<!^)(?=[A-Z])'),
          (match) => ' ${match.group(0)}',
        )
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) =>
              word.isEmpty
                  ? ''
                  : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}

class AddEditEmployeeExperienceScreen extends HookWidget {
  final EmployeeExperienceModel? initialExperience;
  final String employeeId;

  const AddEditEmployeeExperienceScreen({
    super.key,
    this.initialExperience,
    required this.employeeId,
  });

  static List<DropdownMenuItem<T>> _buildDropdownItems<T extends Enum>(
    List<T> enumValues,
    String Function(T) getDisplayName,
  ) {
    return enumValues.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(getDisplayName(value)),
      );
    }).toList();
  }

  static String _getOrganizationTypeDisplayName(OrganizationType o) =>
      o.name.toDisplayCase();
  static String _getProficiencyLevelDisplayName(ProficiencyLevel p) =>
      p.name.toDisplayCase();

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
    final separationNotesController = useTextEditingController(
      text: initialExperience?.separationNotes ?? '',
    );

    final selectedOrgType = useState<OrganizationType>(
      initialExperience?.organizationType ?? OrganizationType.plc,
    ); // Default
    final selectedProficiency = useState<ProficiencyLevel>(
      initialExperience?.proficiencyLevel ?? ProficiencyLevel.beginner,
    ); // Default
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
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        if (selectedJoinDate.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Join date is required.')),
          );
          return;
        }
        // Separation date is optional if it's a current job
        if (!isCurrentJob.value && selectedSeparationDate.value == null) {
          // Not current job, but separation date not set - could be an issue depending on policy
          // For now, allow null separationDate if not current job (implies left but date unknown)
          // Or, you could make it required if not current job:
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text('Separation date is required if not current job.')),
          // );
          // return;
        }

        final experienceRecord = EmployeeExperienceModel(
          experienceId:
              initialExperience?.experienceId ?? UniqueKey().toString(),
          employeeId: initialExperience?.employeeId ?? employeeId,
          organization:
              organizationController.text.isEmpty
                  ? null
                  : organizationController.text,
          organizationType: selectedOrgType.value,
          position:
              positionController.text.isEmpty ? null : positionController.text,
          responsibilities:
              responsibilitiesController
                  .text, // Defaults to '' if empty in model
          proficiencyLevel: selectedProficiency.value,
          joinDate: selectedJoinDate.value!, // Validated
          separationDate:
              isCurrentJob.value ? null : selectedSeparationDate.value,
          separationNotes:
              separationNotesController.text.isEmpty
                  ? null
                  : separationNotesController.text,
          // entryBy, entryDate are backend handled
        );
        Navigator.of(context).pop(experienceRecord);
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
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Experience',
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
                controller: organizationController,
                labelText: 'Organization Name',
                // validator: (val) => (val == null || val.isEmpty) ? "Required" : null, // Optional in model
              ),
              AppDropdownField<OrganizationType>(
                labelText: 'Organization Type *',
                value: selectedOrgType.value,
                items: _buildDropdownItems(
                  OrganizationType.values,
                  _getOrganizationTypeDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedOrgType.value = val ?? OrganizationType.plc,
                validator:
                    (val) =>
                        val == null ? 'Organization type is required' : null,
              ),
              AppTextField(
                controller: positionController,
                labelText: 'Position / Job Title',
                // validator: (val) => (val == null || val.isEmpty) ? "Required" : null, // Optional in model
              ),
              AppTextField(
                controller: responsibilitiesController,
                labelText: 'Key Responsibilities',
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              AppDropdownField<ProficiencyLevel>(
                labelText: 'Proficiency Level',
                value: selectedProficiency.value,
                items: _buildDropdownItems(
                  ProficiencyLevel.values,
                  _getProficiencyLevelDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedProficiency.value =
                            val ?? ProficiencyLevel.beginner,
              ),
              AppDateField(
                labelText: 'Join Date *',
                selectedDate: selectedJoinDate.value,
                onDateSelected: (date) => selectedJoinDate.value = date,
                validator:
                    (val) => val == null ? 'Join date is required' : null,
                lastDate: DateTime.now(), // Cannot join in future
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isCurrentJob.value,
                      onChanged: (val) => isCurrentJob.value = val ?? false,
                    ),
                    const Text('I currently work here'),
                  ],
                ),
              ),
              if (!isCurrentJob.value)
                AppDateField(
                  labelText:
                      'Separation Date', // Optional if still working there
                  selectedDate: selectedSeparationDate.value,
                  onDateSelected: (date) => selectedSeparationDate.value = date,
                  firstDate:
                      selectedJoinDate.value, // Cannot separate before joining
                  lastDate: DateTime.now(), // Cannot separate in future
                  validator: (endDate) {
                    if (selectedJoinDate.value != null &&
                        endDate != null &&
                        endDate.isBefore(selectedJoinDate.value!)) {
                      return 'Separation date must be after join date';
                    }
                    return null;
                  },
                ),
              AppTextField(
                controller: separationNotesController,
                labelText: 'Reason for Separation / Notes (Optional)',
                maxLines: 2,
                textInputAction: TextInputAction.newline,
              ),
              // Note: No direct file upload for "Experience Letter" in EmployeeExperienceModel itself.
              // This would be handled via EmployeeUploadModel in the General Documents step.
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialExperience == null ? 'Add Experience' : 'Save Changes',
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
