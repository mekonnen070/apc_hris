// lib/features/employee/new_recruite/application/my_recruits_notifier.dart

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/new_recruite/data/new_recruit_repository.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';

part 'my_recruits_notifier.freezed.dart';

final myRecruitsNotifierProvider =
    StateNotifierProvider<MyRecruitsNotifier, MyRecruitsState>(
      (ref) => MyRecruitsNotifier(ref.watch(recruitRepositoryProvider)),
    );

@freezed
abstract class MyRecruitsState with _$MyRecruitsState {
  const factory MyRecruitsState({
    @Default([]) List<RecruitInfo> recruits,
    @Default({}) Set<String> selectedRecruitIds,
    @Default(true) bool isLoading,
    @Default(false) bool isUpdatingStatus,
    @Default(NewRecruitStatus.pending) NewRecruitStatus filterStatus,
    String? errorMessage,
  }) = _MyRecruitsState;
}

class MyRecruitsNotifier extends StateNotifier<MyRecruitsState> {
  final IRecruitRepository _repository;
  MyRecruitsNotifier(this._repository) : super(const MyRecruitsState()) {
    // load initial data
    fetchRecruits();
  }

  /// Load all recruits and apply current [filterStatus]
  Future<void> fetchRecruits() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all = await _repository.getRecruits();
      final filtered =
          all.where((r) => r.recruitStatus == state.filterStatus).toList();
      state = state.copyWith(recruits: filtered, isLoading: false);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  /// Change the status filter and reload
  void changeFilter(NewRecruitStatus newStatus) {
    if (state.filterStatus == newStatus) return;
    state = state.copyWith(filterStatus: newStatus);
    fetchRecruits();
  }

  /// Update status for each selected recruit
  Future<bool> processSelectedRecruits(NewRecruitStatus newStatus) async {
    if (state.selectedRecruitIds.isEmpty) return false;
    state = state.copyWith(isUpdatingStatus: true, errorMessage: null);
    try {
      for (final id in state.selectedRecruitIds) {
        final info = state.recruits.firstWhere((r) => r.recruitId == id);
        await _repository.editRecruit(
          id: id,
          info: info.copyWith(recruitStatus: newStatus),
        );
      }
      await fetchRecruits();
      state = state.copyWith(isUpdatingStatus: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isUpdatingStatus: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Toggle a single recruit’s selection
  void toggleRecruitSelection(String recruitId) {
    final sel = Set<String>.from(state.selectedRecruitIds);
    if (!sel.add(recruitId)) sel.remove(recruitId);
    state = state.copyWith(selectedRecruitIds: sel);
  }

  /// Select *all* currently visible recruits
  void selectAll() {
    final allIds = state.recruits.map((r) => r.recruitId!).toSet();
    state = state.copyWith(selectedRecruitIds: allIds);
  }

  /// Clear all selections
  void unselectAll() {
    state = state.copyWith(selectedRecruitIds: {});
  }
}
