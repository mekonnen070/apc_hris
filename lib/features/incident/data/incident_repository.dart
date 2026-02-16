// lib/features/incident/data/incident_repository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/incident_status.dart';
import 'package:police_com/core/enums/incident_type.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/incident/domain/incident_report.dart';

final incidentRepositoryProvider = Provider(
  (ref) => IncidentRepository(ref.read(dioClientProvider)),
);

// TODO: Replace mock data with real API calls before production.
class IncidentRepository with LoggerMixin {
  final DioClient _dioClient;

  IncidentRepository(this._dioClient);

  Future<List<IncidentReport>> getMyReportedIncidents(String reporterId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      IncidentReport(
        id: 101,
        reportedById: reporterId,
        incidentDate: DateTime.now().subtract(const Duration(days: 10)),
        incidentType: IncidentType.safety,
        description:
            'Water spill near the main entrance was not cleaned up for over an hour, creating a slipping hazard.',
        status: IncidentStatus.resolved,
        involvedParties: ['Janitorial Staff'],
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now().subtract(const Duration(days: 8)),
      ),
      IncidentReport(
        id: 102,
        reportedById: reporterId,
        incidentDate: DateTime.now().subtract(const Duration(days: 3)),
        incidentType: IncidentType.grievance,
        description:
            'Request for clarification on the new overtime policy announced last week.',
        status: IncidentStatus.underReview,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  Future<void> submitIncidentReport(IncidentReport report) async {
    await Future.delayed(const Duration(seconds: 2));
    logInfo('Submitting new incident report: ${report.toJson()}');
  }
}
