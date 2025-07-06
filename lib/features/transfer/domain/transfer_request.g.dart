// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferRequest _$TransferRequestFromJson(
  Map<String, dynamic> json,
) => _TransferRequest(
  transferRequestId: (json['transferRequestId'] as num).toInt(),
  employeeId: json['employeeId'] as String?,
  currentLocation: json['currentLocation'] as String,
  currentLocationId: json['currentLocationId'] as String?,
  currentDepartment: json['currentDepartment'] as String,
  currentPosition: json['currentPosition'] as String,
  transferLevelFrom: $enumDecode(
    _$TransferLevelsEnumMap,
    json['transferLevelFrom'],
  ),
  transferLevelTo: $enumDecode(
    _$TransferLevelsEnumMap,
    json['transferLevelTo'],
  ),
  toLocation: json['toLocation'] as String?,
  toLocationId: json['toLocationId'] as String?,
  toDepartment: json['toDepartment'] as String?,
  toDepartmentId: json['toDepartmentId'] as String?,
  toPosition: json['toPosition'] as String?,
  toPositionId: json['toPositionId'] as String?,
  requestDate: DateTime.parse(json['requestDate'] as String),
  transferPeriod: $enumDecode(_$TransferPeriodEnumMap, json['transferPeriod']),
  transferYear: json['transferYear'] as String?,
  transferReason: $enumDecodeNullable(
    _$TransferReasonsEnumMap,
    json['transferReason'],
  ),
  transferStatus:
      $enumDecodeNullable(_$TransferStatusEnumMap, json['transferStatus']) ??
      TransferStatus.pending,
  approvedBy: json['approvedBy'] as String?,
  approvalDate:
      json['approvalDate'] == null
          ? null
          : DateTime.parse(json['approvalDate'] as String),
);

Map<String, dynamic> _$TransferRequestToJson(_TransferRequest instance) =>
    <String, dynamic>{
      'transferRequestId': instance.transferRequestId,
      'employeeId': instance.employeeId,
      'currentLocation': instance.currentLocation,
      'currentLocationId': instance.currentLocationId,
      'currentDepartment': instance.currentDepartment,
      'currentPosition': instance.currentPosition,
      'transferLevelFrom': _$TransferLevelsEnumMap[instance.transferLevelFrom]!,
      'transferLevelTo': _$TransferLevelsEnumMap[instance.transferLevelTo]!,
      'toLocation': instance.toLocation,
      'toLocationId': instance.toLocationId,
      'toDepartment': instance.toDepartment,
      'toDepartmentId': instance.toDepartmentId,
      'toPosition': instance.toPosition,
      'toPositionId': instance.toPositionId,
      'requestDate': instance.requestDate.toIso8601String(),
      'transferPeriod': _$TransferPeriodEnumMap[instance.transferPeriod]!,
      'transferYear': instance.transferYear,
      'transferReason': _$TransferReasonsEnumMap[instance.transferReason],
      'transferStatus': _$TransferStatusEnumMap[instance.transferStatus]!,
      'approvedBy': instance.approvedBy,
      'approvalDate': instance.approvalDate?.toIso8601String(),
    };

const _$TransferLevelsEnumMap = {
  TransferLevels.otherRegionPoliceCommission: 0,
  TransferLevels.amharaPoliceCommission: 1,
  TransferLevels.zone: 2,
  TransferLevels.policeCollege: 3,
  TransferLevels.birgade: 4,
  TransferLevels.battalion: 5,
  TransferLevels.shambel: 6,
  TransferLevels.woreda: 7,
  TransferLevels.kebele: 8,
};

const _$TransferPeriodEnumMap = {
  TransferPeriod.january: 0,
  TransferPeriod.july: 1,
};

const _$TransferReasonsEnumMap = {
  TransferReasons.service: 0,
  TransferReasons.marriage: 1,
  TransferReasons.healthProblem: 2,
  TransferReasons.familyOrWorkMater: 3,
  TransferReasons.specialPlacement: 4,
};

const _$TransferStatusEnumMap = {
  TransferStatus.pending: 0,
  TransferStatus.submitted: 1,
  TransferStatus.selected: 2,
  TransferStatus.passed: 3,
  TransferStatus.approved: 4,
  TransferStatus.rejected: 5,
};
