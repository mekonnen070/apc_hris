import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

part 'placement_detail_notifier.freezed.dart';

final placementDetailNotifierProvider =
    StateNotifierProvider<PlacementDetailNotifier, PlacementDetailState>(
      (ref) => PlacementDetailNotifier(ref.watch(placementRepositoryProvider)),
    );

@freezed
abstract class PlacementDetailState with _$PlacementDetailState {
  const factory PlacementDetailState({
    Placement? placement,
    PlacementApplicant? myApplication,
    @Default([]) List<PlacementApplicant> selectedApplicants,
    @Default(true) bool isLoading,
    @Default(false) bool isApplying,
    @Default(false) bool isSubmittingAppeal,
    String? errorMessage,
  }) = _PlacementDetailState;
}

class PlacementDetailNotifier extends StateNotifier<PlacementDetailState> {
  final IPlacementRepository _repository;

  PlacementDetailNotifier(this._repository)
    : super(const PlacementDetailState());

  Future<void> fetchPlacementDetails(int placementId) async {
    state = const PlacementDetailState();
    try {
      final placementDetails = await _repository.getPlacementDetails(
        placementId: placementId,
      );
      state = state.copyWith(placement: placementDetails);

      final myApplication = await _repository.getMyApplicationForPlacement(
        placementId: placementId,
      );
      state = state.copyWith(myApplication: myApplication);

      if (myApplication.status == ApplicantStatus.notSelected) {
        final selected = await _repository.getSelectedApplicants(
          placementId: placementId,
        );
        state = state.copyWith(selectedApplicants: selected);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<bool> applyForPlacement({
    required int placementId,
    required String reason,
  }) async {
    state = state.copyWith(isApplying: true);
    try {
      await _repository.applyForPlacement(
        placementId: placementId,
        reason: reason,
      );
      await fetchPlacementDetails(placementId);
      state = state.copyWith(isApplying: false);
      return true;
    } catch (e) {
      state = state.copyWith(isApplying: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<bool> submitAppeal({required String appealReason}) async {
    if (state.myApplication == null) return false;
    state = state.copyWith(isSubmittingAppeal: true);
    try {
      await _repository.submitAppeal(
        applicationId: state.myApplication!.placementApplicantId,
        appealReason: appealReason,
      );
      await fetchPlacementDetails(state.myApplication!.placementAnnouncementId);
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
