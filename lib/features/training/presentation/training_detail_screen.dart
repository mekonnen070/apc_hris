import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/training/application/training_detail_notifier.dart';
import 'package:police_com/features/training/presentation/widgets/selected_training_applicants_list_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:police_com/features/widgets/opportunity/application_status_card.dart';
import 'package:police_com/features/widgets/opportunity/opportunity_detail_header.dart';
import 'package:toastification/toastification.dart';

class TrainingDetailScreen extends HookConsumerWidget {
  final int trainingId;
  const TrainingDetailScreen({super.key, required this.trainingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(trainingDetailNotifierProvider.notifier);
    final state = ref.watch(trainingDetailNotifierProvider);
    final reasonController = useTextEditingController();

    useEffect(() {
      Future.microtask(() => notifier.fetchTrainingDetails(trainingId));
      return null;
    }, [trainingId]);

    void handleApply() async {
      final success = await notifier.applyForTraining(
        trainingId: trainingId,
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
                  FilledButton(
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
        showDragHandle: true,
        useSafeArea: true,
        builder:
            (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Selected Applicants',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: SelectedTrainingApplicantsListWidget(
                    applicants: state.selectedApplicants,
                  ),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Training Details'),
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.training == null
              ? Center(child: Text(state.errorMessage ?? 'Training not found.'))
              : RefreshIndicator(
                onRefresh: () => notifier.fetchTrainingDetails(trainingId),
                child: ListView(
                  children: [
                    OpportunityDetailHeader(training: state.training!),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(state.training!.description),
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
                    else if (state.training!.currentUserApplicationStatus ==
                        null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Divider(height: 32),
                            Text(
                              'Apply for this Training',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: reasonController,
                              labelText: 'Reason for Applying (Optional)',
                              maxLines: 4,
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
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
