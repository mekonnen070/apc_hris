import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/forms/add_edit_contact_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';

class ContactsTab extends ConsumerWidget {
  final EmployeeInfoModel employee;
  const ContactsTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateToAddEdit(EmployeeContactModel? contact) async {
      final result = await Navigator.of(context).push<EmployeeContactModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditContactScreen(
                initialContact: contact,
                employeeId: employee.employeeId,
              ),
        ),
      );
      if (result != null) {
        if (contact != null) {
          ref.read(profileNotifierProvider.notifier).updateContact(result);
        } else {
          ref.read(profileNotifierProvider.notifier).addContact(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeContactModel>(
      addNewButtonText: context.lango.addEmergencyContact, // <-- REPLACED
      sectionTitle: context.lango.emergencyContacts, // <-- REPLACED
      onAddNew: () => navigateToAddEdit(null),
      itemsData: employee.employeeContacts,
      emptyListMessage: context.lango.noEmergencyContactsListed, // <-- REPLACED
      itemBuilder: (context, contact, index) {
        return EditableListItemCard(
          title: contact.fullName,
          subtitle:
              '${context.lango.relationLabel(relation: contact.relationship.name.toDisplayCase())}\n${context.lango.phoneLabel(phone: contact.phone)}', // <-- REPLACED
          isThreeLine: true,
          onEdit: () => navigateToAddEdit(contact),
          onDelete:
              () => ref
                  .read(profileNotifierProvider.notifier)
                  .deleteContact(contact.contactId!),
        );
      },
    );
  }
}
