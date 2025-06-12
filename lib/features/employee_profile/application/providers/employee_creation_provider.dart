import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/employee_creation_notifier.dart';
import '../states/employee_creation_state.dart';
// TODO: Import and provide your actual API service if needed

final employeeCreationNotifierProvider = StateNotifierProvider.autoDispose<
  EmployeeCreationNotifier,
  EmployeeCreationState
>((ref) => EmployeeCreationNotifier(ref));
