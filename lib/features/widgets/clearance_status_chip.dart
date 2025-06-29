import 'package:flutter/material.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';

class ClearanceStatusChip extends StatelessWidget {
  final ClearanceStatus status;
  const ClearanceStatusChip({super.key, required this.status});

  Color _getStatusColor(ClearanceStatus status, BuildContext context) {
    switch (status) {
      case ClearanceStatus.pending:
        return Colors.green;
      case ClearanceStatus.approved:
        return Theme.of(context).colorScheme.error;
      case ClearanceStatus.rejected:
        return Colors.grey;
      case ClearanceStatus.processing:
        return Colors.blue;
      case ClearanceStatus.completed:
        return Colors.orange;
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
