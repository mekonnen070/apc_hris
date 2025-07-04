import 'package:flutter/material.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

/// A card that displays the user's current application status and provides
/// relevant actions like appealing a decision or viewing selected candidates.
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
    final bool isRejected = status == ApplicantStatus.rejected;
    final bool isUnderReview = status == ApplicantStatus.underReview;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.lango.yourStatus,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ApplicationStatusChip(status: status),
              ],
            ),
            // Show the action section only for relevant statuses.
            if (isRejected || isUnderReview) ...[
              const Divider(height: 24),
              if (isRejected) ...[
                Text(
                  context.lango.reasonForNonSelection,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  reasonForRejection ?? context.lango.noReasonProvided,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
              if (isUnderReview) ...[
                Text(
                  context.lango.yourAppealIsUnderReview,
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
                      child: Text(context.lango.viewSelected),
                    ),
                  // The appeal button should only show if the status is 'rejected'.
                  if (onAppeal != null && isRejected) ...[
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      onPressed: onAppeal,
                      icon: const Icon(Icons.policy_outlined),
                      label: Text(context.lango.appealDecision),
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
