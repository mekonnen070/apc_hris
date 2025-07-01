import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/placement/data/placement_repository.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

part 'placement_application_notifier.freezed.dart';

/// Provider for the application submission logic.
final placementApplicationNotifierProvider = StateNotifierProvider.autoDispose<
  PlacementApplicationNotifier,
  PlacementApplicationState
>((ref) => PlacementApplicationNotifier(ref));

/// State for the application submission process.
@freezed
abstract class PlacementApplicationState with _$PlacementApplicationState {
  const factory PlacementApplicationState({
    @Default(false) bool isSubmitting,
    String? successMessage,
    String? errorMessage,
  }) = _PlacementApplicationState;
}

class PlacementApplicationNotifier
    extends StateNotifier<PlacementApplicationState> {
  final Ref _ref;
  PlacementApplicationNotifier(this._ref)
    : super(const PlacementApplicationState());

  /// Submits an application for a given placement announcement.
  Future<void> apply({required int announcementId}) async {
    state = state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    );

    final employeeId = _ref.read(currentEmployeeIdProvider);
    if (employeeId == null) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'User not authenticated. Cannot apply.',
      );
      return;
    }

    try {
      final application = PlacementApplicant(
        applicantId: 0, // The database will assign the ID.
        pAnnouncementId: announcementId,
        employeeId: employeeId,
        entryDate: DateTime.now(),
        entryBy: employeeId, // The logged-in user is the one entering the data.
        policeTitle: 0, // Placeholder, as this seems to be a required int.
        applicantStatus: ApplicantStatus.pending,
      );

      await _ref
          .read(placementRepositoryProvider)
          .applyForPlacement(application);

      state = state.copyWith(
        isSubmitting: false,
        successMessage: 'Application submitted successfully!',
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
}
