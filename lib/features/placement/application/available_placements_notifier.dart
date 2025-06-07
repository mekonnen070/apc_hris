import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement.dart';

part 'available_placements_notifier.freezed.dart';

final availablePlacementsNotifierProvider =
    StateNotifierProvider<AvailablePlacementsNotifier, AvailablePlacementsState>(
  (ref) => AvailablePlacementsNotifier(ref.watch(placementRepositoryProvider)),
);

@freezed
abstract class AvailablePlacementsState with _$AvailablePlacementsState {
  const factory AvailablePlacementsState({
    @Default([]) List<Placement> placements,
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore,
    @Default(true) bool canFetchMore,
    @Default(1) int page,
    String? errorMessage,
  }) = _AvailablePlacementsState;
}

class AvailablePlacementsNotifier extends StateNotifier<AvailablePlacementsState> {
  final IPlacementRepository _repository;
  final int _pageSize = 10;

  AvailablePlacementsNotifier(this._repository)
      : super(const AvailablePlacementsState());

  Future<void> fetchFirstPage() async {
    state = const AvailablePlacementsState();
    await _fetchPlacements();
  }

  Future<void> fetchNextPage() async {
    if (state.isFetchingMore || !state.canFetchMore) return;
    state = state.copyWith(isFetchingMore: true);
    await _fetchPlacements();
  }

  Future<void> _fetchPlacements() async {
    try {
      final newPlacements = await _repository.getAvailablePlacements(
        page: state.page,
        pageSize: _pageSize,
      );

      state = state.copyWith(
        placements: [...state.placements, ...newPlacements],
        page: state.page + 1,
        canFetchMore: newPlacements.length == _pageSize,
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