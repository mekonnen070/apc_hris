import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:path/path.dart' as p; // For basename to display file names
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee_profile/application/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/employee_profile/presentation/widgets/review_widgets.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

import '../../application/add_new_employee_step_provider.dart';
import '../registration_success_screen.dart';

class ReviewAndSubmitScreen extends HookConsumerWidget {
  const ReviewAndSubmitScreen({super.key});

  // --- Helper methods to build content for each review section ---

  Widget _buildCoreInfoContent(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewDetailItem(label: 'Employee ID', value: employeeData.employeeId),
        ReviewDetailItem(label: 'Title', value: employeeData.title ?? 'N/A'),
        ReviewDetailItem(label: 'First Name', value: employeeData.firstName),
        ReviewDetailItem(
          label: "Father's Name",
          value: employeeData.fatherName ?? 'N/A',
        ),
        ReviewDetailItem(
          label: "Grandfather's Name",
          value: employeeData.grandName ?? 'N/A',
        ),
        ReviewDetailItem(
          label: 'Gender',
          value: employeeData.gender.toDisplayString,
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
                  : (employeeData.photoUrl ?? 'Not provided'),
        ),
        ReviewDetailItem(
          label: "Mother's Name",
          value: employeeData.motherName ?? 'N/A',
        ),
        ReviewDetailItem(label: 'Position ID', value: employeeData.positionId),
        ReviewDetailItem(
          label: 'Manager ID',
          value: employeeData.managerId ?? 'N/A',
        ),
        ReviewDetailItem(label: 'Address 1', value: employeeData.address1),
        ReviewDetailItem(
          label: 'Address 2',
          value: employeeData.address2 ?? 'N/A',
        ),
        ReviewDetailItem(
          label: 'House No.',
          value: employeeData.houseNumber ?? 'N/A',
        ),
        ReviewDetailItem(label: 'Phone', value: employeeData.phone),
        ReviewDetailItem(label: 'Mobile', value: employeeData.mobile),
        ReviewDetailItem(label: 'Email', value: employeeData.email),
        ReviewDetailItem(
          label: 'Nationality',
          value: employeeData.nationality.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Blood Group',
          value: employeeData.bloodGroup.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Religion',
          value: employeeData.religion.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Medical Status',
          value: employeeData.medicalStatus.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Retirement No.',
          value: employeeData.retirementNumber ?? 'N/A',
        ),
        ReviewDetailItem(label: 'TIN', value: employeeData.tin ?? 'N/A'),
        ReviewDetailItem(
          label: 'Marital Status',
          value: employeeData.maritalStatus.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Employment Status',
          value: employeeData.employmentStatus.toDisplayString,
        ),
        ReviewDetailItem(
          label: 'Is Manager',
          value: employeeData.isManager ? 'Yes' : 'No',
        ),
        ReviewDetailItem(
          label: 'Employee Type',
          value: employeeData.employeeType.toDisplayString,
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
                        : Icons.person_outline_rounded,
                    size: 20,
                    color:
                        contact.isPrimary
                            ? Theme.of(context).primaryColor
                            : null,
                  ),
                  title: Text(
                    contact.fullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${contact.relationship.toDisplayString} - ${contact.phone}',
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
                    dep.gender == Gender.male
                        ? Icons.male_rounded
                        : dep.gender == Gender.female
                        ? Icons.female_rounded
                        : Icons.person_search_outlined,
                    size: 20,
                  ),
                  title: Text(
                    dep.dependantFullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${dep.relation.toDisplayString}, DOB: ${DateFormat('dd MMM, yyyy').format(dep.birthDate)}\nRegion: ${dep.region.toDisplayString}",
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
                    edu.educationLevel.toDisplayString,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${edu.university.toDisplayString}\n${edu.fieldOfStudy.toDisplayString} (${DateFormat('yyyy').format(edu.startDate)} - ${edu.endDate != null ? DateFormat('yyyy').format(edu.endDate!) : 'Present'})\nStatus: ${edu.educationStatus.toDisplayString}",
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

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
                    "${exp.organization ?? "N/A Organization"} (${exp.organizationType.toDisplayString})\n${DateFormat('MMM yyyy').format(exp.joinDate)} - ${exp.separationDate != null ? DateFormat('MMM yyyy').format(exp.separationDate!) : 'Present'}\nProficiency: ${exp.proficiencyLevel.toDisplayString}",
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
                    "Title: ${spouse.title}, DOB: ${DateFormat('dd MMM, yyyy').format(spouse.spouseBirthDate)}\nPhone: ${spouse.spousePhone}",
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
        'No general documents uploaded.',
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
                    "${doc.documentType.toDisplayString}\nFile: ${doc.documentFile != null ? p.basename(doc.documentFile!.path) : (doc.filePath != null ? p.basename(doc.filePath!) : "No file selected/uploaded")}",
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
                    "Evaluation: ${DateFormat('dd MMM, yyyy').format(perf.evaluationDate)}",
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

  // Define step indices for navigation (must match AddNewEmployeeHostScreen._employeeCreationSteps order)
  static const int coreInfoStepIndex = 0;
  static const int contactsStepIndex = 1;
  static const int dependantsStepIndex = 2;
  static const int educationStepIndex = 3;
  static const int experienceStepIndex = 4;
  static const int spouseStepIndex = 5;
  static const int documentsStepIndex = 6;
  static const int performanceStepIndex = 7;
  // Review screen itself is the last step managed by PageView, so "Previous" goes to performance (or last data step)

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeCreationState = ref.watch(employeeCreationNotifierProvider);
    final employeeData = employeeCreationState.employeeData;
    final isSubmitting = employeeCreationState.isSubmitting;

    void navigateToStepForEditing(int stepIndex) {
      ref.read(currentEmployeeCreationStepProvider.notifier).state = stepIndex;
    }

    void handleSubmit() async {
      final success =
          await ref
              .read(employeeCreationNotifierProvider.notifier)
              .submitNewEmployee();
      if (context.mounted) {
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
            ),
            (Route<dynamic> route) => false,
          );
          // Reset the creation form for a potential new entry
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .prepareNewEmployee();
          // Reset step provider to first step for next time host screen is opened
          ref.read(currentEmployeeCreationStepProvider.notifier).state = 0;
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

    // Determine the index of the step immediately preceding this review screen
    // This assumes ReviewAndSubmitScreen is the last item in AddNewEmployeeHostScreen._employeeCreationSteps
    final previousDataStepIndex = AddNewEmployeeHostScreen.totalSteps - 2;

    return FormStepLayout(
      isLastStep:
          true, // Indicates this is the logical "end" of data steps for FormStepLayout's button
      nextButtonText: 'Confirm & Submit',
      onNext: handleSubmit, // "Next" button becomes the "Submit" action
      onPrevious:
          () => navigateToStepForEditing(
            previousDataStepIndex < 0 ? 0 : previousDataStepIndex,
          ), // Go to the actual last data entry step
      isNextLoading: isSubmitting,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Please review all employee information carefully before submitting.',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          ReviewSectionCard(
            sectionTitle: 'Core Information',
            sectionIcon: Icons.badge_outlined,
            content: _buildCoreInfoContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(coreInfoStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Contacts',
            sectionIcon: Icons.contacts_outlined,
            content: _buildContactsContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(contactsStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Dependants',
            sectionIcon: Icons.escalator_warning_outlined,
            content: _buildDependantsContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(dependantsStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Education History',
            sectionIcon: Icons.school_outlined,
            content: _buildEducationContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(educationStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Work Experience',
            sectionIcon: Icons.work_history_outlined,
            content: _buildExperienceContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(experienceStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Spouse Information',
            sectionIcon: Icons.wc_outlined,
            content: _buildSpouseContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(spouseStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'General Documents',
            sectionIcon: Icons.folder_copy_outlined,
            content: _buildGeneralDocumentsContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(documentsStepIndex),
          ),
          ReviewSectionCard(
            sectionTitle: 'Performance Records',
            sectionIcon: Icons.trending_up_outlined,
            content: _buildPerformanceContent(context, employeeData),
            onEditPressed: () => navigateToStepForEditing(performanceStepIndex),
          ),
          const SizedBox(height: 24), // Space before bottom bar buttons
        ],
      ),
    );
  }
}
