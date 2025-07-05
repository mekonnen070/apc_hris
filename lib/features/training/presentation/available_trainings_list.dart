import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/training/application/available_trainings_notifier.dart';
import 'package:police_com/features/training/presentation/widgets/training_list_item_widget.dart';

class AvailableTrainingsList extends ConsumerWidget {
  const AvailableTrainingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(availableTrainingsNotifierProvider);

    return state.when(
      data: (trainings) {
        if (trainings.isEmpty) {
          return const Center(
            child: Text('No available trainings at the moment.'),
          );
        }
        return RefreshIndicator(
          onRefresh:
              () async => ref.invalidate(availableTrainingsNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: trainings.length,
            itemBuilder: (context, index) {
              final training = trainings[index];
              return TrainingListItemWidget(training: training);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
