// lib/features/employee_profile/application/retirement_eligibility_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_retirement/application/retirement_eligibility_state.dart';

class RetirementEligibilityNotifier
    extends StateNotifier<RetirementEligibilityState> {
  static const int defaultRetirementAge = 60; // Standard retirement age

  RetirementEligibilityNotifier() : super(const RetirementEligibilityState());

  void updateDateOfBirth(DateTime? dob) {
    state = state.copyWith(
      dateOfBirth: dob,
      isEligible: null,
      eligibilityMessage: null,
      calculatedAge: null,
      errorMessage: null,
    );
  }

  void updateCustomRetirementAge(String? ageString) {
    if (ageString == null || ageString.isEmpty) {
      state = state.copyWith(
        customRetirementAge: null,
        isEligible: null,
        eligibilityMessage: null,
        calculatedAge: null,
        errorMessage: null,
      );
      return;
    }
    final age = int.tryParse(ageString);
    if (age != null && age > 0) {
      state = state.copyWith(
        customRetirementAge: age,
        isEligible: null,
        eligibilityMessage: null,
        calculatedAge: null,
        errorMessage: null,
      );
    } else {
      state = state.copyWith(
        customRetirementAge: null,
        isEligible: null,
        eligibilityMessage: null,
        calculatedAge: null,
        errorMessage: 'Invalid age entered.',
      );
    }
  }

  void checkEligibility() {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      eligibilityMessage: null,
      isEligible: null,
      calculatedAge: null,
    );

    if (state.dateOfBirth == null) {
      state = state.copyWith(
        isLoading: false,
        eligibilityMessage: 'Please select a valid date of birth.',
        isEligible: false,
      );
      return;
    }

    final dob = state.dateOfBirth!;
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    if (age < 0) {
      state = state.copyWith(
        isLoading: false,
        calculatedAge: age,
        eligibilityMessage: 'Date of birth cannot be in the future.',
        isEligible: false,
      );
      return;
    }

    final retirementAgeToUse =
        state.customRetirementAge ?? defaultRetirementAge;

    if (age >= retirementAgeToUse) {
      state = state.copyWith(
        isLoading: false,
        calculatedAge: age,
        isEligible: true,
        eligibilityMessage: 'Eligible for retirement. Current Age: $age.',
      );
    } else {
      final yearsRemaining = retirementAgeToUse - age;
      state = state.copyWith(
        isLoading: false,
        calculatedAge: age,
        isEligible: false,
        eligibilityMessage:
            'Not eligible. Current Age: $age. Years remaining: $yearsRemaining.',
      );
    }
  }

  void resetCalculator() => state = const RetirementEligibilityState();
}
