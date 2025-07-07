import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

final myPlacementApplicationsNotifierProvider =
    StateNotifierProvider.autoDispose<
      MyPlacementApplicationsNotifier,
      AsyncValue<List<PlacementApplicant>>
    >((ref) {
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
    fetchMyApplications();
  }

  Future<void> fetchMyApplications() async {
    state = const AsyncValue.loading();
    if (_employeeId == null) {
      state = AsyncValue.error('User not logged in.', StackTrace.current);
      return;
    }
    try {
      final applications = await _repository.getMyApplications(
        employeeId: _employeeId,
      );
      state = AsyncValue.data(applications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteApplication(int applicationId) async {
    final previousState = state;
    // Optimistic UI update for a snappy feel
    state = state.whenData(
      (applications) =>
          applications
              .where((app) => app.applicantId != applicationId)
              .toList(),
    );
    try {
      await _repository.deletePlacementApplication(id: applicationId);
    } catch (e) {
      state = previousState; // Revert on error
      rethrow;
    }
  }
}
