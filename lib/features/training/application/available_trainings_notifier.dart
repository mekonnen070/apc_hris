import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/training_repository.dart';
import '../domain/training.dart';

final availableTrainingsNotifierProvider =
    StateNotifierProvider<AvailableTrainingsNotifier, AsyncValue<List<Training>>>(
  (ref) => AvailableTrainingsNotifier(ref.watch(trainingRepositoryProvider)),
);

class AvailableTrainingsNotifier extends StateNotifier<AsyncValue<List<Training>>> {
  final ITrainingRepository _repository;

  AvailableTrainingsNotifier(this._repository) : super(const AsyncValue.loading()) {
    getAvailableTrainings();
  }

  Future<void> getAvailableTrainings() async {
    state = const AsyncValue.loading();
    try {
      final trainings = await _repository.getAvailableTrainings();
      state = AsyncValue.data(trainings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}