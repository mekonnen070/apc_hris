// [log] [{typeId: L01, typeName: Annual Leave, minimumLeave: 20, increment: 1, incrementingByYear: 1, maximumLeave: 30, enabled: true, entryBy: Peeragetech@gmail.com, entryDate: 0001-01-01T00:00:00, leaves: []}]

// ignore the foreign keys

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
