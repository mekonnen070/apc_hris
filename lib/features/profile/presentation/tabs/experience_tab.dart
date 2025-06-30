import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/forms/add_edit_experience_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';

class ExperienceTab extends ConsumerWidget {
  final EmployeeInfoModel employee;
  const ExperienceTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = employee.employeeExperiences;

    void navigateToAddEdit(EmployeeExperienceModel? experience) async {
      final result = await Navigator.of(context).push<EmployeeExperienceModel>(
        MaterialPageRoute(
          builder: (_) => AddEditExperienceScreen(
            initialExperience: experience,
            employeeId: employee.employeeId,
          ),
        ),
      );
      if (result == null || !context.mounted) return;

      final notifier = ref.read(profileNotifierProvider.notifier);
      final bool success;
      final String action;

      if (experience != null) {
        success = await notifier.updateExperience(result);
        action = context.lango.updated; // <-- REPLACED
      } else {
        success = await notifier.addExperience(result);
        action = context.lango.added; // <-- REPLACED
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success
                ? context.lango.experienceSuccess(action: action) // <-- REPLACED
                : context.lango.failedToExperience(action: action.replaceAll('ed', ''))), // <-- REPLACED
          ),
        );
      }
    }

    return DynamicEntrySection<EmployeeExperienceModel>(
      sectionTitle: context.lango.experience, // <-- REPLACED
      itemsData: experiences,
      addNewButtonText: context.lango.addExperience, // <-- REPLACED
      onAddNew: () => navigateToAddEdit(null),
      itemBuilder: (context, experience, index) {
        return EditableListItemCard(
          onTap: () => navigateToAddEdit(experience),
          onDelete: () async {
            final success = await ref
                .read(profileNotifierProvider.notifier)
                .deleteExperience(experience.experienceId!);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success
                      ? context.lango.experienceDeleted // <-- REPLACED
                      : context.lango.failedToDeleteExperience), // <-- REPLACED
                ),
              );
            }
          },
          title: experience.position ?? context.lango.notAvailable, // <-- REPLACED
          subtitle:
              '${experience.organization ?? context.lango.notAvailable}\n${DateFormat.yMMMd().format(experience.joinDate)} - ${experience.separationDate != null ? DateFormat.yMMMd().format(experience.separationDate!) : context.lango.present}', // <-- REPLACED
          isThreeLine: true,
        );
      },
    );
  }
}