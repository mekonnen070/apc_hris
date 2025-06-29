import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/training/application/available_trainings_notifier.dart';
import 'package:police_com/features/training/presentation/training_detail_screen.dart';
import 'package:police_com/features/training/presentation/widgets/training_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';

class AvailableTrainingsScreen extends HookConsumerWidget {
  const AvailableTrainingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(availableTrainingsNotifierProvider.notifier);
    final state = ref.watch(availableTrainingsNotifierProvider);
    final scrollController = useScrollController();

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

    return Scaffold(
      appBar: AppBarWidget(
        title: context.lango.availableTrainings,
      ), // <-- REPLACED & REMOVED CONST
      body: RefreshIndicator(
        onRefresh: () => notifier.fetchFirstPage(),
        child:
            state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null && state.trainings.isEmpty
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(state.errorMessage!),
                  ),
                )
                : ListView.builder(
                  controller: scrollController,
                  itemCount:
                      state.trainings.length + (state.isFetchingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.trainings.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final training = state.trainings[index];
                    return TrainingListItemWidget(
                      training: training,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (_) => TrainingDetailScreen(
                                  trainingId: training.trainingId,
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
      ),
    );
  }
}
