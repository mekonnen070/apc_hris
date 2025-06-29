import 'package:flutter/material.dart';
import 'package:police_com/core/enums/incident_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';

class IncidentStatusChip extends StatelessWidget {
  final IncidentStatus status;
  const IncidentStatusChip({super.key, required this.status});

  Color _getStatusColor(IncidentStatus status, BuildContext context) {
    switch (status) {
      case IncidentStatus.submitted:
        return Colors.green;
      case IncidentStatus.underReview:
        return Theme.of(context).colorScheme.error;
      case IncidentStatus.resolved:
        return Colors.grey;
      case IncidentStatus.closed:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(status, context);
    return Chip(
      label: Text(status.name.toDisplayCase()),
      labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: statusColor,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: statusColor.withValues(alpha: 0.15),
      side: BorderSide(color: statusColor.withValues(alpha: 0.3)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
