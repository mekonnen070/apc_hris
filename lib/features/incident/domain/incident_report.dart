// lib/features/grievance/domain/incident_report.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/incident_status.dart';
import 'package:police_com/core/enums/incident_type.dart';

part 'incident_report.freezed.dart';
part 'incident_report.g.dart';

@freezed
abstract class IncidentReport with _$IncidentReport {
  const factory IncidentReport({
    required int id,
    required String reportedById,
    required DateTime incidentDate,
    required IncidentType incidentType,
    required String description,
    required IncidentStatus status,
    List<String>? involvedParties,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IncidentReport;

  factory IncidentReport.fromJson(Map<String, dynamic> json) =>
      _$IncidentReportFromJson(json);
}
