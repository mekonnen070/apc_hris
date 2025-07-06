import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/leave_request_status.dart';

part 'leave_request_edit.freezed.dart';
part 'leave_request_edit.g.dart';

@freezed
abstract class LeaveRequestEdit with _$LeaveRequestEdit {
  factory LeaveRequestEdit({
    required int leaveRequestId,
    required String leaveTypeId,
    required String employeeId,
    required DateTime startDate,
    required DateTime endDate,
    required int numOfDays,
    required String requestReason,
    required DateTime requestDate,
    required LeaveRequestStatus requestStatus,
    String? comment,
    String? approvedBy,
    String? rejectedBy,
    DateTime? actionedDate,
  }) = _LeaveRequestEdit;

  factory LeaveRequestEdit.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestEditFromJson(json);
}