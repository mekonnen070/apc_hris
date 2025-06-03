import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/vacancy_status.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/vacancy_model.dart';

part 'vacancy_list_state.freezed.dart';

@freezed
abstract class VacancyListState with _$VacancyListState {
  const factory VacancyListState({
    @Default([]) List<VacancyModel> vacancies,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(VacancyStatus.open)
    VacancyStatus filterStatus, // Default to show Open vacancies
    @Default('') String searchQuery,
    @Default(0) int currentPage, // For pagination if needed in future
    @Default(true) bool canLoadMore, // For pagination
  }) = _VacancyListState;

  static const int itemsPerPage = 15; // For pagination
}
