import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/training/data/training_repository.dart';
import 'package:police_com/features/training/domain/training.dart';
import 'package:police_com/features/training/domain/training_applicant.dart';

part 'training_detail_notifier.freezed.dart';

final trainingDetailNotifierProvider =
    StateNotifierProvider<TrainingDetailNotifier, TrainingDetailState>(
      (ref) => TrainingDetailNotifier(ref.watch(trainingRepositoryProvider)),
    );

@freezed
abstract class TrainingDetailState with _$TrainingDetailState {
  const factory TrainingDetailState({
    Training? training,
    TrainingApplicant? myApplication,
    @Default([]) List<TrainingApplicant> selectedApplicants,
    @Default(true) bool isLoading,
    @Default(false) bool isApplying,
    @Default(false) bool isSubmittingAppeal,
    String? errorMessage,
  }) = _TrainingDetailState;
}

class TrainingDetailNotifier extends StateNotifier<TrainingDetailState> {
  final ITrainingRepository _repository;

  TrainingDetailNotifier(this._repository) : super(const TrainingDetailState());

  Future<void> fetchTrainingDetails(int trainingId) async {
    state = const TrainingDetailState();
    try {
      final trainingDetails = await _repository.getTrainingDetails(
        trainingId: trainingId,
      );
      state = state.copyWith(training: trainingDetails);

      final myApplication = await _repository.getMyApplicationForTraining(
        trainingId: trainingId,
      );
      state = state.copyWith(myApplication: myApplication);

      if (myApplication.status == ApplicantStatus.notSelected) {
        final selected = await _repository.getSelectedApplicants(
          trainingId: trainingId,
        );
        state = state.copyWith(selectedApplicants: selected);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      // If getMyApplicationForTraining fails, it's not a critical error, just means user hasn't applied.
      // We still want to show the training details.
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<bool> applyForTraining({
    required int trainingId,
    required String reason,
  }) async {
    state = state.copyWith(isApplying: true);
    try {
      await _repository.applyForTraining(
        trainingId: trainingId,
        reason: reason,
      );
      await fetchTrainingDetails(trainingId); // Refresh data after applying
      state = state.copyWith(isApplying: false);
      return true;
    } catch (e) {
      state = state.copyWith(isApplying: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<bool> submitAppeal({required String appealReason}) async {
    if (state.myApplication == null) {
      state = state.copyWith(errorMessage: 'Application not found.');
      return false;
    }
    state = state.copyWith(isSubmittingAppeal: true);
    try {
      await _repository.submitAppeal(
        applicationId: state.myApplication!.trainingApplicantId,
        appealReason: appealReason,
      );
      await fetchTrainingDetails(
        state.myApplication!.trainingId,
      ); // Refresh data
      state = state.copyWith(isSubmittingAppeal: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmittingAppeal: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}
