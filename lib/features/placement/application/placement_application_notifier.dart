import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

final placementApplicationNotifierProvider = StateNotifierProvider.autoDispose<
  PlacementApplicationNotifier,
  AsyncValue<void>
>(
  (ref) => PlacementApplicationNotifier(ref.watch(placementRepositoryProvider)),
);

class PlacementApplicationNotifier extends StateNotifier<AsyncValue<void>> {
  final IPlacementRepository _repository;

  PlacementApplicationNotifier(this._repository)
    : super(const AsyncValue.data(null));

  Future<void> applyForPlacement(PlacementApplicant application) async {
    state = const AsyncValue.loading();
    try {
      await _repository.applyForPlacement(application);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
