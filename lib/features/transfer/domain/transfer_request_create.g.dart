// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferRequestCreate _$TransferRequestCreateFromJson(
  Map<String, dynamic> json,
) => _TransferRequestCreate(
  employeeId: json['employeeId'] as String,
  currentLocation: json['currentLocation'] as String,
  currentLocationId: json['currentLocationId'] as String,
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
  toLocation: json['toLocation'] as String,
  toLocationId: json['toLocationId'] as String,
  toDepartment: json['toDepartment'] as String,
  toDepartmentId: json['toDepartmentId'] as String,
  toPosition: json['toPosition'] as String,
  toPositionId: json['toPositionId'] as String,
  requestDate: DateTime.parse(json['requestDate'] as String),
  transferPeriod: $enumDecode(_$TransferPeriodEnumMap, json['transferPeriod']),
  transferYear: json['transferYear'] as String,
  transferReason: $enumDecode(_$TransferReasonsEnumMap, json['transferReason']),
);

Map<String, dynamic> _$TransferRequestCreateToJson(
  _TransferRequestCreate instance,
) => <String, dynamic>{
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
  'transferReason': _$TransferReasonsEnumMap[instance.transferReason]!,
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
