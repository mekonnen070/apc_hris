import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee/employee_profile/presentation/add_new_employee_host_screen.dart';

// Reusable Widgets
import '../../../../widgets/dynamic_entry_section.dart';
import '../../../../widgets/editable_list_item_card.dart';
import '../../../../widgets/form_step_layout.dart';
import '../../application/providers/add_new_employee_step_provider.dart';
import 'add_edit_employee_education_screen.dart';

class EmployeeEducationScreen extends HookConsumerWidget {
  const EmployeeEducationScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeeEducationModel> educationList =
        employeeData.employeeEducations;

    void navigateToAddEditEducation([
      EmployeeEducationModel? educationToEdit,
    ]) async {
      final result = await Navigator.of(context).push<EmployeeEducationModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeEducationScreen(
                initialEducation: educationToEdit,
                employeeId: employeeData.employeeId,
              ),
        ),
      );

      if (result != null) {
        if (educationToEdit != null) {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeeEducation(result);
        } else {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addEmployeeEducation(result);
        }
      }
    }

    void handleNext() {
      final currentStep = ref.read(currentEmployeeCreationStepProvider);
      if (currentStep < AddNewEmployeeHostScreen.totalSteps - 1) {
        ref.read(currentEmployeeCreationStepProvider.notifier).state++;
      }
    }

    void handlePrevious() {
      final currentStep = ref.read(currentEmployeeCreationStepProvider);
      if (currentStep > 0) {
        ref.read(currentEmployeeCreationStepProvider.notifier).state--;
      }
    }

    return FormStepLayout(
      onNext: handleNext,
      onPrevious: handlePrevious,
      nextButtonText: 'Next (Experience)',
      child: DynamicEntrySection<EmployeeEducationModel>(
        sectionTitle: 'Educational Background',
        addNewButtonText: '+ Add Education',
        emptyListMessage: 'No educational records added yet.',
        itemsData: educationList,
        onAddNew: () => navigateToAddEditEducation(),
        itemBuilder: (ctx, educationItem, index) {
          String dateRange =
              educationItem.startDate != null
                  ? DateFormat('MMM yyyy').format(educationItem.startDate)
                  : 'N/A';
          dateRange += ' - ';
          dateRange +=
              educationItem.endDate != null
                  ? DateFormat('MMM yyyy').format(educationItem.endDate!)
                  : (educationItem.educationStatus == EducationStatus.inProgress
                      ? 'Present'
                      : 'N/A');

          return EditableListItemCard(
            leading: const Icon(Icons.school_outlined),
            title: _getEducationLevelDisplayName(educationItem.educationLevel),
            subtitle:
                '${_getUniversityDisplayName(educationItem.university)}\n${educationItem.fieldOfStudy.name.capitalizeFirst()} ($dateRange)\nStatus: ${educationItem.educationStatus.name.capitalizeFirst()}',
            isThreeLine: true, // Allow subtitle to wrap
            onEdit: () => navigateToAddEditEducation(educationItem),
            onDelete: () {
              if (educationItem.educationId != null) {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext dialogContext) => AlertDialog(
                        title: const Text('Confirm Deletion'),
                        content: Text(
                          "Delete '${_getEducationLevelDisplayName(educationItem.educationLevel)} at ${_getUniversityDisplayName(educationItem.university)}'?",
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                          TextButton(
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              ref
                                  .read(
                                    employeeCreationNotifierProvider.notifier,
                                  )
                                  .deleteEmployeeEducation(
                                    educationItem.educationId!,
                                  );
                            },
                          ),
                        ],
                      ),
                );
              }
            },
          );
        },
      ), // Update according to your flow
    );
  }
}

// Re-add String extension if not globally available
// extension StringExtension on String {
//   String capitalizeFirst() {
//     if (this.isEmpty) return this;
//     return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
//   }
// }
