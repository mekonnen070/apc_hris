// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionRequest _$PromotionRequestFromJson(Map<String, dynamic> json) =>
    _PromotionRequest(
      id: (json['id'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      requestDate: DateTime.parse(json['requestDate'] as String),
      currentPositionId: json['currentPositionId'] as String,
      promotedToPositionId: json['promotedToPositionId'] as String,
      reason: json['reason'] as String,
      comments: json['comments'] as String?,
      status: $enumDecode(_$PromotionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PromotionRequestToJson(_PromotionRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'requestDate': instance.requestDate.toIso8601String(),
      'currentPositionId': instance.currentPositionId,
      'promotedToPositionId': instance.promotedToPositionId,
      'reason': instance.reason,
      'comments': instance.comments,
      'status': _$PromotionStatusEnumMap[instance.status]!,
    };

const _$PromotionStatusEnumMap = {
  PromotionStatus.pending: 'pending',
  PromotionStatus.approved: 'approved',
  PromotionStatus.rejected: 'rejected',
};
