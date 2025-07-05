// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicantSelection _$ApplicantSelectionFromJson(Map<String, dynamic> json) =>
    _ApplicantSelection(
      id: (json['id'] as num?)?.toInt(),
      applicationId: (json['applicationId'] as num?)?.toInt(),
      applicantId: json['applicantId'] as String?,
      trainingId: (json['trainingId'] as num?)?.toInt(),
      disciplineStatus: json['disciplineStatus'] as bool?,
      disciplineDescription: json['disciplineDescription'] as String?,
      trainingStatus: json['trainingStatus'] as bool?,
      trainingDescription: json['trainingDescription'] as String?,
      experience: json['experience'] as bool?,
      experienceDescription: json['experienceDescription'] as String?,
      retirementStatus: json['retirementStatus'] as bool?,
      retirementDescription: json['retirementDescription'] as String?,
      medicalStatus: json['medicalStatus'] as bool?,
      medicalDescription: json['medicalDescription'] as String?,
      selectedStatus: $enumDecodeNullable(
        _$ApplicantStatusEnumMap,
        json['selectedStatus'],
      ),
      entryBy: json['entryBy'] as String?,
      entryDate:
          json['entryDate'] == null
              ? null
              : DateTime.parse(json['entryDate'] as String),
      applicant:
          json['applicant'] == null
              ? null
              : TrainingApplicant.fromJson(
                json['applicant'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ApplicantSelectionToJson(_ApplicantSelection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'applicantId': instance.applicantId,
      'trainingId': instance.trainingId,
      'disciplineStatus': instance.disciplineStatus,
      'disciplineDescription': instance.disciplineDescription,
      'trainingStatus': instance.trainingStatus,
      'trainingDescription': instance.trainingDescription,
      'experience': instance.experience,
      'experienceDescription': instance.experienceDescription,
      'retirementStatus': instance.retirementStatus,
      'retirementDescription': instance.retirementDescription,
      'medicalStatus': instance.medicalStatus,
      'medicalDescription': instance.medicalDescription,
      'selectedStatus': _$ApplicantStatusEnumMap[instance.selectedStatus],
      'entryBy': instance.entryBy,
      'entryDate': instance.entryDate?.toIso8601String(),
      'applicant': instance.applicant,
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
