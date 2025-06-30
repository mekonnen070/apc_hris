// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecruitmentAnnouncement _$RecruitmentAnnouncementFromJson(
  Map<String, dynamic> json,
) => _RecruitmentAnnouncement(
  announcementId: json['announcementId'] as String?,
  announcementTitle: json['announcementTitle'] as String?,
  announcementDescription: json['announcementDescription'] as String?,
  requiredApplicants: (json['requiredApplicants'] as num).toInt(),
  round: json['round'] as String?,
  createdDate:
      json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
  createdBy: json['createdBy'] as String?,
  expiryDate:
      json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
  status:
      $enumDecodeNullable(_$AnnouncementStatusEnumMap, json['status']) ??
      AnnouncementStatus.created,
  postedDate:
      json['postedDate'] == null
          ? null
          : DateTime.parse(json['postedDate'] as String),
  postedBy: json['postedBy'] as String?,
);

Map<String, dynamic> _$RecruitmentAnnouncementToJson(
  _RecruitmentAnnouncement instance,
) => <String, dynamic>{
  'announcementId': instance.announcementId,
  'announcementTitle': instance.announcementTitle,
  'announcementDescription': instance.announcementDescription,
  'requiredApplicants': instance.requiredApplicants,
  'round': instance.round,
  'createdDate': instance.createdDate?.toIso8601String(),
  'createdBy': instance.createdBy,
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'status': _$AnnouncementStatusEnumMap[instance.status]!,
  'postedDate': instance.postedDate?.toIso8601String(),
  'postedBy': instance.postedBy,
};

const _$AnnouncementStatusEnumMap = {
  AnnouncementStatus.created: 0,
  AnnouncementStatus.posted: 1,
  AnnouncementStatus.expired: 2,
};
