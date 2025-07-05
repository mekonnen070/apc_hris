import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';

final placementDetailNotifierProvider = StateNotifierProvider.autoDispose
    .family<PlacementDetailNotifier, AsyncValue<PlacementAnnouncement>, int>(
  (ref, id) => PlacementDetailNotifier(
    ref.watch(placementRepositoryProvider),
    id,
  ),
);

class PlacementDetailNotifier
    extends StateNotifier<AsyncValue<PlacementAnnouncement>> {
  final IPlacementRepository _repository;
  final int _placementId;

  PlacementDetailNotifier(this._repository, this._placementId)
      : super(const AsyncValue.loading()) {
    _fetchPlacementDetail();
  }

  Future<void> _fetchPlacementDetail() async {
    state = const AsyncValue.loading();
    try {
      final placement =
          await _repository.getPlacementAnnouncementDetail(_placementId);
      state = AsyncValue.data(placement);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}