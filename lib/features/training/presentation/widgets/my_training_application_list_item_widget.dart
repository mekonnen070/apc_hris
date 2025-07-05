import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';

class MyTrainingApplicationListItemWidget extends StatelessWidget {
  final TrainingApplicant application;

  const MyTrainingApplicationListItemWidget({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    // Use the nested training object for the name, fall back to the ID
    final title =
        application.training?.trainingName ??
        'Training ID: ${application.appliedFor}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Applied On',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (application.applicantEntryDate != null)
                      Text(
                        DateFormat.yMMMd().format(
                          application.applicantEntryDate!,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
                _buildStatusChip(context, application.applicantStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, ApplicantStatus? status) {
    Color chipColor;
    String statusText;

    switch (status) {
      case ApplicantStatus.selected:
      case ApplicantStatus.offered:
      case ApplicantStatus.completed:
        chipColor = Colors.green.shade700;
        statusText = 'Accepted'; // A user-friendly term for selected/offered
        if (status == ApplicantStatus.completed) statusText = 'Completed';
        break;
      case ApplicantStatus.rejected:
      case ApplicantStatus.withdrawn:
        chipColor = Colors.red.shade700;
        statusText = 'Rejected';
        if (status == ApplicantStatus.withdrawn) statusText = 'Withdrawn';
        break;
      case ApplicantStatus.underReview:
        chipColor = Colors.blue.shade700;
        statusText = 'In Review';
        break;
      case ApplicantStatus.submitted:
      case ApplicantStatus.progress:
      case ApplicantStatus.pending:
      default:
        chipColor = Colors.orange.shade700;
        statusText = 'Pending';
        if (status == ApplicantStatus.progress) statusText = 'In Progress';
        break;
    }

    return Chip(
      label: Text(
        statusText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: chipColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      visualDensity: VisualDensity.compact,
    );
  }
}
