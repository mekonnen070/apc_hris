// lib/features/grievance/presentation/widgets/incident_list_item_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/incident/domain/incident_report.dart';
import 'package:police_com/features/widgets/Incident_status_chip.dart';

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
                  report.incidentType.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IncidentStatusChip(status: report.status),
              ],
            ),
            const SizedBox(height: 8),
            Text('Date: ${DateFormat.yMMMd().format(report.incidentDate)}'),
            const Divider(height: 24),
            Text(report.description),
          ],
        ),
      ),
    );
  }
}
