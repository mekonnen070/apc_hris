// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationData _$LocationDataFromJson(Map<String, dynamic> json) =>
    _LocationData(
      location: json['location'] as String,
      locationId: json['locationId'] as String,
      department: json['department'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$LocationDataToJson(_LocationData instance) =>
    <String, dynamic>{
      'location': instance.location,
      'locationId': instance.locationId,
      'department': instance.department,
      'position': instance.position,
    };
