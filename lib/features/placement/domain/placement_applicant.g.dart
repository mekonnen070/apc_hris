// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement_applicant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacementApplicant _$PlacementApplicantFromJson(Map<String, dynamic> json) =>
    _PlacementApplicant(
      placementApplicantId: (json['placementApplicantId'] as num).toInt(),
      placementAnnouncementId: (json['placementAnnouncementId'] as num).toInt(),
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

Map<String, dynamic> _$PlacementApplicantToJson(_PlacementApplicant instance) =>
    <String, dynamic>{
      'placementApplicantId': instance.placementApplicantId,
      'placementAnnouncementId': instance.placementAnnouncementId,
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
  ApplicantStatus.applied: 'applied',
  ApplicantStatus.underReview: 'underReview',
  ApplicantStatus.selected: 'selected',
  ApplicantStatus.notSelected: 'notSelected',
  ApplicantStatus.appealed: 'appealed',
  ApplicantStatus.withdrawn: 'withdrawn',
};
