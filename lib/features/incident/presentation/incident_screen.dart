// lib/features/grievance/presentation/grievance_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/incident/application/incident_notifier.dart';
import 'package:police_com/features/incident/presentation/report_new_incident_screen.dart';
import 'package:police_com/features/incident/presentation/widgets/incident_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class GrievanceScreen extends ConsumerStatefulWidget {
  const GrievanceScreen({super.key});

  @override
  ConsumerState<GrievanceScreen> createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends ConsumerState<GrievanceScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(incidentNotifierProvider.notifier)
          .getMyReportedIncidents('CURRENT_USER_ID'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(incidentNotifierProvider);

    return Scaffold(
      appBar: const AppBarWidget(title: 'Incident & Grievance'),
      body: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (reports) {
          if (reports.isEmpty) {
            return const Center(child: Text('No incidents to display.'));
          }
          return RefreshIndicator(
            onRefresh:
                () => ref
                    .read(incidentNotifierProvider.notifier)
                    .getMyReportedIncidents('CURRENT_USER_ID'),
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return IncidentListItemWidget(report: reports[index]);
              },
            ),
          );
        },
        error:
            (e, s) => SomethingWentWrongWidget(
              onRetry: () {
                ref
                    .read(incidentNotifierProvider.notifier)
                    .getMyReportedIncidents('CURRENT_USER_ID');
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push<bool?>(
            MaterialPageRoute(
              builder: (context) => const ReportNewIncidentScreen(),
            ),
          );
          if (result == true) {
            ref
                .read(incidentNotifierProvider.notifier)
                .getMyReportedIncidents('CURRENT_USER_ID');
          }
        },
        tooltip: 'Report Incident',
        child: const Icon(Icons.report_problem_outlined),
      ),
    );
  }
}
