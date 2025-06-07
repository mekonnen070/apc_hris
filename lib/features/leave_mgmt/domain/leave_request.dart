import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';

part 'leave_request.freezed.dart';
part 'leave_request.g.dart';

@freezed
abstract class LeaveRequest with _$LeaveRequest {
  const factory LeaveRequest({
    required int leaveRequestId,
    required String leaveTypeId,
    required String employeeId,
    required DateTime startDate,
    required DateTime endDate,
    required int numOfDays,
    String? requestReason,
    @Default(LeaveRequestStatus.pending) LeaveRequestStatus requestStatus,
    String? comment,
    DateTime? actionedDate,
  }) = _LeaveRequest;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestFromJson(json);
}