import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/clearance/data/clearance_repository.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';
import 'package:police_com/features/clearance/domain/clearance_request_create.dart';

final clearanceNotifierProvider = StateNotifierProvider.autoDispose<
  ClearanceNotifier,
  AsyncValue<List<ClearanceRequest>>
>((ref) {
  final employeeId = ref.watch(currentEmployeeIdProvider);
  return ClearanceNotifier(ref.watch(clearanceRepositoryProvider), employeeId);
});

class ClearanceNotifier
    extends StateNotifier<AsyncValue<List<ClearanceRequest>>> {
  final IClearanceRepository _repository;
  final String? _employeeId;

  ClearanceNotifier(this._repository, this._employeeId)
    : super(const AsyncValue.loading()) {
    fetchMyRequests();
  }

  Future<void> fetchMyRequests({bool isRefresh = false}) async {
    if (!isRefresh) {
      state = const AsyncValue.loading();
    }
    if (_employeeId == null) {
      state = AsyncValue.error('User not logged in', StackTrace.current);
      return;
    }
    try {
      final requests = await _repository.getMyClearanceRequests(
        employeeId: _employeeId,
      );
      state = AsyncValue.data(requests);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createRequest(ClearanceRequestCreate request) async {
    try {
      await _repository.createClearanceRequest(request);
      await fetchMyRequests(
        isRefresh: true,
      ); // Refetch the list to show the new item
    } catch (e) {
      // The error is re-thrown to be handled by the UI
      rethrow;
    }
  }

  Future<void> deleteRequest(String requestId) async {
    final previousState = state;
    // Optimistically remove the item for a snappy UI response
    state = state.whenData(
      (requests) =>
          requests.where((req) => req.requestId != requestId).toList(),
    );
    try {
      await _repository.deleteClearanceRequest(requestId: requestId);
    } catch (e) {
      // If the API call fails, revert the state
      state = previousState;
      rethrow;
    }
  }
}
