import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/new_recruite/data/new_recruit_repository.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruitment_announcement.dart';

part 'new_recruit_notifier.freezed.dart';

final newRecruitNotifierProvider =
    StateNotifierProvider<NewRecruitNotifier, NewRecruitState>(
      (ref) => NewRecruitNotifier(ref.watch(recruitRepositoryProvider)),
    );

@freezed
abstract class NewRecruitState with _$NewRecruitState {
  const factory NewRecruitState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    String? successMessage,
    String? errorMessage,
    RecruitInfo? createRequest,
    @Default([]) List<RecruitmentAnnouncement> announcements,
  }) = _NewRecruitState;
}

class NewRecruitNotifier extends StateNotifier<NewRecruitState> {
  final IRecruitRepository _repository;

  NewRecruitNotifier(this._repository) : super(const NewRecruitState()) {
    _loadAnnouncements();
  }

  Future<void> _loadAnnouncements() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final anns = await _repository.getRecruitmentAnnouncements();
      state = state.copyWith(isLoading: false, announcements: anns);
    } catch (e, st) {
      // FIX: Added detailed logging to the catch block as requested.
      log('Failed to parse announcements!', error: e, stackTrace: st);
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load announcements.',
      );
    }
  }

  void updateCreateRequest(RecruitInfo req) {
    state = state.copyWith(createRequest: req);
  }

  Future<void> submitNewRecruit(RecruitInfo req) async {
    state = state.copyWith(
      isSubmitting: true,
      createRequest: req, // Store the request being sent
      errorMessage: null,
      successMessage: null,
    );
    try {
      await _repository.createRecruit(req);
      state = state.copyWith(
        isSubmitting: false,
        successMessage: 'Recruit submitted successfully!',
        createRequest: null, // Clear the form on success
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }

  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
  }
}
