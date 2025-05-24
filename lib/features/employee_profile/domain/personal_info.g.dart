// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) =>
    _PersonalInfo(
      fullName: json['fullName'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      dateOfBirth:
          json['dateOfBirth'] == null
              ? null
              : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(_PersonalInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'maritalStatus': instance.maritalStatus,
    };
