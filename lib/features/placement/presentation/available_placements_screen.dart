import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/placement/application/available_placements_notifier.dart';
import 'package:police_com/features/placement/application/placement_application_notifier.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';
import 'package:police_com/features/placement/presentation/widgets/placement_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:toastification/toastification.dart';

class AvailablePlacementsScreen extends ConsumerWidget {
  const AvailablePlacementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementsState = ref.watch(availablePlacementsProvider);
    final applicationState = ref.watch(placementApplicationNotifierProvider);
    final applicationNotifier = ref.read(
      placementApplicationNotifierProvider.notifier,
    );

    // Listen for the result of the application submission to show a toast.
    ref.listen(placementApplicationNotifierProvider, (previous, next) {
      if (next.successMessage != null) {
        Toastification().show(
          context: context,
          title: Text(next.successMessage!),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
      if (next.errorMessage != null) {
        Toastification().show(
          context: context,
          title: Text(next.errorMessage!),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    });

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.availablePlacements),
      body: RefreshIndicator(
        onRefresh:
            () => ref.read(availablePlacementsProvider.notifier).refresh(),
        child: announcementsState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (error, stack) =>
                  Center(child: Text(context.lango.somethingWentWrong)),
          data: (announcements) {
            if (announcements.isEmpty) {
              return Center(
                child: Text(
                  context.lango.noPlacementsAvailable,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final announcement = announcements[index];
                return PlacementListItemWidget(
                  announcement: announcement,
                  isApplying: applicationState.isSubmitting,
                  onApply:
                      () => _showApplyConfirmationDialog(
                        context,
                        announcement,
                        applicationNotifier,
                      ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showApplyConfirmationDialog(
    BuildContext context,
    PlacementAnnouncement announcement,
    PlacementApplicationNotifier notifier,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(context.lango.confirmApplication),
            content: Text(
              context.lango.confirmPlacementApplication(
                position: announcement.announcementTitle,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(context.lango.cancel),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  notifier.apply(announcementId: announcement.announcementId);
                },
                child: Text(context.lango.confirmAndApply),
              ),
            ],
          ),
    );
  }
}
