import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/placement/application/placement_detail_notifier.dart';
import 'package:police_com/features/placement/presentation/widgets/selected_placement_applicants_list_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:police_com/features/widgets/opportunity/application_status_card.dart';
import 'package:toastification/toastification.dart';

class PlacementDetailScreen extends HookConsumerWidget {
  final int placementId;
  const PlacementDetailScreen({super.key, required this.placementId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(placementDetailNotifierProvider.notifier);
    final state = ref.watch(placementDetailNotifierProvider);
    final reasonController = useTextEditingController();

    useEffect(() {
      Future.microtask(() => notifier.fetchPlacementDetails(placementId));
      return null;
    }, [placementId]);

    void handleApply() async {
      final success = await notifier.applyForPlacement(
        placementId: placementId,
        reason: reasonController.text,
      );
      if (success && context.mounted) {
        toastification.show(
          context: context,
          title: const Text('Application submitted successfully!'),
          type: ToastificationType.success,
        );
      }
    }

    void showAppealForm() {
      final appealReasonController = TextEditingController();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:
            (ctx) => Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                MediaQuery.of(ctx).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Submit Appeal',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: appealReasonController,
                    labelText: 'Reason for Appeal',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final success = await notifier.submitAppeal(
                        appealReason: appealReasonController.text,
                      );
                      if (context.mounted) {
                        Navigator.of(ctx).pop();
                        toastification.show(
                          context: context,
                          title: Text(
                            success
                                ? 'Appeal submitted.'
                                : 'Failed to submit appeal.',
                          ),
                          type:
                              success
                                  ? ToastificationType.success
                                  : ToastificationType.error,
                        );
                      }
                    },
                    child: const Text('Submit Appeal'),
                  ),
                ],
              ),
            ),
      );
    }

    void showSelectedApplicants() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:
            (ctx) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Selected Applicants',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Divider(height: 1),
                  // Note: This assumes TrainingApplicant and PlacementApplicant are similar enough for this widget.
                  // For a real app, you might create a more generic applicant list widget.
                  Expanded(
                    child: SelectedPlacementApplicantsListWidget(
                      applicants: state.selectedApplicants,
                    ),
                  ),
                ],
              ),
            ),
      );
    }

    final placement = state.placement;

    return Scaffold(
      appBar: const AppBarWidget(title: 'Placement Details'),
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : placement == null
              ? Center(
                child: Text(state.errorMessage ?? 'Placement not found.'),
              )
              : RefreshIndicator(
                onRefresh: () => notifier.fetchPlacementDetails(placementId),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placement.title,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${DateFormat.yMMMd().format(placement.startDate)} - ${DateFormat.yMMMd().format(placement.endDate)}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Text('Location: ${placement.location}'),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(placement.description),
                    ),
                    if (state.myApplication != null)
                      ApplicationStatusCard(
                        status: state.myApplication!.status,
                        reasonForRejection:
                            state.myApplication!.reasonForRejection,
                        onAppeal: showAppealForm,
                        onViewSelected:
                            state.selectedApplicants.isNotEmpty
                                ? showSelectedApplicants
                                : null,
                      )
                    else if (placement.currentUserApplicationStatus == null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Divider(height: 32),
                            Text(
                              'Apply for this Placement',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: reasonController,
                              labelText: 'Reason for Applying (Optional)',
                              maxLines: 4,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: state.isApplying ? null : handleApply,
                              child:
                                  state.isApplying
                                      ? const CircularProgressIndicator()
                                      : const Text('Submit Application'),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
    );
  }
}
