import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/training/data/training_repository.dart';
import 'package:police_com/features/training/domain/training.dart';

/// Provider for the TrainingDetailNotifier.
/// We use .family to pass the training ID to the notifier.
final trainingDetailNotifierProvider = StateNotifierProvider.autoDispose
    .family<TrainingDetailNotifier, AsyncValue<Training>, String>(
      (ref, id) =>
          TrainingDetailNotifier(ref.watch(trainingRepositoryProvider), id),
    );

class TrainingDetailNotifier extends StateNotifier<AsyncValue<Training>> {
  final ITrainingRepository _repository;
  final String _trainingId;

  TrainingDetailNotifier(this._repository, this._trainingId)
    : super(const AsyncValue.loading()) {
    _fetchTrainingDetail();
  }

  Future<void> _fetchTrainingDetail() async {
    state = const AsyncValue.loading();
    try {
      final training = await _repository.getTrainingDetail(_trainingId);
      state = AsyncValue.data(training);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
