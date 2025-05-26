import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'employee_creation_notifier.dart';
import 'employee_creation_state.dart';
// TODO: Import and provide your actual API service if needed

final employeeCreationNotifierProvider = StateNotifierProvider.autoDispose<
  EmployeeCreationNotifier,
  EmployeeCreationState
>((ref) {
  // final apiService = ref.watch(yourApiServiceProvider);
  // return EmployeeCreationNotifier(apiService);
  return EmployeeCreationNotifier(); // AutoDispose will clear state when provider is no longer listened to.
  // If you want to preserve state across UI (e.g. if admin leaves page and comes back)
  // remove .autoDispose or use a different type of provider.
  // For a creation form, .autoDispose is often good to start fresh.
});
