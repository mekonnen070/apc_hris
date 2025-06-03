// lib/features/employee_profile/application/retirement_eligibility_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retirement_eligibility_state.freezed.dart';

@freezed
abstract class RetirementEligibilityState with _$RetirementEligibilityState {
  const factory RetirementEligibilityState({
    DateTime? dateOfBirth,
    int? customRetirementAge, // User can override the default
    int? calculatedAge,
    bool? isEligible,
    String? eligibilityMessage,
    @Default(false) bool isLoading,
    String? errorMessage, // For errors like invalid input not caught by form
  }) = _RetirementEligibilityState;
}
