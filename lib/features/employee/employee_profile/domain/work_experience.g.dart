// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) =>
    _WorkExperience(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      jobTitle: json['jobTitle'] as String,
      responsibilities: json['responsibilities'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate:
          json['endDate'] == null
              ? null
              : DateTime.parse(json['endDate'] as String),
      experienceLetterUrl: json['experienceLetterUrl'] as String?,
    );

Map<String, dynamic> _$WorkExperienceToJson(_WorkExperience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'jobTitle': instance.jobTitle,
      'responsibilities': instance.responsibilities,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'experienceLetterUrl': instance.experienceLetterUrl,
    };
