import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee/new_recruite/application/my_recruits_notifier.dart';
import 'package:police_com/features/employee/new_recruite/presentation/new_recruit_screen.dart';
import 'package:police_com/features/employee/new_recruite/presentation/widgets/recruit_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:toastification/toastification.dart';

class MyRecruitsScreen extends HookConsumerWidget {
  const MyRecruitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(myRecruitsNotifierProvider.notifier);
    final state = ref.watch(myRecruitsNotifierProvider);
    final scrollController = useScrollController();
    final hasSelection = state.selectedRecruitIds.isNotEmpty;

    useEffect(() {
      Future.microtask(() => notifier.fetchFirstPage());
      return null;
    }, const []);

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          notifier.fetchNextPage();
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    void showConfirmationSheet(RecruitStatus statusToApply) {
      final selectedRecruits =
          state.recruits
              .where((r) => state.selectedRecruitIds.contains(r.id))
              .toList();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:
            (ctx) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        context.lango.confirmAction, // <-- REPLACED
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.lango.confirmRecruitAction( // <-- REPLACED
                          status: statusToApply.name,
                          count: state.selectedRecruitIds.length,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (selectedRecruits.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: selectedRecruits.length,
                            itemBuilder: (context, index) {
                              final recruit = selectedRecruits[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          recruit.photoPath.isNotEmpty
                                              ? NetworkImage(recruit.photoPath)
                                              : null,
                                      onBackgroundImageError:
                                          recruit.photoPath.isNotEmpty
                                              ? (e, s) {}
                                              : null,
                                      child:
                                          recruit.photoPath.isEmpty
                                              ? Text(
                                                recruit.firstName[0],
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.labelSmall,
                                              )
                                              : null,
                                    ),
                                    const SizedBox(width: 12),
                                    Flexible(
                                      child: Text(
                                        context.lango.recruitIdentifier( // <-- REPLACED
                                          firstName: recruit.firstName,
                                          middleName: recruit.middleName,
                                          id: recruit.id ?? 0,
                                        ),
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(),
                      ],
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text(context.lango.cancel), // <-- REPLACED
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
                                    title: Text( // <-- REMOVED CONST
                                      context.lango.statusUpdatedSuccessfully, // <-- REPLACED
                                    ),
                                    type: ToastificationType.success,
                                  );
                                }
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    statusToApply == RecruitStatus.failed
                                        ? Theme.of(context).colorScheme.error
                                        : null,
                              ),
                              child: Text(
                                state.isUpdatingStatus
                                    ? context.lango.processing // <-- REPLACED
                                    : context.lango.confirmStatus(status: statusToApply.name.toCapitalized()), // <-- REPLACED
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
        title: context.lango.myRecruits, // <-- REPLACED
        actions:
            hasSelection
                ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FilledButton(
                      onPressed:
                          state.isUpdatingStatus
                              ? null
                              : () =>
                                  showConfirmationSheet(RecruitStatus.passed),
                      child: Text(context.lango.pass), // <-- REPLACED
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: OutlinedButton(
                      onPressed:
                          state.isUpdatingStatus
                              ? null
                              : () =>
                                  showConfirmationSheet(RecruitStatus.failed),
                      child: Text(
                        context.lango.fail, // <-- REPLACED
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
      body: RefreshIndicator(
        onRefresh: () => notifier.fetchFirstPage(),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: SegmentedButton<RecruitStatus>(
                  segments:
                      RecruitStatus.values
                          .map(
                            (status) => ButtonSegment<RecruitStatus>(
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hasSelection
                        ? context.lango.itemsSelected(count: state.selectedRecruitIds.length) // <-- REPLACED
                        : context.lango.selectRecruitsToContinue, // <-- REPLACED
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: notifier.selectAll,
                        child: Text(context.lango.markAll), // <-- REPLACED
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: notifier.unselectAll,
                        child: Text(context.lango.unmarkAll), // <-- REPLACED
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
                      : state.errorMessage != null && state.recruits.isEmpty
                      ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(state.errorMessage!),
                        ),
                      )
                      : ListView.builder(
                        controller: scrollController,
                        itemCount:
                            state.recruits.length +
                            (state.isFetchingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.recruits.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final recruit = state.recruits[index];
                          return RecruitListItemWidget(
                            recruit: recruit,
                            isSelected: state.selectedRecruitIds.contains(
                              recruit.id,
                            ),
                            onChanged:
                                (_) => notifier.toggleRecruitSelection(
                                  recruit.id!,
                                ),
                          );
                        },
                      ),
            ),
          ],
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
                    notifier.fetchFirstPage();
                  }
                },
                tooltip: context.lango.addNewRecruit, // <-- REPLACED
                child: const Icon(Icons.add),
              ),
    );
  }
} 