import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/incident/application/incident_notifier.dart';
import 'package:police_com/features/incident/presentation/report_new_incident_screen.dart';
import 'package:police_com/features/incident/presentation/widgets/incident_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class IncidentScreen extends ConsumerStatefulWidget {
  // <-- RENAMED
  const IncidentScreen({super.key}); // <-- RENAMED

  @override
  ConsumerState<IncidentScreen> createState() => _IncidentScreenState(); // <-- RENAMED
}

class _IncidentScreenState extends ConsumerState<IncidentScreen> {
  // <-- RENAMED
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
      appBar: AppBarWidget(
        title: context.lango.incidentAndGrievance,
      ), // <-- REPLACED & REMOVED CONST
      body: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (reports) {
          if (reports.isEmpty) {
            return Center(
              child: Text(context.lango.noIncidentsToDisplay),
            ); // <-- REPLACED & REMOVED CONST
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
        tooltip: context.lango.reportIncident, // <-- REPLACED
        child: const Icon(Icons.report_problem_outlined),
      ),
    );
  }
}
