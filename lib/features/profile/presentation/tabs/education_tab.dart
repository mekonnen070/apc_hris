import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/forms/add_edit_education_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';

class EducationTab extends ConsumerWidget {
  final EmployeeInfoModel employee;
  const EducationTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final educations = employee.employeeEducations;

    void navigateToAddEdit(EmployeeEducationModel? education) async {
      final result = await Navigator.of(context).push<EmployeeEducationModel>(
        MaterialPageRoute(
          builder: (_) => AddEditEducationScreen(
            initialEducation: education,
            employeeId: employee.employeeId,
          ),
        ),
      );
      if (result == null || !context.mounted) return;

      final notifier =
          ref.read(profileNotifierProvider(employee.employeeId).notifier);
      final bool success;
      final String action;

      if (education != null) {
        success = await notifier.updateEducation(result);
        action = context.lango.updated; // <-- REPLACED
      } else {
        success = await notifier.addEducation(result);
        action = context.lango.added; // <-- REPLACED
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success
                ? context.lango.educationSuccess(action: action) // <-- REPLACED
                : context.lango.failedToEducation(action: action.replaceAll('ed', ''))), // <-- REPLACED
          ),
        );
      }
    }

    return DynamicEntrySection<EmployeeEducationModel>(
      sectionTitle: context.lango.education, // <-- REPLACED
      itemsData: educations,
      addNewButtonText: context.lango.addEducation, // <-- REPLACED
      onAddNew: () => navigateToAddEdit(null),
      itemBuilder: (context, education, index) {
        return EditableListItemCard(
          onTap: () => navigateToAddEdit(education),
          onDelete: () async {
            final success = await ref
                .read(profileNotifierProvider(employee.employeeId).notifier)
                .deleteEducation(education.educationId!);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success
                      ? context.lango.educationDeleted // <-- REPLACED
                      : context.lango.failedToDeleteEducation), // <-- REPLACED
                ),
              );
            }
          },
          title: education.fieldOfStudy.name,
          subtitle:
              '${education.university.name}\n${DateFormat.yMMMd().format(education.startDate)} - ${education.endDate != null ? DateFormat.yMMMd().format(education.endDate!) : context.lango.present}', // <-- REPLACED
          isThreeLine: true,
        );
      },
    );
  }
}