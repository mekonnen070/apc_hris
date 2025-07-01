// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement_announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacementAnnouncement _$PlacementAnnouncementFromJson(
  Map<String, dynamic> json,
) => _PlacementAnnouncement(
  announcementId: (json['announcementId'] as num).toInt(),
  announcementTitle: json['announcementTitle'] as String,
  location: json['location'] as String,
  department: json['department'] as String,
  positionId: json['positionId'] as String,
  requiredExperience: (json['requiredExperience'] as num).toInt(),
  requiredEducation: $enumDecode(
    _$PlacementEducationEnumMap,
    json['requiredEducation'],
  ),
  requiredApplicants: (json['requiredApplicants'] as num).toInt(),
  createdDate: DateTime.parse(json['createdDate'] as String),
  createdBy: json['createdBy'] as String,
  expiryDate: DateTime.parse(json['expiryDate'] as String),
  budgeted: json['budgeted'] as bool,
  announcementStatus: $enumDecode(
    _$ApplicantStatusEnumMap,
    json['announcementStatus'],
  ),
);

Map<String, dynamic> _$PlacementAnnouncementToJson(
  _PlacementAnnouncement instance,
) => <String, dynamic>{
  'announcementId': instance.announcementId,
  'announcementTitle': instance.announcementTitle,
  'location': instance.location,
  'department': instance.department,
  'positionId': instance.positionId,
  'requiredExperience': instance.requiredExperience,
  'requiredEducation': _$PlacementEducationEnumMap[instance.requiredEducation]!,
  'requiredApplicants': instance.requiredApplicants,
  'createdDate': instance.createdDate.toIso8601String(),
  'createdBy': instance.createdBy,
  'expiryDate': instance.expiryDate.toIso8601String(),
  'budgeted': instance.budgeted,
  'announcementStatus': _$ApplicantStatusEnumMap[instance.announcementStatus]!,
};

const _$PlacementEducationEnumMap = {
  PlacementEducation.fifthGrade: 0,
  PlacementEducation.sixthAndSeventh: 1,
  PlacementEducation.eighthAndNinth: 2,
  PlacementEducation.tenthComplete: 3,
  PlacementEducation.certificateLevelOne: 4,
  PlacementEducation.certificateLevelTwo: 5,
  PlacementEducation.diploma: 6,
  PlacementEducation.higherDiploma: 7,
  PlacementEducation.firstDegree: 8,
  PlacementEducation.secondDegree: 9,
  PlacementEducation.phd: 10,
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
