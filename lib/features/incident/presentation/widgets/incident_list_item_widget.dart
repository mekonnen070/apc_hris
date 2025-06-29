import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/string_extension.dart'; // <-- ADDED for .toDisplayCase()
import 'package:police_com/features/incident/domain/incident_report.dart';
import 'package:police_com/features/widgets/incident_status_chip.dart'; // <-- CORRECTED TYPO

class IncidentListItemWidget extends StatelessWidget {
  final IncidentReport report;

  const IncidentListItemWidget({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  report.incidentType.name.toDisplayCase(), // <-- REPLACED toString() with name.toDisplayCase()
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IncidentStatusChip(status: report.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(context.lango.dateLabel(date: DateFormat.yMMMd().format(report.incidentDate))), // <-- REPLACED
            const Divider(height: 24),
            Text(report.description),
          ],
        ),
      ),
    );
  }
}