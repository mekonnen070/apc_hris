import 'package:flutter/material.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

class ApplicationStatusCard extends StatelessWidget {
  final ApplicantStatus status;
  final String? reasonForRejection;
  final VoidCallback? onAppeal;
  final VoidCallback? onViewSelected;

  const ApplicationStatusCard({
    super.key,
    required this.status,
    this.reasonForRejection,
    this.onAppeal,
    this.onViewSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your Status', style: theme.textTheme.titleMedium),
                ApplicationStatusChip(status: status),
              ],
            ),
            if (status == ApplicantStatus.notSelected ||
                status == ApplicantStatus.appealed) ...[
              const Divider(height: 24),
              if (status == ApplicantStatus.notSelected) ...[
                Text(
                  'Reason for non-selection:',
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  reasonForRejection ?? 'No reason provided.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
              if (status == ApplicantStatus.appealed) ...[
                Text(
                  'Your appeal is under review.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onViewSelected != null)
                    TextButton(
                      onPressed: onViewSelected,
                      child: const Text('View Selected'),
                    ),
                  if (onAppeal != null &&
                      status == ApplicantStatus.notSelected) ...[
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: onAppeal,
                      child: const Text('Appeal Decision'),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
