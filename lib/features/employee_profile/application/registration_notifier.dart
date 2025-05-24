import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/domain/academic_qualification.dart';
import 'package:police_com/features/employee_profile/domain/general_document.dart';
import 'package:police_com/features/employee_profile/domain/personal_info.dart';
import 'package:police_com/features/employee_profile/domain/work_experience.dart';

import 'registration_screen_state.dart';

class RegistrationNotifier extends StateNotifier<RegistrationScreenState> {
  // final YourApiService _apiService; // TODO: Inject your API service

  RegistrationNotifier(/*this._apiService*/)
    : super(const RegistrationScreenState());

  // --- Update methods for each piece of data ---

  void updatePersonalInfo(PersonalInfo info) {
    state = state.copyWith(
      formData: state.formData.copyWith(personalInfo: info),
    );
  }

  void addAcademicQualification(AcademicQualification qual) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        academicQualifications: [
          ...state.formData.academicQualifications,
          qual,
        ],
      ),
    );
  }

  void updateAcademicQualification(AcademicQualification qualToUpdate) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        academicQualifications:
            state.formData.academicQualifications
                .map((q) => q.id == qualToUpdate.id ? qualToUpdate : q)
                .toList(),
      ),
    );
  }

  void deleteAcademicQualification(String qualId) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        academicQualifications:
            state.formData.academicQualifications
                .where((q) => q.id != qualId)
                .toList(),
      ),
    );
  }

  void addWorkExperience(WorkExperience exp) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        workExperiences: [...state.formData.workExperiences, exp],
      ),
    );
  }

  void updateWorkExperience(WorkExperience expToUpdate) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        workExperiences:
            state.formData.workExperiences
                .map((exp) => exp.id == expToUpdate.id ? expToUpdate : exp)
                .toList(),
      ),
    );
  }

  void deleteWorkExperience(String expId) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        workExperiences:
            state.formData.workExperiences
                .where((exp) => exp.id != expId)
                .toList(),
      ),
    );
  }

  void setCVFile(File? file) {
    state = state.copyWith(formData: state.formData.copyWith(cvFile: file));
  }

  void setNationalIdFile(File? file) {
    state = state.copyWith(
      formData: state.formData.copyWith(nationalIdFile: file),
    );
  }

  void addOtherDocument(GeneralDocument doc) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        otherDocuments: [...state.formData.otherDocuments, doc],
      ),
    );
  }

  void updateOtherDocument(GeneralDocument docToUpdate) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        otherDocuments:
            state.formData.otherDocuments
                .map((d) => d.id == docToUpdate.id ? docToUpdate : d)
                .toList(),
      ),
    );
  }

  void deleteOtherDocument(String docId) {
    state = state.copyWith(
      formData: state.formData.copyWith(
        otherDocuments:
            state.formData.otherDocuments.where((d) => d.id != docId).toList(),
      ),
    );
  }

  // --- Submission Logic ---
  Future<bool> submitRegistrationForm() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    // Basic validation example (you'll need more comprehensive checks)
    if (state.formData.personalInfo == null) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Personal information is missing.',
      );
      return false;
    }
    if (state.formData.cvFile == null) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'CV/Resume is missing.',
      );
      return false;
    }
    if (state.formData.nationalIdFile == null) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'National ID is missing.',
      );
      return false;
    }

    try {
      // TODO: Implement the actual multi-part request for file uploads
      // and the main data submission.
      // This will likely involve:
      // 1. Uploading state.formData.cvFile, getting back a URL/ID.
      // 2. Uploading state.formData.nationalIdFile, getting back a URL/ID.
      // 3. Uploading each file in state.formData.otherDocuments[i].documentFile.
      // 4. Constructing the final JSON payload with URLs/IDs for documents and other form data.
      // 5. Sending the JSON payload to your backend.
      // Example: await _apiService.submitProfileData(state.formData, uploadedFileUrls);

      print('Submitting Form Data: ${state.formData}');
      await Future.delayed(const Duration(seconds: 3)); // Simulate API call

      // On successful submission:
      state = state.copyWith(isSubmitting: false);
      // Consider resetting the form or navigating, e.g. by exposing a submissionSuccess flag
      // resetForm(); // Optional: if you want to clear data after submission
      return true;
    } catch (e) {
      print('Submission error: $e');
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Submission failed: ${e.toString()}',
      );
      return false;
    }
  }

  void resetForm() {
    state = const RegistrationScreenState(); // Resets to initial empty state
  }
}
