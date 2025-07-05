import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/training/domain/training_application_request.dart';

import '../data/training_repository.dart';
import '../domain/training_applicant.dart';

final trainingApplicationNotifierProvider = StateNotifierProvider<
  TrainingApplicationNotifier,
  AsyncValue<void>
>((ref) => TrainingApplicationNotifier(ref.watch(trainingRepositoryProvider)));

class TrainingApplicationNotifier extends StateNotifier<AsyncValue<void>> {
  final ITrainingRepository _repository;

  TrainingApplicationNotifier(this._repository)
    : super(const AsyncValue.data(null));

  Future<void> applyForTraining(TrainingApplicationRequest applicationRequest) async {
    state = const AsyncValue.loading();
    try {
      await _repository.applyForTraining(applicationRequest);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
