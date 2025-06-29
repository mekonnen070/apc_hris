import 'package:flutter/material.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';

class ApplicationStatusChip extends StatelessWidget {
  final ApplicantStatus status;
  const ApplicationStatusChip({super.key, required this.status});

  Color _getStatusColor(ApplicantStatus status, BuildContext context) {
    switch (status) {
      case ApplicantStatus.selected:
        return Colors.green;
      case ApplicantStatus.notSelected:
        return Theme.of(context).colorScheme.error;
      case ApplicantStatus.withdrawn:
        return Colors.grey;
      case ApplicantStatus.applied:
        return Colors.blue;
      case ApplicantStatus.underReview:
        return Colors.orange;
      case ApplicantStatus.appealed:
        return Colors.orange.shade700;
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
