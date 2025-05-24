import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/work_experience.dart';
import 'package:police_com/features/employee_profile/presentation/work_experience/add_edit_work_experience_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

class WorkExperienceScreen extends HookConsumerWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiencesList = useState<List<WorkExperience>>([]);

    void navigateToAddEditScreen([WorkExperience? experienceToEdit]) async {
      final result = await Navigator.of(context).push<WorkExperience>(
        MaterialPageRoute(
          builder:
              (_) => AddEditWorkExperienceScreen(
                initialExperience: experienceToEdit,
              ),
        ),
      );

      if (result != null) {
        final index = experiencesList.value.indexWhere(
          (exp) => exp.id == result.id,
        );
        if (index != -1) {
          final updatedList = List<WorkExperience>.from(experiencesList.value);
          updatedList[index] = result;
          experiencesList.value = updatedList;
        } else {
          experiencesList.value = [...experiencesList.value, result];
        }
        // TODO: Update Riverpod state:
        // ref.read(registrationDataProvider.notifier).updateExperiences(experiencesList.value);
      }
    }

    void deleteExperience(String id) {
      final updatedList =
          experiencesList.value.where((exp) => exp.id != id).toList();
      experiencesList.value = updatedList;
      // TODO: Update Riverpod state:
      // ref.read(registrationDataProvider.notifier).updateExperiences(experiencesList.value);
    }

    void onNextPressed() {
      // TODO: Navigate to General Documents Screen or Review Screen
      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => GeneralDocumentsScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Work Experience (Conceptual) Saved! Moving to next.'),
        ),
      );
    }

    String formatDateRange(DateTime start, DateTime? end) {
      final DateFormat formatter = DateFormat('MMM yyyy');
      String formattedStart = formatter.format(start);
      String formattedEnd = end != null ? formatter.format(end) : 'Present';
      return '$formattedStart - $formattedEnd';
    }

    return FormStepLayout(
      stepTitle: 'Work Experience',
      onNext: onNextPressed,
      onPrevious: () => Navigator.of(context).pop(),
      child: DynamicEntrySection<WorkExperience>(
        sectionTitle: 'Your Work History',
        addNewButtonText: '+ Add Experience',
        emptyListMessage:
            "No work experiences added yet. Tap '+ Add Experience' to start.",
        itemsData: experiencesList.value,
        onAddNew: () => navigateToAddEditScreen(),
        itemBuilder: (ctx, experience, onEditCallback, onDeleteCallback) {
          return EditableListItemCard(
            title: experience.jobTitle,
            subtitle:
                '${experience.companyName}\n${formatDateRange(experience.startDate, experience.endDate)}',
            onEdit: () => navigateToAddEditScreen(experience),
            onDelete: () => deleteExperience(experience.id),
            onTap: () => navigateToAddEditScreen(experience),
          );
        },
      ),
    );
  }
}
