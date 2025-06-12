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
  ClearanceReason.resignation: 'resignation',
  ClearanceReason.endOfContract: 'endOfContract',
  ClearanceReason.retirement: 'retirement',
  ClearanceReason.longTermLeave: 'longTermLeave',
  ClearanceReason.other: 'other',
};

const _$ClearanceStatusEnumMap = {
  ClearanceStatus.pending: 'pending',
  ClearanceStatus.approved: 'approved',
  ClearanceStatus.rejected: 'rejected',
  ClearanceStatus.processing: 'processing',
  ClearanceStatus.completed: 'completed',
};
