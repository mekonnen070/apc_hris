import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee/employee_profile/presentation/add_new_employee_host_screen.dart';

// Reusable Widgets
import '../../../../widgets/dynamic_entry_section.dart';
import '../../../../widgets/editable_list_item_card.dart';
import '../../../../widgets/form_step_layout.dart';
// Providers & Other Screens
import '../../application/providers/add_new_employee_step_provider.dart';
import 'add_edit_employee_contact_screen.dart';

class EmployeeContactsScreen extends HookConsumerWidget {
  const EmployeeContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current list of contacts from the notifier for the employee being created
    final employeeData = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );
    final List<EmployeeContactModel> contactsList =
        employeeData.employeeContacts;

    // Function to navigate to Add/Edit screen
    void _navigateToAddEditContact([
      EmployeeContactModel? contactToEdit,
    ]) async {
      final result = await Navigator.of(context).push<EmployeeContactModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditEmployeeContactScreen(
                initialContact: contactToEdit,
                employeeId:
                    employeeData.employeeId, // Pass current employee's ID
              ),
        ),
      );

      if (result != null) {
        if (contactToEdit != null) {
          // Editing existing
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .updateEmployeeContact(result);
        } else {
          // Adding new
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .addEmployeeContact(result);
        }
      }
    }

    void _handleNext() {
      // No specific data from this screen itself needs saving on "Next" as contacts
      // are managed individually. Just navigate.
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
      // No formKey needed for this specific screen if validation is per contact
      child: DynamicEntrySection<EmployeeContactModel>(
        sectionTitle: "Employee Contacts",
        addNewButtonText: "+ Add Contact",
        emptyListMessage: "No emergency or other contacts added yet.",
        itemsData: contactsList,
        onAddNew: () => _navigateToAddEditContact(),
        itemBuilder: (ctx, contact, index) {
          return EditableListItemCard(
            leading: Icon(
              contact.isPrimary
                  ? Icons.star_rounded
                  : Icons.person_outline_rounded,
              color: contact.isPrimary ? Theme.of(context).primaryColor : null,
            ),
            title: contact.fullName,
            subtitle:
                "${contact.relationship.name} - ${contact.phone}", // TODO: User-friendly enum name
            onEdit: () => _navigateToAddEditContact(contact),
            onDelete: () {
              // Optional: Show confirmation dialog before deleting
              if (contact.contactId != null) {
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .deleteEmployeeContact(contact.contactId!);
              }
            },
            onTap:
                () => _navigateToAddEditContact(
                  contact,
                ), // Same as edit for contacts
          );
        },
      ),
      onNext: _handleNext,
      onPrevious: _handlePrevious,
      isLastStep: false, // This is not the review/final submit step
      nextButtonText: "Next (Dependants)", // Example: Indicate what's next
    );
  }
}
