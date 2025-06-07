import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/training/data/training_repository.dart';
import 'package:police_com/features/training/domain/training.dart';

part 'available_trainings_notifier.freezed.dart';

final availableTrainingsNotifierProvider =
    StateNotifierProvider<AvailableTrainingsNotifier, AvailableTrainingsState>(
  (ref) => AvailableTrainingsNotifier(ref.watch(trainingRepositoryProvider)),
);

@freezed
abstract class AvailableTrainingsState with _$AvailableTrainingsState {
  const factory AvailableTrainingsState({
    @Default([]) List<Training> trainings,
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore,
    @Default(true) bool canFetchMore,
    @Default(1) int page,
    String? errorMessage,
  }) = _AvailableTrainingsState;
}

class AvailableTrainingsNotifier extends StateNotifier<AvailableTrainingsState> {
  final ITrainingRepository _repository;
  final int _pageSize = 10;

  AvailableTrainingsNotifier(this._repository)
      : super(const AvailableTrainingsState());

  Future<void> fetchFirstPage() async {
    state = const AvailableTrainingsState();
    await _fetchTrainings();
  }

  Future<void> fetchNextPage() async {
    if (state.isFetchingMore || !state.canFetchMore) return;
    state = state.copyWith(isFetchingMore: true);
    await _fetchTrainings();
  }

  Future<void> _fetchTrainings() async {
    try {
      final newTrainings = await _repository.getAvailableTrainings(
        page: state.page,
        pageSize: _pageSize,
      );

      state = state.copyWith(
        trainings: [...state.trainings, ...newTrainings],
        page: state.page + 1,
        canFetchMore: newTrainings.length == _pageSize,
        isLoading: false,
        isFetchingMore: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
        isFetchingMore: false,
      );
    }
  }
}