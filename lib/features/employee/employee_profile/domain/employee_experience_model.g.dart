// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeExperienceModel _$EmployeeExperienceModelFromJson(
  Map<String, dynamic> json,
) => _EmployeeExperienceModel(
  experienceId: json['experienceId'] as String?,
  employeeId: json['employeeId'] as String,
  organization: json['organization'] as String?,
  organizationType: $enumDecode(
    _$OrganizationTypeEnumMap,
    json['organizationType'],
  ),
  position: json['position'] as String?,
  responsibilities: json['responsibilities'] as String? ?? '',
  proficiencyLevel:
      $enumDecodeNullable(
        _$ProficiencyLevelEnumMap,
        json['proficiencyLevel'],
      ) ??
      ProficiencyLevel.beginner,
  joinDate: DateTime.parse(json['joinDate'] as String),
  separationDate:
      json['separationDate'] == null
          ? null
          : DateTime.parse(json['separationDate'] as String),
  separationNotes: json['separationNotes'] as String?,
  entryBy: json['entryBy'] as String?,
  entryDate:
      json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
);

Map<String, dynamic> _$EmployeeExperienceModelToJson(
  _EmployeeExperienceModel instance,
) => <String, dynamic>{
  'experienceId': instance.experienceId,
  'employeeId': instance.employeeId,
  'organization': instance.organization,
  'organizationType': _$OrganizationTypeEnumMap[instance.organizationType]!,
  'position': instance.position,
  'responsibilities': instance.responsibilities,
  'proficiencyLevel': _$ProficiencyLevelEnumMap[instance.proficiencyLevel]!,
  'joinDate': instance.joinDate.toIso8601String(),
  'separationDate': instance.separationDate?.toIso8601String(),
  'separationNotes': instance.separationNotes,
  'entryBy': instance.entryBy,
  'entryDate': instance.entryDate?.toIso8601String(),
};

const _$OrganizationTypeEnumMap = {
  OrganizationType.govermental: 'govermental',
  OrganizationType.ngo: 'ngo',
  OrganizationType.plc: 'plc',
  OrganizationType.sole: 'sole',
};

const _$ProficiencyLevelEnumMap = {
  ProficiencyLevel.beginner: 'beginner',
  ProficiencyLevel.intermediate: 'intermediate',
  ProficiencyLevel.expert: 'expert',
};
