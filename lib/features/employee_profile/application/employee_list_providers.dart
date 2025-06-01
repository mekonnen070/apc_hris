import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'employee_list_notifier.dart';
import 'employee_list_state.dart';

// TODO: Define and provide your actual IEmployeeRepository implementation
// final employeeRepositoryProvider = Provider<IEmployeeRepository>((ref) => MockEmployeeRepository());

final employeeListNotifierProvider =
    StateNotifierProvider.autoDispose<EmployeeListNotifier, EmployeeListState>((
      ref,
    ) {
      // final repo = ref.watch(employeeRepositoryProvider);
      // return EmployeeListNotifier(repo);
      return EmployeeListNotifier(); // Using mock data within notifier for now
    });
