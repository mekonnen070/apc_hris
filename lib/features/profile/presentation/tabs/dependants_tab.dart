import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
          ref.read(profileNotifierProvider.notifier).updateDependant(result);
        } else {
          ref.read(profileNotifierProvider.notifier).addDependant(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeDependantModel>(
      addNewButtonText: context.lango.addDependant, // <-- REPLACED
      sectionTitle: context.lango.dependants, // <-- REPLACED
      onAddNew: () => navigateToAddEdit(null),
      itemsData: employee.employeeDependants,
      emptyListMessage: context.lango.noDependantsListed, // <-- REPLACED
      itemBuilder: (context, dependant, index) {
        return EditableListItemCard(
          title: dependant.dependantFullName,
          subtitle:
              '${context.lango.relationLabel(relation: dependant.relation.name.toDisplayCase())}\n${context.lango.dobLabel(dob: DateFormat.yMMMd().format(dependant.birthDate))}', // <-- REPLACED
          isThreeLine: true,
          onEdit: () => navigateToAddEdit(dependant),
          onDelete:
              () => ref.read(profileNotifierProvider.notifier).deleteDependant(dependant.dependantId!),
        );
      },
    );
  }
}