// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_applicant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingApplicant _$TrainingApplicantFromJson(Map<String, dynamic> json) =>
    _TrainingApplicant(
      trainingApplicantId: (json['trainingApplicantId'] as num).toInt(),
      trainingId: (json['trainingId'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      employeeFullName: json['employeeFullName'] as String?,
      employeePhotoPath: json['employeePhotoPath'] as String?,
      appliedDate: DateTime.parse(json['appliedDate'] as String),
      status: $enumDecode(_$ApplicantStatusEnumMap, json['status']),
      reasonForRejection: json['reasonForRejection'] as String?,
      appealReason: json['appealReason'] as String?,
      appealDate:
          json['appealDate'] == null
              ? null
              : DateTime.parse(json['appealDate'] as String),
    );

Map<String, dynamic> _$TrainingApplicantToJson(_TrainingApplicant instance) =>
    <String, dynamic>{
      'trainingApplicantId': instance.trainingApplicantId,
      'trainingId': instance.trainingId,
      'employeeId': instance.employeeId,
      'employeeFullName': instance.employeeFullName,
      'employeePhotoPath': instance.employeePhotoPath,
      'appliedDate': instance.appliedDate.toIso8601String(),
      'status': _$ApplicantStatusEnumMap[instance.status]!,
      'reasonForRejection': instance.reasonForRejection,
      'appealReason': instance.appealReason,
      'appealDate': instance.appealDate?.toIso8601String(),
    };

const _$ApplicantStatusEnumMap = {
  ApplicantStatus.pending: 0,
  ApplicantStatus.submitted: 1,
  ApplicantStatus.selected: 2,
  ApplicantStatus.rejected: 3,
  ApplicantStatus.underReview: 4,
  ApplicantStatus.passed: 5,
  ApplicantStatus.readyForApproval: 6,
  ApplicantStatus.offered: 7,
  ApplicantStatus.completed: 8,
  ApplicantStatus.progress: 9,
  ApplicantStatus.withdrawn: 10,
};
