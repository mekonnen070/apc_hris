import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_balance.freezed.dart';
part 'leave_balance.g.dart';

@freezed
abstract class LeaveBalance with _$LeaveBalance {
  const factory LeaveBalance({
    required int leaveBalanceId,
    required String employeeId,
    required String leaveTypeId,
    required int budgetYear,
    required int totalDays,
    required int usedDays,
    required int balance,
  }) = _LeaveBalance;

  factory LeaveBalance.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceFromJson(json);
}
