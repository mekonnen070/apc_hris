import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';

import '../data/training_repository.dart';
import '../domain/training_applicant.dart';

final myTrainingApplicationsNotifierProvider = StateNotifierProvider<
  MyTrainingApplicationsNotifier,
  AsyncValue<List<TrainingApplicant>>
>(
  (ref) => MyTrainingApplicationsNotifier(
    ref.watch(trainingRepositoryProvider),
    ref.watch(currentEmployeeIdProvider)!,
  ),
);

class MyTrainingApplicationsNotifier
    extends StateNotifier<AsyncValue<List<TrainingApplicant>>> {
  final ITrainingRepository _repository;
  final String _employeeId;

  MyTrainingApplicationsNotifier(this._repository, this._employeeId)
    : super(const AsyncValue.loading()) {
    getMyApplications();
  }

  Future<void> getMyApplications() async {
    state = const AsyncValue.loading();
    try {
      final applications = await _repository.getMyApplications(
        employeeId: _employeeId,
      );
      state = AsyncValue.data(applications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
