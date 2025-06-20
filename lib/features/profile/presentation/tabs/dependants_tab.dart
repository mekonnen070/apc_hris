// lib/features/profile/presentation/tabs/dependants_tab.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/forms/add_edit_dependant_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';

class DependantsTab extends ConsumerWidget {
  final EmployeeInfoModel employee;
  const DependantsTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateToAddEdit(EmployeeDependantModel? dependant) async {
      final result = await Navigator.of(context).push<EmployeeDependantModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditDependantScreen(
                initialDependant: dependant,
                employeeId: employee.employeeId,
              ),
        ),
      );
      if (result != null) {
        if (dependant != null) {
          ref.read(profileNotifierProvider(employee.employeeId).notifier).updateDependant(result);
        } else {
          ref.read(profileNotifierProvider(employee.employeeId).notifier).addDependant(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeDependantModel>(
      addNewButtonText: 'Add Dependant',
      sectionTitle: 'Dependants',
      onAddNew: () => navigateToAddEdit(null),
      itemsData: employee.employeeDependants,
      emptyListMessage: 'No dependants listed.',
      itemBuilder: (context, dependant, index) {
        return EditableListItemCard(
          title: dependant.dependantFullName,
          subtitle:
              'Relation: ${dependant.relation.name.toDisplayCase()}\nDOB: ${DateFormat.yMMMd().format(dependant.birthDate)}',
          isThreeLine: true,
          onEdit: () => navigateToAddEdit(dependant),
          onDelete:
              () => ref
                  .read(profileNotifierProvider(employee.employeeId).notifier)
                  .deleteDependant(dependant.dependantId!),
        );
      },
    );
  }
}
