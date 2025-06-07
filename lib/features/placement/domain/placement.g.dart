// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Placement _$PlacementFromJson(Map<String, dynamic> json) => _Placement(
  placementAnnouncementId: (json['placementAnnouncementId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  location: json['location'] as String,
  currentUserApplicationStatus: $enumDecodeNullable(
    _$ApplicantStatusEnumMap,
    json['currentUserApplicationStatus'],
  ),
);

Map<String, dynamic> _$PlacementToJson(_Placement instance) =>
    <String, dynamic>{
      'placementAnnouncementId': instance.placementAnnouncementId,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'location': instance.location,
      'currentUserApplicationStatus':
          _$ApplicantStatusEnumMap[instance.currentUserApplicationStatus],
    };

const _$ApplicantStatusEnumMap = {
  ApplicantStatus.applied: 'applied',
  ApplicantStatus.underReview: 'underReview',
  ApplicantStatus.selected: 'selected',
  ApplicantStatus.notSelected: 'notSelected',
  ApplicantStatus.appealed: 'appealed',
  ApplicantStatus.withdrawn: 'withdrawn',
};
