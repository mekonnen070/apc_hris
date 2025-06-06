// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruit_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecruitInfo _$RecruitInfoFromJson(Map<String, dynamic> json) => _RecruitInfo(
  id: (json['id'] as num?)?.toInt(),
  announcementId: (json['announcementId'] as num).toInt(),
  firstName: json['firstName'] as String,
  middleName: json['middleName'] as String,
  lastName: json['lastName'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  age: (json['age'] as num).toInt(),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  maritalStatus: $enumDecode(_$MaritalStatusEnumMap, json['maritalStatus']),
  numberOfChildren: (json['numberOfChildren'] as num).toInt(),
  nationality: json['nationality'] as String,
  religion: $enumDecode(_$ReligionEnumMap, json['religion']),
  bloodGroup: $enumDecode(_$BloodGroupEnumMap, json['bloodGroup']),
  photoPath: json['photoPath'] as String,
  woreda: json['woreda'] as String,
  kebele: json['kebele'] as String,
  houseNumber: json['houseNumber'] as String,
  phoneNumber: json['phoneNumber'] as String,
  signature: json['signature'] as String?,
  status:
      $enumDecodeNullable(_$RecruitStatusEnumMap, json['status']) ??
      RecruitStatus.noStatus,
);

Map<String, dynamic> _$RecruitInfoToJson(_RecruitInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'announcementId': instance.announcementId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender]!,
      'maritalStatus': _$MaritalStatusEnumMap[instance.maritalStatus]!,
      'numberOfChildren': instance.numberOfChildren,
      'nationality': instance.nationality,
      'religion': _$ReligionEnumMap[instance.religion]!,
      'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup]!,
      'photoPath': instance.photoPath,
      'woreda': instance.woreda,
      'kebele': instance.kebele,
      'houseNumber': instance.houseNumber,
      'phoneNumber': instance.phoneNumber,
      'signature': instance.signature,
      'status': _$RecruitStatusEnumMap[instance.status]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$MaritalStatusEnumMap = {
  MaritalStatus.single: 'single',
  MaritalStatus.married: 'married',
  MaritalStatus.divorced: 'divorced',
  MaritalStatus.widowed: 'widowed',
  MaritalStatus.separated: 'separated',
};

const _$ReligionEnumMap = {
  Religion.christianity: 'christianity',
  Religion.islam: 'islam',
  Religion.hinduism: 'hinduism',
  Religion.buddhism: 'buddhism',
  Religion.judaism: 'judaism',
  Religion.traditional: 'traditional',
  Religion.atheist: 'atheist',
  Religion.other: 'other',
  Religion.unknown: 'unknown',
};

const _$BloodGroupEnumMap = {
  BloodGroup.aPositive: 'aPositive',
  BloodGroup.aNegative: 'aNegative',
  BloodGroup.bPositive: 'bPositive',
  BloodGroup.bNegative: 'bNegative',
  BloodGroup.abPositive: 'abPositive',
  BloodGroup.abNegative: 'abNegative',
  BloodGroup.oPositive: 'oPositive',
  BloodGroup.oNegative: 'oNegative',
  BloodGroup.unknown: 'unknown',
};

const _$RecruitStatusEnumMap = {
  RecruitStatus.noStatus: 'noStatus',
  RecruitStatus.passed: 'passed',
  RecruitStatus.failed: 'failed',
};
