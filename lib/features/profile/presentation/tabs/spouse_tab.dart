// lib/features/profile/presentation/tabs/spouse_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/forms/add_edit_spouse_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';

class SpouseTab extends ConsumerWidget {
  final EmployeeInfoModel employee;
  const SpouseTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateToAddEdit(EmployeeSpouseModel? spouse) async {
      final result = await Navigator.of(context).push<EmployeeSpouseModel>(
        MaterialPageRoute(
          builder:
              (_) => AddEditSpouseScreen(
                initialSpouse: spouse,
                employeeId: employee.employeeId,
              ),
        ),
      );
      if (result != null) {
        if (spouse != null) {
          ref
              .read(profileNotifierProvider(employee.employeeId).notifier)
              .updateSpouse(result);
        } else {
          ref
              .read(profileNotifierProvider(employee.employeeId).notifier)
              .addSpouse(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeSpouseModel>(
      sectionTitle: 'Spouse Information',
      onAddNew: () => navigateToAddEdit(null),

      itemsData: employee.employeeSpouse,
      emptyListMessage: 'No spouse information available.',
      itemBuilder: (context, spouse, index) {
        return EditableListItemCard(
          title: spouse.spouseFullName,
          subtitle:
              'Occupation: ${spouse.spouseOccupation ?? 'N/A'}\nDOB: ${DateFormat.yMMMd().format(spouse.spouseBirthDate)}',
          isThreeLine: true,
          onEdit: () {
            navigateToAddEdit(spouse);
          },
          onDelete: () {
            ref
                .read(profileNotifierProvider(employee.employeeId).notifier)
                .deleteSpouse(spouse.spouseId!);
          },
        );
      },
      addNewButtonText: '',
    );
  }
}
