// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentReport _$IncidentReportFromJson(Map<String, dynamic> json) =>
    _IncidentReport(
      id: (json['id'] as num).toInt(),
      reportedById: json['reportedById'] as String,
      incidentDate: DateTime.parse(json['incidentDate'] as String),
      incidentType: $enumDecode(_$IncidentTypeEnumMap, json['incidentType']),
      description: json['description'] as String,
      status: $enumDecode(_$IncidentStatusEnumMap, json['status']),
      involvedParties:
          (json['involvedParties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$IncidentReportToJson(_IncidentReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportedById': instance.reportedById,
      'incidentDate': instance.incidentDate.toIso8601String(),
      'incidentType': _$IncidentTypeEnumMap[instance.incidentType]!,
      'description': instance.description,
      'status': _$IncidentStatusEnumMap[instance.status]!,
      'involvedParties': instance.involvedParties,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$IncidentTypeEnumMap = {
  IncidentType.safety: 'safety',
  IncidentType.conduct: 'conduct',
  IncidentType.harassment: 'harassment',
  IncidentType.theft: 'theft',
  IncidentType.grievance: 'grievance',
  IncidentType.other: 'other',
};

const _$IncidentStatusEnumMap = {
  IncidentStatus.submitted: 'submitted',
  IncidentStatus.underReview: 'underReview',
  IncidentStatus.resolved: 'resolved',
  IncidentStatus.closed: 'closed',
};
