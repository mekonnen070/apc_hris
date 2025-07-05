import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

final myPlacementApplicationsNotifierProvider =
    StateNotifierProvider.autoDispose<
      MyPlacementApplicationsNotifier,
      AsyncValue<List<PlacementApplicant>>
    >((ref) {
      // Fetches the employeeId from the current authenticated user
      final employeeId = ref.watch(currentEmployeeIdProvider);
      return MyPlacementApplicationsNotifier(
        ref.watch(placementRepositoryProvider),
        employeeId,
      );
    });

class MyPlacementApplicationsNotifier
    extends StateNotifier<AsyncValue<List<PlacementApplicant>>> {
  final IPlacementRepository _repository;
  final String? _employeeId;

  MyPlacementApplicationsNotifier(this._repository, this._employeeId)
    : super(const AsyncValue.loading()) {
    if (_employeeId != null) {
      getMyApplications();
    } else {
      state = AsyncValue.error('Employee not logged in.', StackTrace.current);
    }
  }

  Future<void> getMyApplications() async {
    state = const AsyncValue.loading();
    try {
      final applications = await _repository.getMyApplications(
        employeeId: _employeeId!,
      );
      state = AsyncValue.data(applications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
