// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement_application_edit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacementApplicationEdit _$PlacementApplicationEditFromJson(
  Map<String, dynamic> json,
) => _PlacementApplicationEdit(
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

Map<String, dynamic> _$PlacementApplicationEditToJson(
  _PlacementApplicationEdit instance,
) => <String, dynamic>{
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
  ApplicantStatus.offered: 5,
  ApplicantStatus.completed: 6,
  ApplicantStatus.progress: 7,
  ApplicantStatus.withdrawn: 8,
};
