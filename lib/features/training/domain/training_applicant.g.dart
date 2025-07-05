// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_applicant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingApplicant _$TrainingApplicantFromJson(Map<String, dynamic> json) =>
    _TrainingApplicant(
      id: (json['id'] as num?)?.toInt(),
      applicantId: json['applicantId'] as String,
      appliedFor: (json['appliedFor'] as num).toInt(),
      applicantStatus: $enumDecodeNullable(
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
      employee:
          json['employee'] == null
              ? null
              : EmployeeInfoModel.fromJson(
                json['employee'] as Map<String, dynamic>,
              ),
      training:
          json['training'] == null
              ? null
              : Training.fromJson(json['training'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainingApplicantToJson(_TrainingApplicant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicantId': instance.applicantId,
      'appliedFor': instance.appliedFor,
      'applicantStatus': _$ApplicantStatusEnumMap[instance.applicantStatus],
      'cgpa': instance.cgpa,
      'age': instance.age,
      'applicantEntryBy': instance.applicantEntryBy,
      'applicantEntryDate': instance.applicantEntryDate?.toIso8601String(),
      'employee': instance.employee,
      'training': instance.training,
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
