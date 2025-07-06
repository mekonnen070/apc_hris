// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_edit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveRequestEdit _$LeaveRequestEditFromJson(Map<String, dynamic> json) =>
    _LeaveRequestEdit(
      leaveRequestId: (json['leaveRequestId'] as num).toInt(),
      leaveTypeId: json['leaveTypeId'] as String,
      employeeId: json['employeeId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      numOfDays: (json['numOfDays'] as num).toInt(),
      requestReason: json['requestReason'] as String,
      requestDate: DateTime.parse(json['requestDate'] as String),
      requestStatus: $enumDecode(
        _$LeaveRequestStatusEnumMap,
        json['requestStatus'],
      ),
      comment: json['comment'] as String?,
      approvedBy: json['approvedBy'] as String?,
      rejectedBy: json['rejectedBy'] as String?,
      actionedDate:
          json['actionedDate'] == null
              ? null
              : DateTime.parse(json['actionedDate'] as String),
    );

Map<String, dynamic> _$LeaveRequestEditToJson(_LeaveRequestEdit instance) =>
    <String, dynamic>{
      'leaveRequestId': instance.leaveRequestId,
      'leaveTypeId': instance.leaveTypeId,
      'employeeId': instance.employeeId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'numOfDays': instance.numOfDays,
      'requestReason': instance.requestReason,
      'requestDate': instance.requestDate.toIso8601String(),
      'requestStatus': _$LeaveRequestStatusEnumMap[instance.requestStatus]!,
      'comment': instance.comment,
      'approvedBy': instance.approvedBy,
      'rejectedBy': instance.rejectedBy,
      'actionedDate': instance.actionedDate?.toIso8601String(),
    };

const _$LeaveRequestStatusEnumMap = {
  LeaveRequestStatus.pending: 0,
  LeaveRequestStatus.approved: 1,
  LeaveRequestStatus.rejected: 2,
  LeaveRequestStatus.cancelled: 3,
};
