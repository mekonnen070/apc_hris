import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_type.freezed.dart';
part 'leave_type.g.dart';

@freezed
abstract class LeaveType with _$LeaveType {
  factory LeaveType({
    required String typeId,
    required String typeName,
    required int minimumLeave,
    required int increment,
    required int incrementingByYear,
    required int maximumLeave,
    required bool enabled,
    required String entryBy,
    required DateTime entryDate,
    required List<dynamic> leaves,
  }) = _LeaveType;

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);
}
