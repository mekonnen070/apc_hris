import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/leave_mgmt/data/leave_repository.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';

part 'leave_notifier.freezed.dart';

final leaveNotifierProvider =
    StateNotifierProvider<LeaveNotifier, LeaveState>(
  (ref) => LeaveNotifier(ref.watch(leaveRepositoryProvider)),
);

@freezed
abstract class LeaveState with _$LeaveState {
  const factory LeaveState({
    @Default([]) List<LeaveBalance> leaveBalances,
    @Default([]) List<LeaveRequest> leaveHistory,
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore,
    @Default(true) bool canFetchMore,
    @Default(1) int page,
    String? errorMessage,
  }) = _LeaveState;
}

class LeaveNotifier extends StateNotifier<LeaveState> {
  final ILeaveRepository _repository;
  final int _pageSize = 10;

  LeaveNotifier(this._repository) : super(const LeaveState());

  Future<void> fetchInitialData() async {
    state = const LeaveState();
    try {
      // Fetch balance and requests in parallel for efficiency
      final results = await Future.wait([
        _repository.getLeaveBalance(),
        _repository.getLeaveRequests(page: 1, pageSize: _pageSize),
      ]);

      final balances = results[0] as List<LeaveBalance>;
      final requests = results[1] as List<LeaveRequest>;

      state = state.copyWith(
        leaveBalances: balances,
        leaveHistory: requests,
        page: 2,
        canFetchMore: requests.length == _pageSize,
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isFetchingMore || !state.canFetchMore) return;
    state = state.copyWith(isFetchingMore: true);
    
    try {
      final newRequests = await _repository.getLeaveRequests(
        page: state.page,
        pageSize: _pageSize,
      );

      state = state.copyWith(
        leaveHistory: [...state.leaveHistory, ...newRequests],
        page: state.page + 1,
        canFetchMore: newRequests.length == _pageSize,
        isFetchingMore: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        isFetchingMore: false,
      );
    }
  }
}