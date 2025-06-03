import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p; // For basename
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/employee_profile/presentation/experience/add_edit_employee_experience_screen.dart';
import 'package:police_com/features/employee_profile/presentation/registration_success_screen.dart';
import 'package:police_com/features/employee_profile/presentation/widgets/review_widgets.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

import '../../application/providers/add_new_employee_step_provider.dart';

class ReviewAndSubmitScreen extends HookConsumerWidget {
  const ReviewAndSubmitScreen({super.key});

  // Helper functions to build content for each review section
  Widget _buildCoreInfoContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewDetailItem(label: 'Employee ID', value: employeeData.employeeId),
        ReviewDetailItem(label: 'Title', value: employeeData.title),
        ReviewDetailItem(label: 'First Name', value: employeeData.firstName),
        ReviewDetailItem(
          label: "Father's Name",
          value: employeeData.fatherName,
        ),
        ReviewDetailItem(
          label: "Grandfather's Name",
          value: employeeData.grandName,
        ),
        ReviewDetailItem(
          label: 'Gender',
          value: employeeData.gender.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Date of Birth',
          value: DateFormat('dd MMM, yyyy').format(employeeData.birthDate),
        ),
        ReviewDetailItem(
          label: 'Photo',
          value:
              employeeData.photoFile != null
                  ? p.basename(employeeData.photoFile!.path)
                  : employeeData.photoUrl ?? 'Not provided',
        ),
        ReviewDetailItem(
          label: "Mother's Name",
          value: employeeData.motherName,
        ),
        ReviewDetailItem(label: 'Position ID', value: employeeData.positionId),
        ReviewDetailItem(label: 'Manager ID', value: employeeData.managerId),
        ReviewDetailItem(label: 'Address 1', value: employeeData.address1),
        ReviewDetailItem(label: 'Address 2', value: employeeData.address2),
        ReviewDetailItem(label: 'House No.', value: employeeData.houseNumber),
        ReviewDetailItem(label: 'Phone', value: employeeData.phone),
        ReviewDetailItem(label: 'Mobile', value: employeeData.mobile),
        ReviewDetailItem(label: 'Email', value: employeeData.email),
        ReviewDetailItem(
          label: 'Nationality',
          value: employeeData.nationality.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Blood Group',
          value: employeeData.bloodGroup.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Religion',
          value: employeeData.religion.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Medical Status',
          value: employeeData.medicalStatus.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Retirement No.',
          value: employeeData.retirementNumber,
        ),
        ReviewDetailItem(label: 'TIN', value: employeeData.tin),
        ReviewDetailItem(
          label: 'Marital Status',
          value: employeeData.maritalStatus.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Employment Status',
          value: employeeData.employmentStatus.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Is Manager',
          value: employeeData.isManager ? 'Yes' : 'No',
        ),
        ReviewDetailItem(
          label: 'Employee Type',
          value: employeeData.employeeType.name.toDisplayCase(),
        ),
        ReviewDetailItem(
          label: 'Hired Date',
          value: DateFormat('dd MMM, yyyy').format(employeeData.hiredDate),
        ),
      ],
    );
  }

  Widget _buildContactsContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.employeeContacts.isEmpty)
      return const Text(
        'No contacts provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.employeeContacts
              .map(
                (contact) => ListTile(
                  leading: Icon(
                    contact.isPrimary
                        ? Icons.star_rounded
                        : Icons.person_outline,
                    size: 20,
                  ),
                  title: Text(
                    contact.fullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${contact.relationship.name.toDisplayCase()} - ${contact.phone}',
                  ),
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildDependantsContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.employeeDependants.isEmpty)
      return const Text(
        'No dependants provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.employeeDependants
              .map(
                (dep) => ListTile(
                  leading: Icon(
                    dep.gender == Gender.male ? Icons.male : Icons.female,
                    size: 20,
                  ),
                  title: Text(
                    dep.dependantFullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${dep.relation.name.toDisplayCase()}, DOB: ${DateFormat('dd MMM yyyy').format(dep.birthDate)}\nRegion: ${dep.region.name.toDisplayCase()}",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildEducationContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.employeeEducations.isEmpty)
      return const Text(
        'No education records provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.employeeEducations
              .map(
                (edu) => ListTile(
                  leading: const Icon(Icons.school_outlined, size: 20),
                  title: Text(
                    _getEducationLevelDisplayName(edu.educationLevel),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${_getUniversityDisplayName(edu.university)}\n${_getFieldOfStudyDisplayName(edu.fieldOfStudy)} (${DateFormat('yyyy').format(edu.startDate)} - ${edu.endDate != null ? DateFormat('yyyy').format(edu.endDate!) : 'Present'})",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  // Helpers for enum display names (could be extensions)
  static String _getEducationLevelDisplayName(EducationLevel e) =>
      e.name.toDisplayCase();
  static String _getUniversityDisplayName(EthiopianUniversity u) =>
      u.name.toDisplayCase();
  static String _getFieldOfStudyDisplayName(FieldOfStudy f) =>
      f.name.toDisplayCase();

  Widget _buildExperienceContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.employeeExperiences.isEmpty)
      return const Text(
        'No work experience provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.employeeExperiences
              .map(
                (exp) => ListTile(
                  leading: const Icon(Icons.work_history_outlined, size: 20),
                  title: Text(
                    exp.position ?? 'N/A Position',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${exp.organization ?? "N/A Organization"}\n${DateFormat('MMM yyyy').format(exp.joinDate)} - ${exp.separationDate != null ? DateFormat('MMM yyyy').format(exp.separationDate!) : 'Present'}",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildSpouseContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.employeeSpouse.isEmpty)
      return const Text(
        'No spouse information provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.employeeSpouse
              .map(
                (spouse) => ListTile(
                  leading: Icon(
                    spouse.gender == Gender.male
                        ? Icons.man_2_outlined
                        : Icons.woman_2_outlined,
                    size: 20,
                  ),
                  title: Text(
                    spouse.spouseFullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "DOB: ${DateFormat('dd MMM yyyy').format(spouse.spouseBirthDate)}\nPhone: ${spouse.spousePhone}",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildGeneralDocumentsContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.generalDocuments.isEmpty)
      return const Text(
        'No general documents provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.generalDocuments
              .map(
                (doc) => ListTile(
                  leading: const Icon(Icons.file_present_rounded, size: 20),
                  title: Text(
                    doc.documentName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${doc.documentType.name.toDisplayCase()}\nFile: ${doc.documentFile != null ? p.basename(doc.documentFile!.path) : (doc.filePath != null ? p.basename(doc.filePath!) : "No file")}",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildPerformanceContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    if (employeeData.performances.isEmpty)
      return const Text(
        'No performance records provided.',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    return Column(
      children:
          employeeData.performances
              .map(
                (perf) => ListTile(
                  leading: const Icon(Icons.trending_up_rounded, size: 20),
                  title: Text(
                    "Evaluation: ${DateFormat('dd MMM yyyy').format(perf.evaluationDate)}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Score: ${perf.scorePoint}/100, Rating: ${perf.rating}/5\nEvaluator: ${perf.evaluatorName}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeCreationState = ref.watch(employeeCreationNotifierProvider);
    final employeeData = employeeCreationState.employeeData;
    final isSubmitting = employeeCreationState.isSubmitting;

    void navigateToStep(int stepIndex) {
      // This directly updates the provider which AddNewEmployeeHostScreen listens to.
      ref.read(currentEmployeeCreationStepProvider.notifier).state = stepIndex;
    }

    void handleSubmit() async {
      final success =
          await ref
              .read(employeeCreationNotifierProvider.notifier)
              .submitNewEmployee();
      if (context.mounted) {
        // Check if widget is still in tree
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New Employee Profile Submitted Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const RegistrationSuccessScreen(),
            ), // Ensure this screen exists
            (Route<dynamic> route) => false,
          );
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .prepareNewEmployee(); // Reset for next potential entry
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                employeeCreationState.errorMessage ??
                    'Submission Failed. Please review data or try again.',
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    }

    // This screen is the last data-related screen in the PageView
    // Its "Next" button is effectively the "Submit" button.
    // Its "Previous" button should go to the last data entry screen (e.g., Performance or Documents).
    int previousStepIndex = AddNewEmployeeHostScreen.totalSteps - 2;

    return FormStepLayout(
      onNext: handleSubmit, // "Next" on review screen is "Submit"
      onPrevious: () => navigateToStep(previousStepIndex),
      nextButtonText: 'Confirm & Submit',
      isNextLoading: isSubmitting,
      isLastStep: true,
      child: ListView(
        // Use ListView to accommodate all sections
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Please review all employee information carefully before submitting.',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          ReviewSectionCard(
            sectionTitle: 'Core Information',
            sectionIcon: Icons.badge_outlined,
            content: _buildCoreInfoContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(0), // Index of EmployeeCoreInfoScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Contacts',
            sectionIcon: Icons.contacts_outlined,
            content: _buildContactsContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(1), // Index of EmployeeContactsScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Dependants',
            sectionIcon: Icons.escalator_warning_outlined,
            content: _buildDependantsContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(2), // Index of EmployeeDependantsScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Education',
            sectionIcon: Icons.school_outlined,
            content: _buildEducationContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(3), // Index of EmployeeEducationScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Experience',
            sectionIcon: Icons.work_history_outlined,
            content: _buildExperienceContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(4), // Index of EmployeeExperienceScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Spouse Information',
            sectionIcon: Icons.wc_outlined, // Or a more appropriate icon
            content: _buildSpouseContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(5), // Index of EmployeeSpouseInfoScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'General Documents',
            sectionIcon: Icons.folder_open_outlined,
            content: _buildGeneralDocumentsContent(context, employeeData),
            onEditPressed:
                () => navigateToStep(
                  6,
                ), // Index of EmployeeGeneralDocumentsScreen
          ),
          ReviewSectionCard(
            sectionTitle: 'Performance Records',
            sectionIcon: Icons.trending_up_outlined,
            content: _buildPerformanceContent(context, employeeData),
            onEditPressed:
                () =>
                    navigateToStep(7), // Index of EmployeePerformanceListScreen
          ),
          const SizedBox(
            height: 24,
          ), // Spacer for the submit button from BottomAppBar
        ],
      ), // This is the logical last step handled by FormStepLayout for data entry/review
    );
  }
}
