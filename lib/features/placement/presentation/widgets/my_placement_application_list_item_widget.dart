import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/placement/application/my_placement_applications_notifier.dart';
import 'package:police_com/features/placement/application/placement_detail_notifier.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';
import 'package:police_com/features/placement/presentation/placement_application_detail_screen.dart';

class MyPlacementApplicationListItemWidget extends ConsumerWidget {
  final PlacementApplicant application;

  const MyPlacementApplicationListItemWidget({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(theme, application.applicantStatus);
    final announcementAsync = ref.watch(
      placementDetailNotifierProvider(application.pAnnouncementId),
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      clipBehavior:
          Clip.antiAlias, // Ensures the InkWell ripple respects the border radius
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(16),
      ),
      // The entire card is now tappable
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => PlacementApplicationDetailScreen(
                    applicationId: application.applicantId,
                  ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: announcementAsync.when(
                      data:
                          (announcement) => Text(
                            announcement.announcementTitle,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      loading:
                          () => const Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                      error:
                          (_, __) =>
                              Text('Placement #${application.pAnnouncementId}'),
                    ),
                  ),
                  Chip(
                    label: Text(
                      application.applicantStatus.name.toDisplayCase(),
                    ),
                    backgroundColor: statusColor.withOpacity(0.15),
                    side: BorderSide.none,
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Applied On', style: theme.textTheme.labelMedium),
                      Text(
                        DateFormat.yMMMd().format(application.entryDate),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  // The delete icon is now placed directly here, if applicable
                  if (application.applicantStatus ==
                          ApplicantStatus.submitted ||
                      application.applicantStatus == ApplicantStatus.pending)
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.colorScheme.error,
                      ),
                      onPressed:
                          () => _confirmDelete(context, ref, application),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(ThemeData theme, ApplicantStatus status) {
    switch (status) {
      case ApplicantStatus.selected:
      case ApplicantStatus.offered:
      case ApplicantStatus.completed:
        return Colors.green.shade700;
      case ApplicantStatus.rejected:
      case ApplicantStatus.withdrawn:
        return theme.colorScheme.error;
      case ApplicantStatus.underReview:
        return Colors.blue.shade700;
      default:
        return Colors.orange.shade800;
    }
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    PlacementApplicant application,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Cancel Application'),
            content: const Text(
              'Are you sure you want to cancel this placement application? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('No'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(myPlacementApplicationsNotifierProvider.notifier)
                      .deleteApplication(application.applicantId);
                },
                child: const Text('Yes, Cancel'),
              ),
            ],
          ),
    );
  }
}
