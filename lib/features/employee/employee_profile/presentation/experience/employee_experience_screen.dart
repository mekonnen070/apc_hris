import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/proficiency_level.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee/employee_profile/presentation/add_new_employee_host_screen.dart';

// Reusable Widgets
import '../../../../widgets/dynamic_entry_section.dart';
import '../../../../widgets/editable_list_item_card.dart';
import '../../../../widgets/form_step_layout.dart';
import '../../application/providers/add_new_employee_step_provider.dart';
import 'add_edit_employee_experience_screen.dart';

class EmployeeExperienceScreen extends HookConsumerWidget {
  const EmployeeExperienceScreen({super.key});

  static String _getProficiencyDisplayName(ProficiencyLevel p) =>
      p.name.toDisplayCase();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeeExperienceModel> experiencesList =
        employeeData.employeeExperiences;

    void _navigateToAddEditExperience([
      EmployeeExperienceModel? experienceToEdit,
    ]) async {
      final result = await Navigator.of(context).push<EmployeeExperienceModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeExperienceScreen(
                initialExperience: experienceToEdit,
                employeeId: employeeData.employeeId,
              ),
        ),
      );

      if (result != null) {
        if (experienceToEdit != null) {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeeExperience(result);
        } else {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addEmployeeExperience(result);
        }
      }
    }

    void _handleNext() {
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

    String formatDateRange(DateTime join, DateTime? separation) {
      final DateFormat formatter = DateFormat('MMM, yyyy');
      String formattedStart = formatter.format(join);
      String formattedEnd =
          separation != null ? formatter.format(separation) : 'Present';
      return "$formattedStart - $formattedEnd";
    }

    return FormStepLayout(
      child: DynamicEntrySection<EmployeeExperienceModel>(
        sectionTitle: "Work Experience",
        addNewButtonText: "+ Add Experience",
        emptyListMessage: "No work experience records added yet.",
        itemsData: experiencesList,
        onAddNew: () => _navigateToAddEditExperience(),
        itemBuilder: (ctx, experienceItem, index) {
          return EditableListItemCard(
            leading: const Icon(Icons.work_history_outlined),
            title: experienceItem.position ?? 'N/A Position',
            subtitle:
                "${experienceItem.organization ?? 'N/A Organization'}\n${formatDateRange(experienceItem.joinDate, experienceItem.separationDate)}\nProficiency: ${_getProficiencyDisplayName(experienceItem.proficiencyLevel)}",
            isThreeLine: true,
            onEdit: () => _navigateToAddEditExperience(experienceItem),
            onDelete: () {
              if (experienceItem.experienceId != null) {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext dialogContext) => AlertDialog(
                        title: const Text("Confirm Deletion"),
                        content: Text(
                          "Delete experience at '${experienceItem.organization ?? 'N/A'}'?",
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
                                  .read(
                                    employeeCreationNotifierProvider.notifier,
                                  )
                                  .deleteEmployeeExperience(
                                    experienceItem.experienceId!,
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
      ),
      onNext: _handleNext,
      onPrevious: _handlePrevious,
      isLastStep: false,
      nextButtonText: "Next (Spouse Info)", // Update according to your flow
    );
  }
}
