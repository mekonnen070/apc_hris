import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/placement/application/placement_detail_notifier.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

// New Notifier for fetching a single application's details
final placementApplicationDetailNotifierProvider = FutureProvider.autoDispose
    .family<PlacementApplicant, int>((ref, id) {
      return ref
          .watch(placementRepositoryProvider)
          .getPlacementApplicationDetail(id: id);
    });

class PlacementApplicationDetailScreen extends ConsumerWidget {
  final int applicationId;
  const PlacementApplicationDetailScreen({
    super.key,
    required this.applicationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationAsync = ref.watch(
      placementApplicationDetailNotifierProvider(applicationId),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Application Details')),
      body: applicationAsync.when(
        data: (application) {
          final announcementAsync = ref.watch(
            placementDetailNotifierProvider(application.pAnnouncementId),
          );
          return announcementAsync.when(
            data:
                (announcement) => ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildSectionHeader(context, 'Placement Details'),
                    _buildDetailRow(
                      context,
                      'Title',
                      announcement.announcementTitle,
                    ),
                    _buildDetailRow(context, 'Location', announcement.location),
                    _buildDetailRow(
                      context,
                      'Department',
                      announcement.department,
                    ),
                    const Divider(height: 32),
                    _buildSectionHeader(context, 'Your Application'),
                    _buildDetailRow(
                      context,
                      'Application ID',
                      '#${application.applicantId}',
                    ),
                    _buildDetailRow(
                      context,
                      'Status',
                      application.applicantStatus.name.toDisplayCase(),
                    ),
                    _buildDetailRow(
                      context,
                      'Applied On',
                      DateFormat.yMMMd().format(application.entryDate),
                    ),
                  ],
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (e, s) =>
                    Center(child: Text('Could not load placement details: $e')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (e, s) =>
                Center(child: Text('Could not load application details: $e')),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
