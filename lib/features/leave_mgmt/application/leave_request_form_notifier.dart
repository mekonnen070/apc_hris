import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/leave_mgmt/data/leave_repository.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

part 'leave_request_form_notifier.freezed.dart';

final leaveRequestFormNotifierProvider =
    StateNotifierProvider<LeaveRequestFormNotifier, LeaveRequestFormState>(
  (ref) => LeaveRequestFormNotifier(ref.watch(leaveRepositoryProvider)),
);

@freezed
abstract class LeaveRequestFormState with _$LeaveRequestFormState {
  const factory LeaveRequestFormState({
    @Default(true) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default([]) List<LeaveType> leaveTypes,
    @Default([]) List<LeaveBalance> leaveBalances,
    String? errorMessage,
    String? successMessage,
  }) = _LeaveRequestFormState;
}

class LeaveRequestFormNotifier extends StateNotifier<LeaveRequestFormState> {
  final ILeaveRepository _repository;

  LeaveRequestFormNotifier(this._repository) : super(const LeaveRequestFormState());

  Future<void> initialize() async {
    state = const LeaveRequestFormState();
    try {
      final results = await Future.wait([
        _repository.getLeaveTypes(),
        _repository.getLeaveBalance(),
      ]);
      state = state.copyWith(
        leaveTypes: results[0] as List<LeaveType>,
        leaveBalances: results[1] as List<LeaveBalance>,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> submitRequest({
    required LeaveType leaveType,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
  }) async {
    state = state.copyWith(isSubmitting: true, successMessage: null, errorMessage: null);

    final balance = state.leaveBalances.firstWhere(
      (b) => b.leaveTypeId == leaveType.leaveTypeName,
      orElse: () => LeaveBalance(
        leaveBalanceId: 0, 
        employeeId: '', 
        leaveTypeId: leaveType.leaveTypeName, 
        budgetYear: DateTime.now().year, 
        totalDays: leaveType.maximumDays, 
        usedDays: 0
      ),
    );

    final requestedDays = endDate.difference(startDate).inDays + 1;
    final availableDays = balance.totalDays - balance.usedDays;
    
    if (requestedDays <= 0) {
       state = state.copyWith(
        errorMessage: 'End date must be the same as or after the start date.',
        isSubmitting: false,
      );
      return;
    }

    if (requestedDays > availableDays) {
      state = state.copyWith(
        errorMessage: 'Requested days ($requestedDays) exceed available balance ($availableDays).',
        isSubmitting: false,
      );
      return;
    }

    try {
      final request = LeaveRequest(
        leaveRequestId: 0,
        leaveTypeId: leaveType.leaveTypeName,
        employeeId: '', // Should be fetched from auth state
        startDate: startDate,
        endDate: endDate,
        numOfDays: requestedDays,
        requestReason: reason,
      );
      await _repository.createLeaveRequest(request);
      state = state.copyWith(isSubmitting: false, successMessage: 'Leave request submitted successfully.');
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
  
  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
  }
}