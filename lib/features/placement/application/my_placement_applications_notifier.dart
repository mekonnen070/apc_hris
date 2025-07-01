import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

/// Provider that fetches and exposes the list of the current user's
/// placement applications.
final myPlacementApplicationsProvider = AutoDisposeAsyncNotifierProvider<
    MyPlacementApplicationsNotifier, List<PlacementApplicant>>(
  MyPlacementApplicationsNotifier.new,
);

class MyPlacementApplicationsNotifier
    extends AutoDisposeAsyncNotifier<List<PlacementApplicant>> {
  @override
  FutureOr<List<PlacementApplicant>> build() {
    final employeeId = ref.watch(currentEmployeeIdProvider);

    if (employeeId == null) {
      // If there's no logged-in user, there are no applications to fetch.
      // Return an empty list to avoid showing an unnecessary error.
      return [];
    }

    return _fetchMyApplications(employeeId);
  }

  Future<List<PlacementApplicant>> _fetchMyApplications(String employeeId) async {
    final repository = ref.read(placementRepositoryProvider);
    return repository.getMyApplications(employeeId: employeeId);
  }
}
