// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => _LeaveType(
  typeId: json['typeId'] as String,
  typeName: json['typeName'] as String,
  minimumLeave: (json['minimumLeave'] as num).toInt(),
  increment: (json['increment'] as num).toInt(),
  incrementingByYear: (json['incrementingByYear'] as num).toInt(),
  maximumLeave: (json['maximumLeave'] as num).toInt(),
  enabled: json['enabled'] as bool,
  entryBy: json['entryBy'] as String,
  entryDate: DateTime.parse(json['entryDate'] as String),
  leaves: json['leaves'] as List<dynamic>,
);

Map<String, dynamic> _$LeaveTypeToJson(_LeaveType instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'typeName': instance.typeName,
      'minimumLeave': instance.minimumLeave,
      'increment': instance.increment,
      'incrementingByYear': instance.incrementingByYear,
      'maximumLeave': instance.maximumLeave,
      'enabled': instance.enabled,
      'entryBy': instance.entryBy,
      'entryDate': instance.entryDate.toIso8601String(),
      'leaves': instance.leaves,
    };
