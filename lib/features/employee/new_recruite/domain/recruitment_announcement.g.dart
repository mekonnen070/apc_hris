// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecruitmentAnnouncement _$RecruitmentAnnouncementFromJson(
  Map<String, dynamic> json,
) => _RecruitmentAnnouncement(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
);

Map<String, dynamic> _$RecruitmentAnnouncementToJson(
  _RecruitmentAnnouncement instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
};
