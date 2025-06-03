// lib/features/recruitment/application/onboarding_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_recruitment/application/notifiers/onboarding_notifier.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/onboarding_state.dart';

// Family provider because the OnboardingNotifier needs the applicantId
// to manage tasks for a specific individual.
final onboardingNotifierProvider = StateNotifierProvider.autoDispose
    .family<OnboardingNotifier, OnboardingState, String>((ref, applicantId) {
      // TODO: When you have an API service, inject it here:
      // final apiService = ref.watch(yourOnboardingApiServiceProvider);
      // return OnboardingNotifier(ref, applicantId, apiService);
      return OnboardingNotifier(ref, applicantId);
    });
