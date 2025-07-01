import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/placement/application/available_placements_notifier.dart';
import 'package:police_com/features/placement/application/my_placement_applications_notifier.dart';
import 'package:police_com/features/placement/presentation/available_placements_screen.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

class MyPlacementApplicationsScreen extends ConsumerWidget {
  const MyPlacementApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both the user's applications and the list of all announcements
    final myApplicationsState = ref.watch(myPlacementApplicationsProvider);
    final allAnnouncementsState = ref.watch(availablePlacementsProvider);

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.myPlacementApplications),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the placement announcement screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AvailablePlacementsScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: myApplicationsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Text('${context.lango.error}: ${error.toString()}'),
            ),
        data: (applications) {
          if (applications.isEmpty) {
            return Center(
              child: Text(
                context.lango.noApplicationsSubmitted,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          // Use maybeWhen to handle the loading/error state of the announcements list
          return allAnnouncementsState.maybeWhen(
            data: (announcements) {
              // FIX: Create a lookup map for efficient access. O(n) once.
              final announcementMap = {
                for (final ann in announcements) ann.announcementId: ann,
              };

              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: applications.length,
                itemBuilder: (context, index) {
                  final application = applications[index];
                  // Efficiently find the announcement from the map. O(1) per item.
                  final announcement =
                      announcementMap[application.pAnnouncementId];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        // Provide a sensible fallback if the announcement is not found.
                        announcement?.announcementTitle ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${context.lango.appliedOn}: ${DateFormat.yMMMd().format(application.entryDate)}',
                      ),
                      trailing: ApplicationStatusChip(
                        status: application.applicantStatus,
                      ),
                    ),
                  );
                },
              );
            },
            // Show a loader while the full announcement list is still fetching
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
