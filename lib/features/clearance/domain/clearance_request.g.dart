// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clearance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClearanceRequest _$ClearanceRequestFromJson(Map<String, dynamic> json) =>
    _ClearanceRequest(
      requestId: json['requestId'] as String,
      employeeId: json['employeeId'] as String,
      type: $enumDecode(_$ClearanceTypeEnumMap, json['type']),
      requestDate: DateTime.parse(json['requestDate'] as String),
      targetCompletionDate:
          json['targetCompletionDate'] == null
              ? null
              : DateTime.parse(json['targetCompletionDate'] as String),
      clearanceStatus:
          $enumDecodeNullable(
            _$ClearanceStatusEnumMap,
            json['clearanceStatus'],
          ) ??
          ClearanceStatus.pending,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$ClearanceRequestToJson(_ClearanceRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'employeeId': instance.employeeId,
      'type': _$ClearanceTypeEnumMap[instance.type]!,
      'requestDate': instance.requestDate.toIso8601String(),
      'targetCompletionDate': instance.targetCompletionDate?.toIso8601String(),
      'clearanceStatus': _$ClearanceStatusEnumMap[instance.clearanceStatus]!,
      'remarks': instance.remarks,
    };

const _$ClearanceTypeEnumMap = {
  ClearanceType.resignation: 0,
  ClearanceType.termination: 1,
  ClearanceType.retirement: 2,
  ClearanceType.transfer: 3,
  ClearanceType.promotion: 4,
  ClearanceType.contractEnd: 5,
  ClearanceType.leaveOfAbsence: 6,
};

const _$ClearanceStatusEnumMap = {
  ClearanceStatus.pending: 0,
  ClearanceStatus.approved: 1,
  ClearanceStatus.rejected: 2,
  ClearanceStatus.processing: 3,
  ClearanceStatus.completed: 4,
};
