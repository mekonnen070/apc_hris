// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Training _$TrainingFromJson(Map<String, dynamic> json) => _Training(
  trainingId: (json['trainingId'] as num).toInt(),
  trainingName: json['trainingName'] as String,
  trainingType: json['trainingType'] as String,
  trainingModality: $enumDecode(
    _$TrainingModalityEnumMap,
    json['trainingModality'],
  ),
  trainingWarranty: $enumDecode(
    _$TrainingWarrantyEnumMap,
    json['trainingWarranty'],
  ),
  trainingQualification: $enumDecode(
    _$QualificationTypeEnumMap,
    json['trainingQualification'],
  ),
  trainingDescription: json['trainingDescription'] as String,
  trainingLocation: json['trainingLocation'] as String,
  trainingInstitution: json['trainingInstitution'] as String,
  trainingStartDate: DateTime.parse(json['trainingStartDate'] as String),
  trainingEndDate: DateTime.parse(json['trainingEndDate'] as String),
  traineeRequired: (json['traineeRequired'] as num).toInt(),
  traineeActual: (json['traineeActual'] as num?)?.toInt() ?? 0,
  requiredEducation: json['requiredEducation'] as String,
  requiredExperience: (json['requiredExperience'] as num).toInt(),
  requiredSex: $enumDecode(_$GenderEnumMap, json['requiredSex']),
  trainingCost: (json['trainingCost'] as num).toDouble(),
  trainingStatus: $enumDecode(_$GeneralStatusEnumMap, json['trainingStatus']),
  registrationLocation: json['registrationLocation'] as String,
  postEndDate: DateTime.parse(json['postEndDate'] as String),
  trainingEntryBy: json['trainingEntryBy'] as String,
  trainingEntryDate: DateTime.parse(json['trainingEntryDate'] as String),
  developmentType: DevelopmentPlan.fromJson(
    json['developmentType'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TrainingToJson(_Training instance) => <String, dynamic>{
  'trainingId': instance.trainingId,
  'trainingName': instance.trainingName,
  'trainingType': instance.trainingType,
  'trainingModality': _$TrainingModalityEnumMap[instance.trainingModality]!,
  'trainingWarranty': _$TrainingWarrantyEnumMap[instance.trainingWarranty]!,
  'trainingQualification':
      _$QualificationTypeEnumMap[instance.trainingQualification]!,
  'trainingDescription': instance.trainingDescription,
  'trainingLocation': instance.trainingLocation,
  'trainingInstitution': instance.trainingInstitution,
  'trainingStartDate': instance.trainingStartDate.toIso8601String(),
  'trainingEndDate': instance.trainingEndDate.toIso8601String(),
  'traineeRequired': instance.traineeRequired,
  'traineeActual': instance.traineeActual,
  'requiredEducation': instance.requiredEducation,
  'requiredExperience': instance.requiredExperience,
  'requiredSex': _$GenderEnumMap[instance.requiredSex]!,
  'trainingCost': instance.trainingCost,
  'trainingStatus': _$GeneralStatusEnumMap[instance.trainingStatus]!,
  'registrationLocation': instance.registrationLocation,
  'postEndDate': instance.postEndDate.toIso8601String(),
  'trainingEntryBy': instance.trainingEntryBy,
  'trainingEntryDate': instance.trainingEntryDate.toIso8601String(),
  'developmentType': instance.developmentType,
};

const _$TrainingModalityEnumMap = {
  TrainingModality.regularEducation: 0,
  TrainingModality.summerEducation: 1,
  TrainingModality.distanceEducation: 2,
  TrainingModality.missionaryEducation: 3,
  TrainingModality.other: 4,
};

const _$TrainingWarrantyEnumMap = {
  TrainingWarranty.certificate: 0,
  TrainingWarranty.diploma: 1,
  TrainingWarranty.seniorDiploma: 2,
  TrainingWarranty.bscDegree: 3,
  TrainingWarranty.mscDegree: 4,
  TrainingWarranty.phdDegree: 5,
  TrainingWarranty.other: 6,
};

const _$QualificationTypeEnumMap = {
  QualificationType.professional: 0,
  QualificationType.certification: 1,
  QualificationType.competency: 2,
  QualificationType.other: 3,
};

const _$GenderEnumMap = {Gender.male: 0, Gender.female: 1, Gender.other: 2};

const _$GeneralStatusEnumMap = {
  GeneralStatus.pending: 0,
  GeneralStatus.submitted: 1,
  GeneralStatus.approved: 2,
  GeneralStatus.rejected: 3,
  GeneralStatus.completed: 4,
  GeneralStatus.canceled: 5,
};
