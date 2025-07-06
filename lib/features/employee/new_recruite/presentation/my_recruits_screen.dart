import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee/new_recruite/application/my_recruits_notifier.dart';
import 'package:police_com/features/employee/new_recruite/presentation/new_recruit_screen.dart';
import 'package:police_com/features/employee/new_recruite/presentation/widgets/recruit_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:toastification/toastification.dart';

class MyRecruitsScreen extends ConsumerWidget {
  const MyRecruitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(myRecruitsNotifierProvider.notifier);
    final state = ref.watch(myRecruitsNotifierProvider);
    final hasSelection = state.selectedRecruitIds.isNotEmpty;

    void showConfirmationSheet(NewRecruitStatus statusToApply) {
      // Correctly get the list of selected recruits to display them
      final selectedRecruits =
          state.recruits
              .where((r) => state.selectedRecruitIds.contains(r.recruitId))
              .toList();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:
            (ctx) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        context.lango.confirmAction,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.lango.confirmRecruitAction(
                          status: statusToApply.name,
                          count: state.selectedRecruitIds.length,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      // Use the 'selectedRecruits' variable here
                      Expanded(
                        child: ListView.builder(
                          itemCount: selectedRecruits.length,
                          itemBuilder: (context, index) {
                            final recruit = selectedRecruits[index];
                            return ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                child: Text(
                                  (recruit.firstName?.isNotEmpty ?? false)
                                      ? recruit.firstName![0].toUpperCase()
                                      : '?',
                                ),
                              ),
                              title: Text(
                                '${recruit.firstName ?? ''} ${recruit.fatherName ?? ''}'
                                    .trim(),
                              ),
                              subtitle: Text(
                                context.lango.id(
                                  id: recruit.recruitId ?? 'N/A',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text(context.lango.cancel),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FilledButton(
                              onPressed: () async {
                                Navigator.of(ctx).pop();
                                final success = await notifier
                                    .processSelectedRecruits(statusToApply);
                                if (success && context.mounted) {
                                  toastification.show(
                                    context: context,
                                    title: Text(
                                      context.lango.statusUpdatedSuccessfully,
                                    ),
                                    type: ToastificationType.success,
                                  );
                                }
                              },
                              // Use the correct enum values here
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    statusToApply == NewRecruitStatus.failed
                                        ? Theme.of(context).colorScheme.error
                                        : null,
                              ),
                              child: Text(
                                state.isUpdatingStatus
                                    ? context.lango.processing
                                    : context.lango.confirmStatus(
                                      status:
                                          statusToApply.name.toCapitalized(),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: context.lango.myRecruits,
        actions:
            hasSelection
                ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FilledButton(
                      onPressed:
                          state.isUpdatingStatus
                              ? null
                              // Use the correct enum value
                              : () => showConfirmationSheet(
                                NewRecruitStatus.passed,
                              ),
                      child: Text(context.lango.pass),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: OutlinedButton(
                      onPressed:
                          state.isUpdatingStatus
                              ? null
                              // Use the correct enum value
                              : () => showConfirmationSheet(
                                NewRecruitStatus.failed,
                              ),
                      child: Text(
                        context.lango.fail,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ]
                : null,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: notifier.fetchRecruits,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: SegmentedButton<NewRecruitStatus>(
                    segments:
                        NewRecruitStatus.values
                            .map(
                              (status) => ButtonSegment<NewRecruitStatus>(
                                value: status,
                                label: FittedBox(
                                  child: Text(status.name.toDisplayCase()),
                                ),
                              ),
                            )
                            .toList(),
                    selected: {state.filterStatus},
                    onSelectionChanged: (newSelection) {
                      notifier.changeFilter(newSelection.first);
                    },
                  ),
                ),
              ),
              if (state.recruits.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          hasSelection
                              ? context.lango.itemsSelected(
                                count: state.selectedRecruitIds.length,
                              )
                              : context.lango.selectRecruitsToContinue,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: notifier.selectAll,
                            child: Text(context.lango.markAll),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: notifier.unselectAll,
                            child: Text(context.lango.unmarkAll),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Expanded(
                child:
                    state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.errorMessage != null
                        ? const Center(child: Text('Something went wrong!'))
                        : state.recruits.isEmpty
                        ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(context.lango.noRecruitsFound),
                          ),
                        )
                        : ListView.builder(
                          itemCount: state.recruits.length,
                          itemBuilder: (context, index) {
                            final recruit = state.recruits[index];
                            return RecruitListItemWidget(
                              recruit: recruit,
                              isSelected: state.selectedRecruitIds.contains(
                                recruit.recruitId,
                              ),
                              onChanged:
                                  (_) => notifier.toggleRecruitSelection(
                                    recruit.recruitId!,
                                  ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          hasSelection
              ? null
              : FloatingActionButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push<bool>(
                    MaterialPageRoute(builder: (_) => const NewRecruitScreen()),
                  );
                  if (result == true) {
                    notifier.fetchRecruits();
                  }
                },
                tooltip: context.lango.addNewRecruit,
                child: const Icon(Icons.add),
              ),
    );
  }
}
