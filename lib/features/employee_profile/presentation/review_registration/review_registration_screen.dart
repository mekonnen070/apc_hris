import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/application/registration_providers.dart';
import 'package:police_com/features/employee_profile/presentation/review_registration/widgets/review_section_card.dart'; // For date formatting

class ReviewRegistrationScreen extends HookConsumerWidget {
  const ReviewRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrationScreenState = ref.watch(registrationNotifierProvider);
    final formData = registrationScreenState.formData;
    final isSubmitting = registrationScreenState.isSubmitting;
    // Error message can be displayed via SnackBar or directly on the UI if needed
    // final errorMessage = registrationScreenState.errorMessage;

    void handleSubmit() async {
      final success =
          await ref
              .read(registrationNotifierProvider.notifier)
              .submitRegistrationForm();
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Application Submitted Successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        // TODO: Navigate to a dedicated success screen or clear form and navigate to home
        // Example: Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => ApplicationSuccessScreen()), (route) => false);
        // ref.read(registrationNotifierProvider.notifier).resetForm(); // Optionally reset
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ref.read(registrationNotifierProvider).errorMessage ??
                  'Submission Failed. Please try again.',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }

    // Helper to navigate, assuming you have a way to manage current step or directly navigate
    void navigateToEditSection(String sectionRouteName, {Object? arguments}) {
      print('Navigate to edit: $sectionRouteName');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Conceptual navigation to edit $sectionRouteName.'),
        ),
      );
    }

    // --- Personal Info Content Builder ---
    Widget buildPersonalInfoContent() {
      final personalInfo = formData.personalInfo;
      if (personalInfo == null) {
        return const Text(
          'Personal information not yet provided.',
          style: TextStyle(fontStyle: FontStyle.italic),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewDetailItem(label: 'Full Name', value: personalInfo.fullName),
          ReviewDetailItem(label: 'Address', value: personalInfo.address),
          ReviewDetailItem(
            label: 'Phone Number',
            value: personalInfo.phoneNumber,
          ),
          ReviewDetailItem(label: 'Email', value: personalInfo.email),
          ReviewDetailItem(
            label: 'Date of Birth',
            value:
                personalInfo.dateOfBirth != null
                    ? DateFormat(
                      'dd MMM, yyyy',
                    ).format(personalInfo.dateOfBirth!)
                    : 'N/A',
          ),
          ReviewDetailItem(
            label: 'Gender',
            value: personalInfo.gender ?? 'N/A',
          ),
          ReviewDetailItem(
            label: 'Marital Status',
            value: personalInfo.maritalStatus ?? 'N/A',
          ),
        ],
      );
    }

    // --- Academic Qualifications Content Builder ---
    Widget buildAcademicQualificationsContent() {
      final qualifications = formData.academicQualifications;
      if (qualifications.isEmpty) {
        return const Text(
          'No academic qualifications provided.',
          style: TextStyle(fontStyle: FontStyle.italic),
        );
      }
      return Column(
        children:
            qualifications
                .map(
                  (qual) => ListTile(
                    leading: const Icon(Icons.book_outlined, size: 20),
                    title: Text(
                      qual.degreeOrCertificate,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "${qual.institutionName}\nField: ${qual.fieldOfStudy}\nGraduated: ${qual.graduationDate != null ? DateFormat('yyyy').format(qual.graduationDate!) : 'N/A'}\nCertificate: ${qual.certificateFile?.path.split('/').last ?? qual.certificateUrl ?? 'Not uploaded'}",
                    ),
                    dense: true,
                    isThreeLine: true,
                  ),
                )
                .toList(),
      );
    }

    // --- Work Experience Content Builder ---
    Widget buildWorkExperienceContent() {
      final experiences = formData.workExperiences;
      if (experiences.isEmpty) {
        return const Text(
          'No work experience provided.',
          style: TextStyle(fontStyle: FontStyle.italic),
        );
      }
      return Column(
        children:
            experiences.map((exp) {
              String dateRange = DateFormat('MMM yyyy').format(exp.startDate);
              dateRange +=
                  " - ${exp.endDate != null ? DateFormat('MMM yyyy').format(exp.endDate!) : 'Present'}";
              return ListTile(
                leading: const Icon(Icons.business_center_outlined, size: 20),
                title: Text(
                  exp.jobTitle,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "${exp.companyName}\n$dateRange\nLetter: ${exp.experienceLetterFile?.path.split('/').last ?? exp.experienceLetterUrl ?? 'Not uploaded'}",
                ),
                dense: true,
                isThreeLine: true,
              );
            }).toList(),
      );
    }

    // --- Documents Content Builder ---
    Widget buildDocumentsContent() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewDetailItem(
            label: 'CV/Resume',
            value: formData.cvFile?.path.split('/').last ?? 'Not provided',
          ),
          ReviewDetailItem(
            label: 'National ID',
            value:
                formData.nationalIdFile?.path.split('/').last ?? 'Not provided',
          ),
          if (formData.otherDocuments.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
              child: Text(
                'Other Supporting Documents:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...formData.otherDocuments.map(
              (doc) => ListTile(
                leading: const Icon(Icons.insert_drive_file_outlined, size: 20),
                title: Text(
                  doc.documentDescription,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  doc.documentFile?.path.split('/').last ??
                      doc.documentUrl ??
                      'File not attached',
                ),
                dense: true,
                contentPadding: const EdgeInsets.only(),
              ),
            ),
          ] else
            const ReviewDetailItem(
              label: 'Other Documents',
              value: 'None provided',
            ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Your Application'),
        leading: IconButton(
          // Back button to allow going back in the multi-step form
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Please review all the information you have provided carefully before submitting.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            ReviewSectionCard(
              sectionTitle: 'Personal Information',
              sectionIcon: Icons.person_search_outlined,
              content: buildPersonalInfoContent(),
              onEditPressed:
                  () => navigateToEditSection(
                    'personal_info_screen',
                  ), // Use actual route names or indices
            ),
            ReviewSectionCard(
              sectionTitle: 'Academic Qualifications',
              sectionIcon: Icons.school_outlined,
              content: buildAcademicQualificationsContent(),
              onEditPressed:
                  () => navigateToEditSection('academic_qualifications_screen'),
            ),
            ReviewSectionCard(
              sectionTitle: 'Work Experience',
              sectionIcon: Icons.work_history_outlined,
              content: buildWorkExperienceContent(),
              onEditPressed:
                  () => navigateToEditSection('work_experience_screen'),
            ),
            ReviewSectionCard(
              sectionTitle: 'Uploaded Documents',
              sectionIcon: Icons.folder_copy_outlined,
              content: buildDocumentsContent(),
              onEditPressed:
                  () => navigateToEditSection('general_documents_screen'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16.0),
        child: ElevatedButton.icon(
          icon:
              isSubmitting
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                  : const Icon(Icons.check_circle_outline),
          label: Text(
            isSubmitting ? 'Submitting...' : 'Confirm & Submit Application',
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: isSubmitting ? null : handleSubmit,
        ),
      ),
    );
  }
}
