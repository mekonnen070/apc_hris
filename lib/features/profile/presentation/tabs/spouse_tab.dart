import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
              .read(profileNotifierProvider.notifier)
              .updateSpouse(result);
        } else {
          ref
              .read(profileNotifierProvider.notifier)
              .addSpouse(result);
        }
      }
    }

    return DynamicEntrySection<EmployeeSpouseModel>(
      sectionTitle: context.lango.spouseInformation, // <-- REPLACED
      onAddNew: () => navigateToAddEdit(null),

      itemsData: employee.employeeSpouse,
      emptyListMessage: context.lango.noSpouseInfoAvailable, // <-- REPLACED
      itemBuilder: (context, spouse, index) {
        return EditableListItemCard(
          title: spouse.spouseFullName,
          subtitle:
              '${context.lango.occupation(occupation: spouse.spouseOccupation ?? context.lango.notAvailable)}\n${context.lango.dobLabel(dob: DateFormat.yMMMd().format(spouse.spouseBirthDate))}', // <-- REPLACED
          isThreeLine: true,
          onEdit: () {
            navigateToAddEdit(spouse);
          },
          onDelete: () {
            ref
                .read(profileNotifierProvider.notifier)
                .deleteSpouse(spouse.spouseId!);
          },
        );
      },
      addNewButtonText: '',
    );
  }
}