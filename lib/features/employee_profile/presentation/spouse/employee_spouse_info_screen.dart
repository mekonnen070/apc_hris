import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/employee_profile/presentation/experience/add_edit_employee_experience_screen.dart';

// Reusable Widgets
import '../../../widgets/dynamic_entry_section.dart'; // If managing multiple spouses (e.g. history)
import '../../../widgets/editable_list_item_card.dart';
import '../../../widgets/form_step_layout.dart';
import '../../application/providers/add_new_employee_step_provider.dart';
import 'add_edit_employee_spouse_screen.dart';

class EmployeeSpouseInfoScreen extends HookConsumerWidget {
  const EmployeeSpouseInfoScreen({super.key});

  static String _getGenderDisplayName(Gender g) => g.name.toDisplayCase();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    // The C# EmployeeInfoModel has ICollection<EmployeeSpouse>, so we use a list.
    // Business logic might restrict this to one "active" spouse.
    final List<EmployeeSpouseModel> spouseList = employeeData.employeeSpouse;

    // For simplicity in UI, often an employee has one (current) spouse record.
    // We can adapt the UI to either show an "Add" button if list is empty,
    // or "Edit/View" if an item exists. DynamicEntrySection handles multiple.
    final bool canAddMoreSpouses =
        true; // Set to 'false' if only one spouse allowed and one exists
    // or spouseList.isEmpty;

    void _navigateToAddEditSpouse([EmployeeSpouseModel? spouseToEdit]) async {
      // If only one spouse is allowed and one exists, and we are not editing, prevent adding another.
      if (spouseList.isNotEmpty && spouseToEdit == null && !canAddMoreSpouses) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Only one spouse record can be added.')),
        );
        return;
      }

      final result = await Navigator.of(context).push<EmployeeSpouseModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeSpouseScreen(
                initialSpouse: spouseToEdit,
                employeeId: employeeData.employeeId,
              ),
        ),
      );

      if (result != null) {
        if (spouseToEdit != null) {
          // Editing
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeeSpouse(result);
        } else {
          // Adding new
          if (canAddMoreSpouses || spouseList.isEmpty) {
            ref
                .read(employeeCreationNotifierProvider.notifier)
                .addEmployeeSpouse(result);
          }
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
      child: DynamicEntrySection<EmployeeSpouseModel>(
        sectionTitle: "Spouse Information",
        // Adapt "Add New" button text based on whether one spouse can be added
        addNewButtonText:
            (spouseList.isEmpty || canAddMoreSpouses)
                ? "+ Add Spouse"
                : "Edit Spouse",
        onAddNew: () {
          if (spouseList.isNotEmpty && !canAddMoreSpouses) {
            _navigateToAddEditSpouse(
              spouseList.first,
            ); // Edit existing if only one allowed
          } else {
            _navigateToAddEditSpouse(); // Add new
          }
        },
        emptyListMessage: "No spouse information added yet.",
        itemsData: spouseList,
        itemBuilder: (ctx, spouseItem, index) {
          return EditableListItemCard(
            leading: Icon(
              spouseItem.gender == Gender.male
                  ? Icons.man_rounded
                  : spouseItem.gender == Gender.female
                  ? Icons.woman_rounded
                  : Icons.person_outline,
            ),
            title: spouseItem.spouseFullName,
            subtitle:
                "DOB: ${DateFormat('dd MMM, yyyy').format(spouseItem.spouseBirthDate)}\nPhone: ${spouseItem.spousePhone}",
            isThreeLine: true,
            onEdit: () => _navigateToAddEditSpouse(spouseItem),
            onDelete: () {
              if (spouseItem.spouseId != null) {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext dialogContext) => AlertDialog(
                        title: const Text("Confirm Deletion"),
                        content: Text(
                          "Delete spouse '${spouseItem.spouseFullName}'?",
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
                                  .deleteEmployeeSpouse(spouseItem.spouseId!);
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
      nextButtonText: "Next (Documents)", // Update based on your flow
    );
  }
}
