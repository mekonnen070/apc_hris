import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/leave_mgmt/data/leave_repository.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

part 'leave_notifier.freezed.dart';

final leaveNotifierProvider =
    StateNotifierProvider.autoDispose<LeaveNotifier, LeaveState>(
  (ref) => LeaveNotifier(ref),
);

@freezed
abstract class LeaveState with _$LeaveState {
  const factory LeaveState({
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore,
    @Default(true) bool canFetchMore,
    @Default(1) int page,
    String? errorMessage,
    @Default([]) List<LeaveBalance> leaveBalances,
    @Default([]) List<LeaveRequest> leaveHistory,
    @Default([]) List<LeaveType> leaveTypes,
  }) = _LeaveState;
}

class LeaveNotifier extends StateNotifier<LeaveState> {
  final Ref _ref;
  final int _pageSize = 10;

  LeaveNotifier(this._ref) : super(const LeaveState()) {
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    state = const LeaveState();
    final employeeId = _ref.read(currentEmployeeIdProvider);
    if (employeeId == null) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'User not authenticated.',
      );
      return;
    }

    try {
      final repository = _ref.read(leaveRepositoryProvider);
      // Fetch all required data in parallel for maximum efficiency
      final results = await Future.wait([
        repository.getLeaveBalanceByEmployee(employeeId: employeeId),
        repository.getLeaveRequests(page: 1, pageSize: _pageSize),
        repository.getLeaveTypes(),
      ]);

      final balances = results[0] as List<LeaveBalance>;
      final requests = results[1] as List<LeaveRequest>;
      final types = results[2] as List<LeaveType>;

      state = state.copyWith(
        leaveBalances: balances,
        leaveHistory: requests,
        leaveTypes: types,
        page: 2,
        canFetchMore: requests.length == _pageSize,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isFetchingMore || !state.canFetchMore) return;
    state = state.copyWith(isFetchingMore: true);

    try {
      final repository = _ref.read(leaveRepositoryProvider);
      final newRequests = await repository.getLeaveRequests(
        page: state.page,
        pageSize: _pageSize,
      );

      state = state.copyWith(
        leaveHistory: [...state.leaveHistory, ...newRequests],
        page: state.page + 1,
        canFetchMore: newRequests.length == _pageSize,
        isFetchingMore: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isFetchingMore: false);
    }
  }
}
