import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_type.freezed.dart';
part 'leave_type.g.dart';

@freezed
abstract class LeaveType with _$LeaveType {
  const factory LeaveType({
    required int leaveTypeId,
    required String leaveTypeName,
    required bool isPaid,
    required int maximumDays,
  }) = _LeaveType;

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);
}