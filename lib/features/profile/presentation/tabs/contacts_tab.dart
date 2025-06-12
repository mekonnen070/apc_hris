// lib/features/profile/presentation/tabs/contacts_tab.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          ref
              .read(profileNotifierProvider(employee.employeeId).notifier)
              .updateContact(result);
        } else {
          ref
              .read(profileNotifierProvider(employee.employeeId).notifier)
              .addContact(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeContactModel>(
      addNewButtonText: 'Add Emergency Contact',
      sectionTitle: 'Emergency Contacts',
      onAddNew: () => navigateToAddEdit(null),
      itemsData: employee.employeeContacts,
      emptyListMessage: 'No emergency contacts listed.',
      itemBuilder: (context, contact, index) {
        return EditableListItemCard(
          title: contact.fullName,
          subtitle:
              'Relation: ${contact.relationship.name.toDisplayCase()}\nPhone: ${contact.phone}',
          isThreeLine: true,
          onEdit: () => navigateToAddEdit(contact),
          onDelete:
              () => ref
                  .read(profileNotifierProvider(employee.employeeId).notifier)
                  .deleteContact(contact.contactId!),
        );
      },
    );
  }
}
