import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/data/profile_repository.dart';

/// A global provider that holds the profile information of the currently
/// authenticated employee.
///
/// Widgets across the app can watch this provider to get user details without
/// needing to know the employee's ID. It automatically fetches data when a user
/// logs in and clears it on logout.
final currentEmployeeProvider =
    AsyncNotifierProvider<CurrentEmployeeNotifier, EmployeeInfoModel?>(
      CurrentEmployeeNotifier.new,
    );

class CurrentEmployeeNotifier extends AsyncNotifier<EmployeeInfoModel?> {
  @override
  FutureOr<EmployeeInfoModel?> build() {
    // Watch the currentEmployeeIdProvider. If the ID changes (login/logout),
    // this build method will re-run.
    final employeeId = ref.watch(currentEmployeeIdProvider);

    // If there is no employee ID, there is no user to fetch.
    if (employeeId == null) {
      return null;
    }

    // If we have an ID, fetch the corresponding employee profile.
    final profileRepo = ref.watch(profileRepositoryProvider);
    return profileRepo.getEmployeeProfile(employeeId: employeeId);
  }
}
