import 'package:flutter/material.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';

/// A chip widget that displays the status of an applicant with
/// appropriate color-coding and icons for better visual feedback.
class ApplicationStatusChip extends StatelessWidget {
  final ApplicantStatus status;

  const ApplicationStatusChip({super.key, required this.status});

  /// Determines the display color based on the applicant's status.
  /// This provides at-a-glance understanding of the state.
  Color _getStatusColor(BuildContext context, ApplicantStatus status) {
    final colors = Theme.of(context).colorScheme;
    switch (status) {
      case ApplicantStatus.completed:
      case ApplicantStatus.offered:
        return Colors.green.shade700;
      case ApplicantStatus.rejected:
      case ApplicantStatus.withdrawn:
        return colors.error;
      case ApplicantStatus.underReview:
      case ApplicantStatus.progress:
      case ApplicantStatus.selected:
        return Colors.blue.shade700;
      case ApplicantStatus.pending:
      case ApplicantStatus.submitted:
        return Colors.orange.shade800;
    }
  }

  /// Determines the display icon based on the applicant's status.
  IconData _getStatusIcon(ApplicantStatus status) {
    switch (status) {
      case ApplicantStatus.completed:
      case ApplicantStatus.offered:
        return Icons.verified_user_outlined;
      case ApplicantStatus.selected:
        return Icons.check_circle_outline;
      case ApplicantStatus.rejected:
      case ApplicantStatus.withdrawn:
        return Icons.cancel_outlined;
      case ApplicantStatus.underReview:
      case ApplicantStatus.progress:
        return Icons.hourglass_top_rounded;
      case ApplicantStatus.pending:
      case ApplicantStatus.submitted:
        return Icons.pending_actions_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(context, status);
    final icon = _getStatusIcon(status);
    // Use the existing string extension to format the enum name nicely.
    final label = status.name.toDisplayCase();

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(label),
      labelStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      backgroundColor: color.withOpacity(0.15),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    );
  }
}
