import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';

final availablePlacementsNotifierProvider = StateNotifierProvider.autoDispose<
    AvailablePlacementsNotifier, AsyncValue<List<PlacementAnnouncement>>>(
  (ref) => AvailablePlacementsNotifier(ref.watch(placementRepositoryProvider)),
);

class AvailablePlacementsNotifier
    extends StateNotifier<AsyncValue<List<PlacementAnnouncement>>> {
  final IPlacementRepository _repository;

  AvailablePlacementsNotifier(this._repository)
      : super(const AsyncValue.loading()) {
    getAvailablePlacements();
  }

  Future<void> getAvailablePlacements() async {
    state = const AsyncValue.loading();
    try {
      final placements = await _repository.getPlacementAnnouncements();
      state = AsyncValue.data(placements);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}