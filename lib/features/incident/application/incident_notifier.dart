// lib/features/grievance/application/grievance_notifier.dart
import 'dart:async';

import 'package:police_com/features/incident/data/incident_repository.dart';
import 'package:police_com/features/incident/domain/incident_report.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'incident_notifier.g.dart';

@riverpod
class IncidentNotifier extends _$IncidentNotifier {
  @override
  FutureOr<List<IncidentReport>> build() {
    return const [];
  }

  Future<void> getMyReportedIncidents(String reporterId) async {
    state = const AsyncValue.loading();
    try {
      final reports = await ref
          .read(incidentRepositoryProvider)
          .getMyReportedIncidents(reporterId);
      state = AsyncValue.data(reports);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
