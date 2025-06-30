// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) =>
    _LeaveRequest(
      leaveRequestId: (json['leaveRequestId'] as num).toInt(),
      leaveTypeId: json['leaveTypeId'] as String,
      employeeId: json['employeeId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      numOfDays: (json['numOfDays'] as num).toInt(),
      requestReason: json['requestReason'] as String?,
      requestStatus:
          $enumDecodeNullable(
            _$LeaveRequestStatusEnumMap,
            json['requestStatus'],
          ) ??
          LeaveRequestStatus.pending,
      comment: json['comment'] as String?,
      actionedDate:
          json['actionedDate'] == null
              ? null
              : DateTime.parse(json['actionedDate'] as String),
    );

Map<String, dynamic> _$LeaveRequestToJson(_LeaveRequest instance) =>
    <String, dynamic>{
      'leaveRequestId': instance.leaveRequestId,
      'leaveTypeId': instance.leaveTypeId,
      'employeeId': instance.employeeId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'numOfDays': instance.numOfDays,
      'requestReason': instance.requestReason,
      'requestStatus': _$LeaveRequestStatusEnumMap[instance.requestStatus]!,
      'comment': instance.comment,
      'actionedDate': instance.actionedDate?.toIso8601String(),
    };

const _$LeaveRequestStatusEnumMap = {
  LeaveRequestStatus.pending: 0,
  LeaveRequestStatus.approved: 1,
  LeaveRequestStatus.rejected: 2,
  LeaveRequestStatus.cancelled: 3,
};
