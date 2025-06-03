import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/add_new_employee_step_provider.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee/employee_profile/application/providers/employee_detail_providers.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_education_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_experience_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_performance_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_upload_model.dart';
import 'package:police_com/features/employee/employee_profile/presentation/add_new_employee_host_screen.dart';

class EmployeeDetailScreen extends HookConsumerWidget {
  final EmployeeInfoModel employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(employeeDetailNotifierProvider(employee));
    final detailNotifier = ref.read(
      employeeDetailNotifierProvider(employee).notifier,
    );
    final employeeData = detailState.employeeData; // Use data from the state

    // Listen for delete success/error messages to show SnackBars and navigate
    ref.listen<String?>(
      employeeDetailNotifierProvider(
        employee,
      ).select((state) => state.deleteSuccessMessage),
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next), backgroundColor: Colors.green),
          );
          detailNotifier.clearDeleteMessages();
          // Navigate back to the employee list after successful deletion
          Navigator.of(context).popUntil((route) => route.isFirst);
          // Optionally, trigger a refresh of the employee list if it's visible
          // This might involve a global event or a callback if EmployeeListScreen is still in the widget tree.
          // For simplicity, we assume EmployeeListScreen will re-fetch or be refreshed manually.
        }
      },
    );

    ref.listen<String?>(
      employeeDetailNotifierProvider(
        employee,
      ).select((state) => state.deleteErrorMessage),
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          detailNotifier.clearDeleteMessages();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          employeeData.computedFullName.isNotEmpty
              ? employeeData.computedFullName
              : 'Employee Details',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Employee',
            onPressed:
                detailState.isDeleting
                    ? null
                    : () {
                      // Prepare the creation notifier with the data of the employee being viewed for editing
                      ref
                          .read(employeeCreationNotifierProvider.notifier)
                          .loadEmployeeForEditing(employeeData.employeeId);
                      ref
                          .read(currentEmployeeCreationStepProvider.notifier)
                          .state = 0; // Start edit from first step
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => AddNewEmployeeHostScreen(
                                employeeIdToEdit: employeeData.employeeId,
                              ),
                        ),
                      );
                    },
          ),
          IconButton(
            icon:
                detailState.isDeleting
                    ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                    : const Icon(Icons.delete_outline),
            tooltip: 'Delete Employee',
            onPressed:
                detailState.isDeleting
                    ? null
                    : () {
                      detailNotifier.confirmDeleteEmployee(context);
                    },
          ),
          IconButton(
            icon:
                detailState.isLoading
                    ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                    : const Icon(Icons.refresh_outlined),
            tooltip: 'Refresh Details',
            onPressed:
                detailState.isLoading
                    ? null
                    : () {
                      detailNotifier.refreshEmployeeDetails();
                    },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(12.0),
            children: <Widget>[
              _buildPhotoSection(context, employeeData),
              const SizedBox(height: 16),
              _buildSection(
                context: context,
                title: 'Personal & Identity',
                icon: Icons.badge_outlined,
                content: _buildPersonalIdentityContent(context, employeeData),
              ),
              _buildSection(
                context: context,
                title: 'Contact & Address',
                icon: Icons.contact_mail_outlined,
                content: _buildContactAddressContent(context, employeeData),
              ),
              _buildSection(
                context: context,
                title: 'Employment Details',
                icon: Icons.work_outline,
                content: _buildEmploymentDetailsContent(context, employeeData),
              ),
              if (employeeData.employeeContacts.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Emergency Contacts',
                  icon: Icons.contact_emergency_outlined,
                  content: _buildContactsList(
                    context,
                    employeeData.employeeContacts,
                  ),
                ),
              if (employeeData.employeeDependants.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Dependants',
                  icon: Icons.escalator_warning_outlined,
                  content: _buildDependantsList(
                    context,
                    employeeData.employeeDependants,
                  ),
                ),
              if (employeeData.employeeEducations.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Education History',
                  icon: Icons.school_outlined,
                  content: _buildEducationList(
                    context,
                    employeeData.employeeEducations,
                  ),
                ),
              if (employeeData.employeeExperiences.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Work Experience',
                  icon: Icons.work_history_outlined,
                  content: _buildExperienceList(
                    context,
                    employeeData.employeeExperiences,
                  ),
                ),
              if (employeeData.employeeSpouse.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Spouse Information',
                  icon: Icons.wc_outlined,
                  content: _buildSpouseList(
                    context,
                    employeeData.employeeSpouse,
                  ),
                ),
              if (employeeData.generalDocuments.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Uploaded Documents',
                  icon: Icons.folder_copy_outlined,
                  content: _buildDocumentsList(
                    context,
                    employeeData.generalDocuments,
                  ),
                ),
              if (employeeData.performances.isNotEmpty)
                _buildSection(
                  context: context,
                  title: 'Performance Reviews',
                  icon: Icons.trending_up_outlined,
                  content: _buildPerformanceList(
                    context,
                    employeeData.performances,
                  ),
                ),
              const SizedBox(
                height: 60,
              ), // Space for potential FAB or bottom elements
            ],
          ),
          if (detailState.isLoading &&
              !detailState.isDeleting) // Show linear progress for refresh
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildPhotoSection(
    BuildContext context,
    EmployeeInfoModel employeeData,
  ) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            backgroundImage:
                employeeData.photoUrl != null &&
                        employeeData.photoUrl!.isNotEmpty
                    ? NetworkImage(employeeData.photoUrl!)
                    : null,
            child:
                employeeData.photoUrl == null || employeeData.photoUrl!.isEmpty
                    ? Text(
                      employeeData.computedFullName.isNotEmpty
                          ? employeeData.computedFullName
                              .substring(0, 2)
                              .toUpperCase()
                          : '??',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : null,
          ),
          const SizedBox(height: 8),
          Text(
            employeeData.computedFullName,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            employeeData.positionId, // TODO: Should be position title
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Widget content,
    bool initiallyExpanded = true,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ExpansionTile(
        key: PageStorageKey(title), // For maintaining expansion state
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        initiallyExpanded: initiallyExpanded,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [content],
      ),
    );
  }

  Widget _buildPersonalIdentityContent(
    BuildContext context,
    EmployeeInfoModel data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailItem(label: 'Employee ID', value: data.employeeId),
        if (data.title != null && data.title!.isNotEmpty)
          _DetailItem(label: 'Title', value: data.title),
        _DetailItem(label: 'First Name', value: data.firstName),
        if (data.fatherName != null && data.fatherName!.isNotEmpty)
          _DetailItem(label: 'Father\'s Name', value: data.fatherName),
        if (data.grandName != null && data.grandName!.isNotEmpty)
          _DetailItem(label: 'Grandfather\'s Name', value: data.grandName),
        _DetailItem(label: 'Gender', value: data.gender.toDisplayString),
        _DetailItem(
          label: 'Date of Birth',
          value: DateFormat('dd MMM, yyyy').format(data.birthDate),
        ),
        if (data.motherName != null && data.motherName!.isNotEmpty)
          _DetailItem(label: 'Mother\'s Name', value: data.motherName),
        _DetailItem(
          label: 'Nationality',
          value: data.nationality.toDisplayString,
        ),
        _DetailItem(
          label: 'Blood Group',
          value: data.bloodGroup.toDisplayString,
        ),
        _DetailItem(label: 'Religion', value: data.religion.toDisplayString),
        _DetailItem(
          label: 'Marital Status',
          value: data.maritalStatus.toDisplayString,
        ),
        if (data.tin != null && data.tin!.isNotEmpty)
          _DetailItem(label: 'TIN', value: data.tin),
        if (data.retirementNumber != null && data.retirementNumber!.isNotEmpty)
          _DetailItem(label: 'Retirement No.', value: data.retirementNumber),
        _DetailItem(
          label: 'Medical Status',
          value: data.medicalStatus.toDisplayString,
        ),
      ],
    );
  }

  Widget _buildContactAddressContent(
    BuildContext context,
    EmployeeInfoModel data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailItem(label: 'Primary Phone', value: data.phone),
        _DetailItem(label: 'Mobile Number', value: data.mobile),
        _DetailItem(label: 'Email', value: data.email),
        _DetailItem(label: 'Primary Address', value: data.address1),
        if (data.address2 != null && data.address2!.isNotEmpty)
          _DetailItem(label: 'Secondary Address', value: data.address2),
        if (data.houseNumber != null && data.houseNumber!.isNotEmpty)
          _DetailItem(label: 'House Number', value: data.houseNumber),
      ],
    );
  }

  Widget _buildEmploymentDetailsContent(
    BuildContext context,
    EmployeeInfoModel data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailItem(
          label: 'Position',
          value: data.positionId,
        ), // TODO: Display position title
        if (data.managerId != null && data.managerId!.isNotEmpty)
          _DetailItem(
            label: 'Manager ID',
            value: data.managerId,
          ), // TODO: Display manager name
        _DetailItem(
          label: 'Hired Date',
          value: DateFormat('dd MMM, yyyy').format(data.hiredDate),
        ),
        _DetailItem(
          label: 'Employee Type',
          value: data.employeeType.toDisplayString,
        ),
        _DetailItem(
          label: 'Employment Status',
          value: data.employmentStatus.toDisplayString,
        ),
        _DetailItem(label: 'Is Manager', value: data.isManager ? 'Yes' : 'No'),
        if (data.retirementEligibilityDate != null)
          _DetailItem(
            label: 'Retirement Eligibility',
            value: DateFormat(
              'dd MMM, yyyy',
            ).format(data.retirementEligibilityDate!),
          ),
      ],
    );
  }

  Widget _buildContactsList(
    BuildContext context,
    List<EmployeeContactModel> contacts,
  ) {
    return Column(
      children:
          contacts
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
                    '${contact.relationship.toDisplayString}\nPhone: ${contact.phone}\nAddress: ${contact.address ?? 'N/A'}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildDependantsList(
    BuildContext context,
    List<EmployeeDependantModel> dependants,
  ) {
    return Column(
      children:
          dependants
              .map(
                (dep) => ListTile(
                  leading: Icon(
                    dep.gender == Gender.male
                        ? Icons.male_rounded
                        : Icons.female_rounded,
                    size: 20,
                  ),
                  title: Text(
                    dep.dependantFullName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${dep.relation.toDisplayString} - DOB: ${DateFormat('dd MMM, yyyy').format(dep.birthDate)}\nPhone: ${dep.phoneNumber}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildEducationList(
    BuildContext context,
    List<EmployeeEducationModel> educations,
  ) {
    return Column(
      children:
          educations
              .map(
                (edu) => ListTile(
                  leading: const Icon(Icons.school_outlined, size: 20),
                  title: Text(
                    edu.educationLevel.toDisplayString,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${edu.university.toDisplayString} - ${edu.fieldOfStudy.toDisplayString}\n'
                    '${DateFormat('MMM yyyy').format(edu.startDate)} - ${edu.endDate != null ? DateFormat('MMM yyyy').format(edu.endDate!) : 'Present'}\n'
                    'Status: ${edu.educationStatus.toDisplayString}${edu.cgpa != null ? ", CGPA: ${edu.cgpa}" : ""}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildExperienceList(
    BuildContext context,
    List<EmployeeExperienceModel> experiences,
  ) {
    return Column(
      children:
          experiences
              .map(
                (exp) => ListTile(
                  leading: const Icon(Icons.work_history_outlined, size: 20),
                  title: Text(
                    exp.position ?? 'N/A',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${exp.organization ?? "N/A Organization"} (${exp.organizationType.toDisplayString})\n'
                    '${DateFormat('MMM yyyy').format(exp.joinDate)} - ${exp.separationDate != null ? DateFormat('MMM yyyy').format(exp.separationDate!) : 'Present'}\n'
                    'Proficiency: ${exp.proficiencyLevel.toDisplayString}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildSpouseList(
    BuildContext context,
    List<EmployeeSpouseModel> spouses,
  ) {
    return Column(
      children:
          spouses
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
                    'Title: ${spouse.title}, DOB: ${DateFormat('dd MMM, yyyy').format(spouse.spouseBirthDate)}\n'
                    'Phone: ${spouse.spousePhone ?? 'N/A'}, Occupation: ${spouse.spouseOccupation ?? 'N/A'}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }

  Widget _buildDocumentsList(
    BuildContext context,
    List<EmployeeUploadModel> documents,
  ) {
    return Column(
      children:
          documents
              .map(
                (doc) => ListTile(
                  leading: const Icon(Icons.file_present_rounded, size: 20),
                  title: Text(
                    doc.documentName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Type: ${doc.documentType.toDisplayString}\n'
                    'File: ${doc.filePath != null ? p.basename(doc.filePath!) : (doc.documentFile != null ? p.basename(doc.documentFile!.path) : "N/A")}\n'
                    '${doc.expiryDate != null ? "Expires: ${DateFormat("dd MMM, yyyy").format(doc.expiryDate!)}" : "No Expiry"}',
                  ),
                  isThreeLine: true,
                  dense: true,
                  // onTap: doc.filePath != null ? () { /* TODO: Implement view/download */ } : null,
                ),
              )
              .toList(),
    );
  }

  Widget _buildPerformanceList(
    BuildContext context,
    List<EmployeePerformanceModel> performances,
  ) {
    return Column(
      children:
          performances
              .map(
                (perf) => ListTile(
                  leading: const Icon(Icons.trending_up_rounded, size: 20),
                  title: Text(
                    'Evaluation: ${DateFormat('dd MMM, yyyy').format(perf.evaluationDate)}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Score: ${perf.scorePoint}/100, Rating: ${perf.rating}/5\n'
                    'Evaluator: ${perf.evaluatorName}',
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              )
              .toList(),
    );
  }
}

// Helper widget for consistent key-value display
class _DetailItem extends StatelessWidget {
  final String label;
  final String? value;

  const _DetailItem({required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              value ?? 'N/A',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
