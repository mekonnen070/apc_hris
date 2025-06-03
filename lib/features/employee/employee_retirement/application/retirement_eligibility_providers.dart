// lib/features/employee_profile/application/a
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_retirement/application/retirement_eligibility_notifier.dart';
import 'package:police_com/features/employee/employee_retirement/application/retirement_eligibility_state.dart';

final retirementEligibilityNotifierProvider = StateNotifierProvider.autoDispose<
    RetirementEligibilityNotifier, RetirementEligibilityState>(
  (ref) => RetirementEligibilityNotifier(),
);
