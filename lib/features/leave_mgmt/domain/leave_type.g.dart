// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => _LeaveType(
  leaveTypeId: (json['leaveTypeId'] as num).toInt(),
  leaveTypeName: json['leaveTypeName'] as String,
  isPaid: json['isPaid'] as bool,
  maximumDays: (json['maximumDays'] as num).toInt(),
);

Map<String, dynamic> _$LeaveTypeToJson(_LeaveType instance) =>
    <String, dynamic>{
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
      'isPaid': instance.isPaid,
      'maximumDays': instance.maximumDays,
    };
