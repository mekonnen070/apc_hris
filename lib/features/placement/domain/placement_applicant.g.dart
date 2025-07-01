// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement_applicant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacementApplicant _$PlacementApplicantFromJson(Map<String, dynamic> json) =>
    _PlacementApplicant(
      applicantId: (json['applicantId'] as num).toInt(),
      pAnnouncementId: (json['pAnnouncementId'] as num).toInt(),
      employeeId: json['employeeId'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      entryBy: json['entryBy'] as String,
      policeTitle: (json['policeTitle'] as num).toInt(),
      applicantStatus: $enumDecode(
        _$ApplicantStatusEnumMap,
        json['applicantStatus'],
      ),
    );

Map<String, dynamic> _$PlacementApplicantToJson(_PlacementApplicant instance) =>
    <String, dynamic>{
      'applicantId': instance.applicantId,
      'pAnnouncementId': instance.pAnnouncementId,
      'employeeId': instance.employeeId,
      'entryDate': instance.entryDate.toIso8601String(),
      'entryBy': instance.entryBy,
      'policeTitle': instance.policeTitle,
      'applicantStatus': _$ApplicantStatusEnumMap[instance.applicantStatus]!,
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
