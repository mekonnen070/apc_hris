import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/leave_mgmt/data/leave_repository.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request_create.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_screen_data.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

final leaveNotifierProvider = StateNotifierProvider.autoDispose<
  LeaveNotifier,
  AsyncValue<LeaveScreenData>
>((ref) => LeaveNotifier(ref));

class LeaveNotifier extends StateNotifier<AsyncValue<LeaveScreenData>> {
  final Ref _ref;
  late final ILeaveRepository _repository;
  late final String? _employeeId;

  LeaveNotifier(this._ref) : super(const AsyncValue.loading()) {
    _repository = _ref.read(leaveRepositoryProvider);
    _employeeId = _ref.read(currentEmployeeIdProvider);
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    state = const AsyncValue.loading();
    if (_employeeId == null) {
      state = AsyncValue.error('User not authenticated.', StackTrace.current);
      return;
    }
    try {
      // Fetch all data in parallel
      final results = await Future.wait([
        _repository.getLeaveBalanceByEmployee(employeeId: _employeeId),
        _repository.getLeaveRequests(page: 1, pageSize: 10),
        _repository.getLeaveTypes(),
      ]);

      state = AsyncValue.data(
        LeaveScreenData(
          balances: results[0] as List<LeaveBalance>,
          history: results[1] as List<LeaveRequest>,
          types: results[2] as List<LeaveType>,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createRequest(LeaveRequestCreate request) async {
    await _repository.createLeaveRequest(request);
    await fetchInitialData(); // Refetch all data to ensure consistency
  }

  Future<void> editRequest({
    required int id,
    required LeaveRequestCreate request,
  }) async {
    await _repository.editLeaveRequest(id: id, request: request);
    await fetchInitialData();
  }

  Future<void> deleteRequest(int requestId) async {
    final previousState = state;
    // Optimistic UI update
    state = state.whenData(
      (data) => data.copyWith(
        history:
            data.history
                .where((req) => req.leaveRequestId != requestId)
                .toList(),
      ),
    );
    try {
      await _repository.deleteLeaveRequest(id: requestId);
    } catch (e) {
      state = previousState; // Revert on error
      rethrow;
    }
  }
}
