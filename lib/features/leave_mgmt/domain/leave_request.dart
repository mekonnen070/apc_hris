import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/leave_request_status.dart';

part 'leave_request.freezed.dart';
part 'leave_request.g.dart';

@freezed
abstract class LeaveRequest with _$LeaveRequest {
  factory LeaveRequest({
    int? leaveRequestId,
    required String leaveTypeId,
    required String employeeId,
    required DateTime startDate,
    required DateTime endDate,
    required int numOfDays,
    String? requestReason,
    required DateTime requestDate,
    required LeaveRequestStatus requestStatus,
    String? comment,
    DateTime? actionedDate,
    String? approvedBy,
    String? rejectedBy,
  }) = _LeaveRequest;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestFromJson(json);
}
