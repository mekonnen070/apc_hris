import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/academic_qualification.dart';
import 'package:police_com/features/employee_profile/presentation/academic_qualification/add_edit_qualification_screen.dart';
import 'package:police_com/features/widgets/dynamic_entry_section.dart';
import 'package:police_com/features/widgets/editable_list_item_card.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';
// import 'package/your_app/models/academic_qualification_model.dart';
// import 'package/your_app/screens/add_edit_qualification_screen.dart';
// import 'package/your_app/widgets/...';

// TODO: Define your Riverpod provider for registration state that holds List<AcademicQualificationModel>
// final registrationDataProvider = ... ;

class AcademicQualificationsScreen extends HookConsumerWidget {
  const AcademicQualificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This state holds the list of qualifications for this screen.
    // In a real app, this would come from/be saved to a Riverpod provider.
    final qualificationsList = useState<List<AcademicQualification>>([]);

    void navigateToAddEditScreen([
      AcademicQualification? qualificationToEdit,
    ]) async {
      final result = await Navigator.of(context).push<AcademicQualification>(
        MaterialPageRoute(
          builder:
              (_) => AddEditQualificationScreen(
                initialQualification: qualificationToEdit,
              ),
        ),
      );

      if (result != null) {
        final index = qualificationsList.value.indexWhere(
          (q) => q.id == result.id,
        );
        if (index != -1) {
          // Editing existing
          final updatedList = List<AcademicQualification>.from(
            qualificationsList.value,
          );
          updatedList[index] = result;
          qualificationsList.value = updatedList;
        } else {
          // Adding new
          qualificationsList.value = [...qualificationsList.value, result];
        }
        // TODO: Update Riverpod state:
        // ref.read(registrationDataProvider.notifier).updateQualifications(qualificationsList.value);
      }
    }

    void deleteQualification(String id) {
      final updatedList =
          qualificationsList.value.where((q) => q.id != id).toList();
      qualificationsList.value = updatedList;
      // TODO: Update Riverpod state:
      // ref.read(registrationDataProvider.notifier).updateQualifications(qualificationsList.value);
    }

    void onNextPressed() {
      // Optional: Validate if at least one qualification is needed
      // if (qualificationsList.value.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Please add at least one academic qualification.')),
      //   );
      //   return;
      // }
      // TODO: Navigate to Work Experience Screen
      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => WorkExperienceScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Academic Info (Conceptual) Saved! Moving to next.'),
        ),
      );
    }

    return FormStepLayout(
      stepTitle: 'Academic Qualifications',
      onNext: onNextPressed,
      onPrevious: () => Navigator.of(context).pop(),
      child: DynamicEntrySection<AcademicQualification>(
        sectionTitle:
            'Your Qualifications', // This title is within the content area
        addNewButtonText: '+ Add Qualification',
        emptyListMessage:
            "No academic qualifications added yet. Tap '+ Add Qualification' to start.",
        itemsData: qualificationsList.value,
        onAddNew: () => navigateToAddEditScreen(),
        itemBuilder: (ctx, qualification, onEditCallback, onDeleteCallback) {
          // The onEdit and onDelete for DynamicEntrySection are not used directly here
          // as we define them with specific item context below.
          return EditableListItemCard(
            title: qualification.degreeOrCertificate,
            subtitle:
                "${qualification.institutionName}\nGraduated: ${qualification.graduationDate != null ? DateFormat('yyyy-MM-dd').format(qualification.graduationDate!) : 'N/A'}",
            onEdit: () => navigateToAddEditScreen(qualification),
            onDelete: () => deleteQualification(qualification.id),
            onTap:
                () => navigateToAddEditScreen(
                  qualification,
                ), // Or a view-only screen
          );
        },
      ),
    );
  }
}
