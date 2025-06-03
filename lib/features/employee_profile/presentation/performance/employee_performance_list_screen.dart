import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_performance_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';

// Reusable Widgets
import '../../../widgets/dynamic_entry_section.dart';
import '../../../widgets/editable_list_item_card.dart';
import '../../../widgets/form_step_layout.dart';
import '../../application/providers/add_new_employee_step_provider.dart';
import 'add_edit_employee_performance_screen.dart';

class EmployeePerformanceListScreen extends HookConsumerWidget {
  const EmployeePerformanceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeePerformanceModel> performanceList =
        employeeData.performances;

    void _navigateToAddEditPerformance([
      EmployeePerformanceModel? performanceToEdit,
    ]) async {
      final result = await Navigator.of(context).push<EmployeePerformanceModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeePerformanceScreen(
                initialPerformance: performanceToEdit,
                employeeId: employeeData.employeeId,
              ),
        ),
      );

      if (result != null) {
        if (performanceToEdit != null && performanceToEdit.performanceId != 0) {
          // Check if it's an existing record
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeePerformance(result);
        } else {
          // Adding new or updating a client-side only record
          // If IDs are client-generated before first save, update logic might need to handle that.
          // For now, assume addEmployeePerformance handles if ID is 0 or new.
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addEmployeePerformance(result);
        }
      }
    }

    void _handleNext() {
      final currentStep = ref.read(currentEmployeeCreationStepProvider);
      // Assuming Review screen is next or this is the last data collection step
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
      child: DynamicEntrySection<EmployeePerformanceModel>(
        sectionTitle: "Performance Records",
        addNewButtonText: "+ Add Performance",
        emptyListMessage: "No performance records added yet.",
        itemsData: performanceList,
        onAddNew: () => _navigateToAddEditPerformance(),
        itemBuilder: (ctx, performanceItem, index) {
          return EditableListItemCard(
            leading: const Icon(Icons.assessment_outlined),
            title:
                "Evaluation: ${DateFormat('dd MMM, yyyy').format(performanceItem.evaluationDate)}",
            subtitle:
                "Score: ${performanceItem.scorePoint}/100, Rating: ${performanceItem.rating}/5\nEvaluator: ${performanceItem.evaluatorName}",
            isThreeLine: true,
            onEdit: () => _navigateToAddEditPerformance(performanceItem),
            onDelete: () {
              // performanceId is int, default is 0 for new client side items
              if (performanceItem.performanceId != 0) {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext dialogContext) => AlertDialog(
                        title: const Text("Confirm Deletion"),
                        content: Text(
                          "Delete performance record from ${DateFormat('dd MMM, yyyy').format(performanceItem.evaluationDate)}?",
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
                                  .deleteEmployeePerformance(
                                    performanceItem.performanceId,
                                  );
                            },
                          ),
                        ],
                      ),
                );
              } else {
                // Handle deletion of a client-side only item if ID logic is different
                // For now, assuming delete only makes sense for saved items with non-zero ID
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'This unsaved record cannot be deleted from here yet.',
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      onNext: _handleNext,
      onPrevious: _handlePrevious,
      isLastStep:
          (ref.watch(currentEmployeeCreationStepProvider) ==
              AddNewEmployeeHostScreen.totalSteps - 2),
      nextButtonText:
          "Next (Review)", // Assuming Review is the next and final step
    );
  }
}
