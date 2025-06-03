import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/identification_type.dart';
import 'package:police_com/core/enums/recruitment_status.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/application_form_state.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/applicant_apply_model.dart';

class ApplicationFormNotifier extends StateNotifier<ApplicationFormState> {
  final AutoDisposeStateNotifierProviderRef _ref;
  final String _vacancyId;

  // TODO: Inject actual API service for submitting application and uploading files.
  // final YourApplicationApiService _apiService;

  ApplicationFormNotifier(this._ref, this._vacancyId /*, this._apiService*/)
    : super(
        ApplicationFormState(
          applicationData: ApplicantApplyModel(
            appliedToVacancyId: _vacancyId,
            firstName: '',
            lastName: '',
            email: '',
            phoneNumber: '',
            dateOfBirth: DateTime.now().subtract(
              const Duration(days: 365 * 20),
            ), // Default age 20
            gender: Gender.male, // Default, UI can change
            address: '',
            nationality: 'Ethiopian', // Default, can be a dropdown later
            entryDate: DateTime.now(),
          ),
        ),
      );

  void updateField({
    String? firstName,
    String? lastName,
    String? middleName,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? nationality,
    String? identificationNumber,
    IdentificationType? identificationType,
  }) {
    state = state.copyWith(
      applicationData: state.applicationData.copyWith(
        firstName: firstName ?? state.applicationData.firstName,
        lastName: lastName ?? state.applicationData.lastName,
        middleName: middleName ?? state.applicationData.middleName,
        email: email ?? state.applicationData.email,
        phoneNumber: phoneNumber ?? state.applicationData.phoneNumber,
        dateOfBirth: dateOfBirth ?? state.applicationData.dateOfBirth,
        gender: gender ?? state.applicationData.gender,
        address: address ?? state.applicationData.address,
        nationality: nationality ?? state.applicationData.nationality,
        identificationNumber:
            identificationNumber ?? state.applicationData.identificationNumber,
        identificationType:
            identificationType ?? state.applicationData.identificationType,
      ),
      errorMessage: null, // Clear error on field update
      successMessage: null,
    );
  }

  Future<void> pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      state = state.copyWith(pickedResumeFile: File(result.files.single.path!));
    } else {
      // User canceled the picker or no path available
      state = state.copyWith(pickedResumeFile: null);
    }
  }

  void clearPickedResume() {
    state = state.copyWith(pickedResumeFile: null);
  }

  Future<bool> submitApplication() async {
    final link = _ref.keepAlive();
    state = state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    );

    // --- TODO: Implement actual API submission logic ---
    // 1. Upload resumeFile if state.pickedResumeFile is not null
    //    String? uploadedResumePath;
    //    if (state.pickedResumeFile != null) {
    //      try {
    //        // uploadedResumePath = await _apiService.uploadResume(state.pickedResumeFile!, state.applicationData.email); // Example
    //        await Future.delayed(Duration(seconds: 1)); // Simulate upload
    //        uploadedResumePath = "uploads/resumes/mock_${state.pickedResumeFile!.path.split('/').last}";
    //      } catch (e) {
    //        state = state.copyWith(isSubmitting: false, errorMessage: "Resume upload failed: ${e.toString()}");
    //        link.close();
    //        return false;
    //      }
    //    }

    // For mock, directly use the picked file info if needed or just simulate success
    String? mockResumePath;
    if (state.pickedResumeFile != null) {
      mockResumePath =
          "uploads/resumes/mock_${state.pickedResumeFile!.path.split('/').last}";
    }

    // 2. Prepare final application data
    final finalApplicationData = state.applicationData.copyWith(
      resumePath: mockResumePath, // Use uploadedResumePath in real scenario
      entryDate: DateTime.now(), // Ensure entry date is current
      status: RecruitmentStatus.submitted, // Set status
    );

    try {
      debugPrint(
        'Submitting Application Data: ${finalApplicationData.toJson()}',
      );
      // await _apiService.submitApplication(finalApplicationData);
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      state = state.copyWith(
        isSubmitting: false,
        successMessage:
            'Application submitted successfully for vacancy $_vacancyId!',
        // Optionally reset form or part of it:
        // applicationData: ApplicantApplyModel(appliedToVacancyId: _vacancyId, ...initial fields...),
        // pickedResumeFile: null,
      );
      link.close();
      return true;
    } catch (e) {
      debugPrint('Application submission error: $e');
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to submit application: ${e.toString()}',
      );
      link.close();
      return false;
    }
  }
}
