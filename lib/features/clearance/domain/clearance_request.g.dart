// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clearance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClearanceRequest _$ClearanceRequestFromJson(Map<String, dynamic> json) =>
    _ClearanceRequest(
      id: (json['id'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      reason: $enumDecode(_$ClearanceReasonEnumMap, json['reason']),
      requestDate: DateTime.parse(json['requestDate'] as String),
      lastDayOfWork: DateTime.parse(json['lastDayOfWork'] as String),
      comments: json['comments'] as String?,
      status: $enumDecode(_$ClearanceStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ClearanceRequestToJson(_ClearanceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'reason': _$ClearanceReasonEnumMap[instance.reason]!,
      'requestDate': instance.requestDate.toIso8601String(),
      'lastDayOfWork': instance.lastDayOfWork.toIso8601String(),
      'comments': instance.comments,
      'status': _$ClearanceStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ClearanceReasonEnumMap = {
  ClearanceReason.resignation: 0,
  ClearanceReason.endOfContract: 1,
  ClearanceReason.retirement: 2,
  ClearanceReason.longTermLeave: 3,
  ClearanceReason.other: 4,
};

const _$ClearanceStatusEnumMap = {
  ClearanceStatus.pending: 0,
  ClearanceStatus.approved: 1,
  ClearanceStatus.rejected: 2,
  ClearanceStatus.processing: 3,
  ClearanceStatus.completed: 4,
};
