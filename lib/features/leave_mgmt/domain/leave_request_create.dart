import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_request_create.freezed.dart';
part 'leave_request_create.g.dart';

@freezed
abstract class LeaveRequestCreate with _$LeaveRequestCreate {
  factory LeaveRequestCreate({
    required String leaveTypeId,
    required String employeeId,
    required DateTime startDate,
    required DateTime endDate,
    required int numOfDays,
    required String requestReason,
    required DateTime requestDate,
  }) = _LeaveRequestCreate;

  factory LeaveRequestCreate.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestCreateFromJson(json);
}
