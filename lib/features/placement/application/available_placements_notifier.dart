import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';

/// Provider that fetches and exposes the list of available placements.
/// The UI will watch this to display the announcements.
final availablePlacementsProvider = AutoDisposeAsyncNotifierProvider<
  AvailablePlacementsNotifier,
  List<PlacementAnnouncement>
>(AvailablePlacementsNotifier.new);

class AvailablePlacementsNotifier
    extends AutoDisposeAsyncNotifier<List<PlacementAnnouncement>> {
  @override
  FutureOr<List<PlacementAnnouncement>> build() {
    // Immediately fetch the announcements when the provider is first read.
    return _fetchAnnouncements();
  }

  Future<List<PlacementAnnouncement>> _fetchAnnouncements() async {
    final repository = ref.read(placementRepositoryProvider);
    return repository.getPlacementAnnouncements();
  }

  /// Allows the UI to manually trigger a refresh of the data.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchAnnouncements());
  }
}
