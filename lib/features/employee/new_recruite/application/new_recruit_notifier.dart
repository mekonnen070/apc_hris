import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/new_recruite/data/new_recruit_repository.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruitment_announcement.dart';

part 'new_recruit_notifier.freezed.dart';

final newRecruitNotifierProvider =
    StateNotifierProvider<NewRecruitNotifier, NewRecruitState>(
      (ref) => NewRecruitNotifier(ref.watch(newRecruitRepositoryProvider)),
    );

@freezed
abstract class NewRecruitState with _$NewRecruitState {
  const factory NewRecruitState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    String? successMessage,
    String? errorMessage,
    RecruitInfo? recruitInfo,
    @Default([]) List<RecruitmentAnnouncement> announcements,
  }) = _NewRecruitState;
}

class NewRecruitNotifier extends StateNotifier<NewRecruitState> {
  final INewRecruitRepository _repository;

  NewRecruitNotifier(this._repository) : super(const NewRecruitState());

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final announcements = await _repository.getRecruitmentAnnouncements();
      state = state.copyWith(isLoading: false, announcements: announcements);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load announcements.',
      );
    }
  }

  void updateRecruitInfo(RecruitInfo info) {
    state = state.copyWith(recruitInfo: info);
  }

  Future<void> submitNewRecruit() async {
    state = state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    );
    try {
      if (state.recruitInfo == null) {
        throw Exception('Recruit information is missing.');
      }
      await _repository.createRecruit(state.recruitInfo!);
      state = state.copyWith(
        isSubmitting: false,
        successMessage: 'Recruit submitted successfully!',
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }

  void clearMessages() {
    state = state.copyWith(successMessage: null, errorMessage: null);
  }
}
