import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/application/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';

// Reusable Widgets
import '../../../widgets/dynamic_entry_section.dart';
import '../../../widgets/editable_list_item_card.dart';
import '../../../widgets/form_step_layout.dart';
import '../../application/add_new_employee_step_provider.dart';
import 'add_edit_employee_dependant_screen.dart';

class EmployeeDependantsScreen extends HookConsumerWidget {
  const EmployeeDependantsScreen({super.key});

  // Helper for display names (could be extensions on enums)
  static String _getRelationTypeDisplayName(RelationTypes r) =>
      r.name[0].toUpperCase() + r.name.substring(1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeeDependantModel> dependantsList =
        employeeData.employeeDependants;

    void _navigateToAddEditDependant([
      EmployeeDependantModel? dependantToEdit,
    ]) async {
      final result = await Navigator.of(context).push<EmployeeDependantModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeDependantScreen(
                initialDependant: dependantToEdit,
                employeeId: employeeData.employeeId, // Essential for linking
              ),
        ),
      );

      if (result != null) {
        if (dependantToEdit != null) {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeeDependant(result);
        } else {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addEmployeeDependant(result);
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

    return FormStepLayout(
      child: DynamicEntrySection<EmployeeDependantModel>(
        sectionTitle: "Employee Dependants",
        addNewButtonText: "+ Add Dependant",
        emptyListMessage: "No dependants added yet.",
        itemsData: dependantsList,
        onAddNew: () => _navigateToAddEditDependant(),
        itemBuilder: (ctx, dependant, index) {
          return EditableListItemCard(
            leading: Icon(
              dependant.gender == Gender.male
                  ? Icons.male_rounded
                  : dependant.gender == Gender.female
                  ? Icons.female_rounded
                  : Icons.person_outline,
            ),
            title: dependant.dependantFullName,
            subtitle:
                "${_getRelationTypeDisplayName(dependant.relation)}\nDOB: ${DateFormat('dd MMM, yyyy').format(dependant.birthDate)}",
            onEdit: () => _navigateToAddEditDependant(dependant),
            onDelete: () {
              if (dependant.dependantId != null) {
                // Optional: Show confirmation dialog
                showDialog(
                  context: context,
                  builder:
                      (BuildContext dialogContext) => AlertDialog(
                        title: const Text("Confirm Deletion"),
                        content: Text(
                          "Are you sure you want to delete dependant '${dependant.dependantFullName}'?",
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
                                  .deleteEmployeeDependant(
                                    dependant.dependantId!,
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
      nextButtonText: "Next (Education)", // Update according to your flow
    );
  }
}
