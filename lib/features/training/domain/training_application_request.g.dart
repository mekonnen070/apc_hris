// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_application_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingApplicationRequest _$TrainingApplicationRequestFromJson(
  Map<String, dynamic> json,
) => _TrainingApplicationRequest(
  id: (json['id'] as num?)?.toInt() ?? 0,
  applicantId: json['applicantId'] as String,
  appliedFor: (json['appliedFor'] as num).toInt(),
  applicantStatus: $enumDecode(
    _$ApplicantStatusEnumMap,
    json['applicantStatus'],
  ),
  cgpa: (json['cgpa'] as num?)?.toDouble(),
  age: (json['age'] as num).toInt(),
  applicantEntryBy: json['applicantEntryBy'] as String?,
  applicantEntryDate:
      json['applicantEntryDate'] == null
          ? null
          : DateTime.parse(json['applicantEntryDate'] as String),
);

Map<String, dynamic> _$TrainingApplicationRequestToJson(
  _TrainingApplicationRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'applicantId': instance.applicantId,
  'appliedFor': instance.appliedFor,
  'applicantStatus': _$ApplicantStatusEnumMap[instance.applicantStatus]!,
  'cgpa': instance.cgpa,
  'age': instance.age,
  'applicantEntryBy': instance.applicantEntryBy,
  'applicantEntryDate': instance.applicantEntryDate?.toIso8601String(),
};

const _$ApplicantStatusEnumMap = {
  ApplicantStatus.pending: 0,
  ApplicantStatus.submitted: 1,
  ApplicantStatus.selected: 2,
  ApplicantStatus.rejected: 3,
  ApplicantStatus.underReview: 4,
  ApplicantStatus.offered: 5,
  ApplicantStatus.completed: 6,
  ApplicantStatus.progress: 7,
  ApplicantStatus.withdrawn: 8,
};
