import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

part 'employee_list_state.freezed.dart';

@freezed
abstract class EmployeeListState with _$EmployeeListState {
  const factory EmployeeListState({
    @Default([]) List<EmployeeInfoModel> employees,
    // True when fetching the very first set of data or after a search/refresh.
    @Default(false) bool isLoadingInitial,
    // True when fetching subsequent sets of data for infinite scroll.
    @Default(false) bool isLoadingMore,
    String? errorMessage,
    // The last successfully fetched page number. Starts at 0 or 1 depending on API.
    @Default(0) int currentPage,
    // Indicates if there are more items to fetch from the backend.
    @Default(true) bool canLoadMore,
    @Default('') String currentSearchQuery,
    // Optional: If your API returns total items, it can be stored here.
    int? totalItems,
  }) = _EmployeeListState;

  const EmployeeListState._(); // Private constructor for getters

  // Example: Items per page, can be a constant elsewhere
  static const int itemsPerPage = 20;
}