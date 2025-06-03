// lib/features/recruitment/application/onboarding_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/applicant_apply_model.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/onboarding_task_model.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    // The applicant whose onboarding process is being managed.
    // Could be just applicantId, or the full ApplicantApplyModel if useful.
    required String applicantId, 
    ApplicantApplyModel? applicantDetails, // Optional: if we need to display some applicant info alongside tasks

    // List of onboarding tasks for this applicant.
    @Default([]) List<OnboardingTaskModel> tasks,
    
    // True if tasks are being fetched or an update is in progress.
    @Default(false) bool isLoading,
    // Error message if fetching or updating tasks fails.
    String? errorMessage,
    // Success message for operations like task completion.
    String? successMessage,

  }) = _OnboardingState;
}
