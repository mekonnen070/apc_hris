// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Training _$TrainingFromJson(Map<String, dynamic> json) => _Training(
  trainingId: (json['trainingId'] as num).toInt(),
  trainingName: json['trainingName'] as String,
  description: json['description'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  duration: (json['duration'] as num).toInt(),
  organizedBy: json['organizedBy'] as String,
  trainingCenter: json['trainingCenter'] as String,
  certificate: json['certificate'] as String?,
  currentUserApplicationStatus: $enumDecodeNullable(
    _$ApplicantStatusEnumMap,
    json['currentUserApplicationStatus'],
  ),
);

Map<String, dynamic> _$TrainingToJson(_Training instance) => <String, dynamic>{
  'trainingId': instance.trainingId,
  'trainingName': instance.trainingName,
  'description': instance.description,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'duration': instance.duration,
  'organizedBy': instance.organizedBy,
  'trainingCenter': instance.trainingCenter,
  'certificate': instance.certificate,
  'currentUserApplicationStatus':
      _$ApplicantStatusEnumMap[instance.currentUserApplicationStatus],
};

const _$ApplicantStatusEnumMap = {
  ApplicantStatus.applied: 'applied',
  ApplicantStatus.underReview: 'underReview',
  ApplicantStatus.selected: 'selected',
  ApplicantStatus.notSelected: 'notSelected',
  ApplicantStatus.appealed: 'appealed',
  ApplicantStatus.withdrawn: 'withdrawn',
};
