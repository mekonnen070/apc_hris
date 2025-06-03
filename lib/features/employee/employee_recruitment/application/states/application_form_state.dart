import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/applicant_apply_model.dart';

part 'application_form_state.freezed.dart';

@freezed
abstract class ApplicationFormState with _$ApplicationFormState {
  const factory ApplicationFormState({
    // The application data being built by the user.
    required ApplicantApplyModel applicationData,
    // True if the form is currently being submitted to the backend.
    @Default(false) bool isSubmitting,
    // Any error message from the last submission attempt.
    String? errorMessage,
    // Message for successful submission.
    String? successMessage,
    // To track the picked resume file locally before upload.
    File? pickedResumeFile,
  }) = _ApplicationFormState;
}
