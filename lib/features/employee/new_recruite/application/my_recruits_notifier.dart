import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/new_recruite/data/new_recruit_repository.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';

part 'my_recruits_notifier.freezed.dart';

final myRecruitsNotifierProvider =
    StateNotifierProvider<MyRecruitsNotifier, MyRecruitsState>(
  (ref) => MyRecruitsNotifier(ref.watch(newRecruitRepositoryProvider)),
);

@freezed
abstract class MyRecruitsState with _$MyRecruitsState {
  const factory MyRecruitsState({
    @Default([]) List<RecruitInfo> recruits,
    @Default({}) Set<int> selectedRecruitIds,
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore,
    @Default(false) bool isUpdatingStatus,
    @Default(true) bool canFetchMore,
    @Default(1) int page,
    @Default(RecruitStatus.noStatus) RecruitStatus filterStatus,
    String? errorMessage,
  }) = _MyRecruitsState;
}

class MyRecruitsNotifier extends StateNotifier<MyRecruitsState> {
  final INewRecruitRepository _repository;
  final int _pageSize = 15;

  MyRecruitsNotifier(this._repository) : super(const MyRecruitsState());

  Future<void> fetchFirstPage() async {
    state = state.copyWith(
        page: 1, recruits: [], selectedRecruitIds: {}, isLoading: true);
    await _fetchRecruits();
  }

  Future<void> fetchNextPage() async {
    if (state.isFetchingMore || !state.canFetchMore) return;
    state = state.copyWith(isFetchingMore: true);
    await _fetchRecruits();
  }

  Future<void> _fetchRecruits() async {
    try {
      final newRecruits = await _repository.getMyRecruits(
        page: state.page,
        pageSize: _pageSize,
        status: state.filterStatus,
      );

      state = state.copyWith(
        recruits: [...state.recruits, ...newRecruits],
        page: state.page + 1,
        canFetchMore: newRecruits.length == _pageSize,
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

  void changeFilter(RecruitStatus newStatus) {
    if (state.filterStatus == newStatus) return;
    state = state.copyWith(filterStatus: newStatus);
    fetchFirstPage();
  }

  Future<bool> processSelectedRecruits(RecruitStatus newStatus) async {
    if (state.selectedRecruitIds.isEmpty) return false;
    state = state.copyWith(isUpdatingStatus: true);
    try {
      await _repository.updateRecruitsStatus(
        recruitIds: state.selectedRecruitIds.toList(),
        status: newStatus,
      );
      await fetchFirstPage();
      state = state.copyWith(isUpdatingStatus: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          isUpdatingStatus: false, errorMessage: 'Failed to update status.');
      return false;
    }
  }

  void toggleRecruitSelection(int recruitId) {
    final newSet = Set<int>.from(state.selectedRecruitIds);
    if (newSet.contains(recruitId)) {
      newSet.remove(recruitId);
    } else {
      newSet.add(recruitId);
    }
    state = state.copyWith(selectedRecruitIds: newSet);
  }

  void selectAll() {
    final allIds = state.recruits.map((r) => r.id!).toSet();
    state = state.copyWith(selectedRecruitIds: allIds);
  }

  void unselectAll() {
    state = state.copyWith(selectedRecruitIds: {});
  }
}