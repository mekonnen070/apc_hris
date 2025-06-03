import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_recruitment/application/notifiers/application_form_notifier.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/application_form_state.dart';

// Family provider because the notifier needs the vacancyId for which the application is being made.
final applicationFormNotifierProvider = StateNotifierProvider.autoDispose
    .family<ApplicationFormNotifier, ApplicationFormState, String>((
      ref,
      vacancyId,
    ) {
      // TODO: When you have an API service, inject it here:
      // final apiService = ref.watch(yourApplicationApiServiceProvider);
      // return ApplicationFormNotifier(ref, vacancyId, apiService);
      return ApplicationFormNotifier(ref, vacancyId);
    });
