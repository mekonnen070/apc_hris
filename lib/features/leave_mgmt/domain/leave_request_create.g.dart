// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveRequestCreate _$LeaveRequestCreateFromJson(Map<String, dynamic> json) =>
    _LeaveRequestCreate(
      leaveTypeId: json['leaveTypeId'] as String,
      employeeId: json['employeeId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      numOfDays: (json['numOfDays'] as num).toInt(),
      requestReason: json['requestReason'] as String,
      requestDate: DateTime.parse(json['requestDate'] as String),
    );

Map<String, dynamic> _$LeaveRequestCreateToJson(_LeaveRequestCreate instance) =>
    <String, dynamic>{
      'leaveTypeId': instance.leaveTypeId,
      'employeeId': instance.employeeId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'numOfDays': instance.numOfDays,
      'requestReason': instance.requestReason,
      'requestDate': instance.requestDate.toIso8601String(),
    };
