import 'package:hooks_riverpod/hooks_riverpod.dart';

// Manages the current step index in the multi-step "Add New Employee" flow.
final currentEmployeeCreationStepProvider = StateProvider.autoDispose<int>(
  (ref) => 0,
);
