import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/leave_mgmt/data/leave_repository.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

part 'leave_request_form_notifier.freezed.dart';

final leaveRequestFormNotifierProvider = StateNotifierProvider.autoDispose<
    LeaveRequestFormNotifier, LeaveRequestFormState>(
  (ref) => LeaveRequestFormNotifier(ref),
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
  final Ref _ref;

  LeaveRequestFormNotifier(this._ref) : super(const LeaveRequestFormState()) {
    initialize();
  }

  Future<void> initialize() async {
    state = const LeaveRequestFormState();
    final employeeId = _ref.read(currentEmployeeIdProvider);
    if (employeeId == null) {
      state = state.copyWith(isLoading: false, errorMessage: 'User not authenticated.');
      return;
    }

    try {
      final repository = _ref.read(leaveRepositoryProvider);
      final results = await Future.wait([
        repository.getLeaveTypes(),
        repository.getLeaveBalanceByEmployee(employeeId: employeeId),
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
    final employeeId = _ref.read(currentEmployeeIdProvider);

    final balance = state.leaveBalances.firstWhere(
      (b) => b.leaveTypeId == leaveType.typeId, // Correctly match by typeId
      orElse: () => LeaveBalance(
        leaveBalanceId: 0,
        employeeId: employeeId!,
        leaveTypeId: leaveType.typeId,
        budgetYear: DateTime.now().year,
        totalDays: leaveType.maximumLeave,
        usedDays: 0,
        balance: leaveType.maximumLeave,
      ),
    );

    final requestedDays = endDate.difference(startDate).inDays + 1;
    
    if (requestedDays <= 0) {
      state = state.copyWith(
        errorMessage: 'End date must be the same as or after the start date.',
        isSubmitting: false,
      );
      return;
    }

    if (requestedDays > balance.balance) {
      state = state.copyWith(
        errorMessage: 'Requested days ($requestedDays) exceed available balance (${balance.balance}).',
        isSubmitting: false,
      );
      return;
    }

    try {
      final request = LeaveRequest(
        leaveRequestId: 0,
        leaveTypeId: leaveType.typeId,
        employeeId: employeeId!,
        startDate: startDate,
        endDate: endDate,
        numOfDays: requestedDays,
        requestReason: reason,
      );
      await _ref.read(leaveRepositoryProvider).createLeaveRequest(request);
      state = state.copyWith(isSubmitting: false, successMessage: 'Leave request submitted successfully.');
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
  
  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
  }
}
