import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart'; // Barrel file for enums
import 'package:police_com/features/employee_profile/application/employee_list_state.dart';
// Import the state, models, and enums
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

// TODO: Define and import your actual Employee API service/repository.
// abstract class IEmployeeRepository {
//   Future<(List<EmployeeInfoModel> employees, bool hasMore)> getEmployees({
//     required int page,
//     required int limit,x
//     String? searchQuery,
//   });
// }
// class MockEmployeeRepository implements IEmployeeRepository { /* ... mock implementation ... */ }

class EmployeeListNotifier extends StateNotifier<EmployeeListState> {
  // final IEmployeeRepository _employeeRepository; // TODO: Inject repository

  EmployeeListNotifier(/*this._employeeRepository*/)
    : super(const EmployeeListState()) {
    // Automatically fetch the initial list when the notifier is first created.
    fetchInitialEmployees();
  }

  // Internal flag to prevent concurrent fetches.
  bool _isFetching = false;

  Future<void> fetchInitialEmployees({
    String? query,
    bool isRefresh = false,
  }) async {
    if (_isFetching && !isRefresh) return;
    _isFetching = true;

    state = state.copyWith(
      isLoadingInitial: true,
      errorMessage: null,
      currentSearchQuery: query ?? (isRefresh ? state.currentSearchQuery : ''),
      employees: [], // Always clear the list for a new search or refresh
      currentPage: 0,
      canLoadMore: true,
    );

    try {
      const nextPage = 1; // API pages are often 1-indexed
      // final result = await _employeeRepository.getEmployees(
      //   page: nextPage,
      //   limit: EmployeeListState.itemsPerPage,
      //   searchQuery: state.currentSearchQuery,
      // );

      // --- MOCK IMPLEMENTATION ---
      // This now provides all required fields for EmployeeInfoModel to prevent compile errors.
      await Future.delayed(const Duration(seconds: 1));
      final mockEmployees = List.generate(
        EmployeeListState.itemsPerPage,
        (i) => EmployeeInfoModel(
          employeeId:
              'EMP${(nextPage - 1) * EmployeeListState.itemsPerPage + i + 1}',
          firstName: 'Employee ${state.currentSearchQuery}'.trim(),
          fatherName: 'Father ${i + 1}',
          grandName: 'Grand ${i + 1}',
          positionId: i.isEven ? 'Developer' : 'Officer',
          gender: i.isEven ? Gender.male : Gender.female,
          birthDate: DateTime(1990 + i),
          hiredDate: DateTime(2020),
          address1: '123 Main St',
          phone: '0911223344',
          mobile: '0911223344',
          email: 'employee${i + 1}@police.com',
          photoUrl:
              'https://i.pravatar.cc/150?u=emp${i + 1}', // Using a placeholder image service
        ),
      );
      const bool mockHasMore = true;
      // --- END MOCK ---

      state = state.copyWith(
        employees: mockEmployees, // result.employees,
        currentPage: nextPage,
        canLoadMore: mockHasMore, // result.hasMore,
        isLoadingInitial: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        isLoadingInitial: false,
        canLoadMore: false,
      );
    } finally {
      _isFetching = false;
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoadingMore || !state.canLoadMore || _isFetching) return;

    _isFetching = true;
    state = state.copyWith(isLoadingMore: true, errorMessage: null);

    try {
      final nextPage = state.currentPage + 1;
      // final result = await _employeeRepository.getEmployees(
      //   page: nextPage,
      //   limit: EmployeeListState.itemsPerPage,
      //   searchQuery: state.currentSearchQuery,
      // );

      // --- MOCK IMPLEMENTATION ---
      await Future.delayed(const Duration(seconds: 1));
      final newMockEmployees = List.generate(
        EmployeeListState.itemsPerPage,
        (i) => EmployeeInfoModel(
          employeeId:
              'EMP${(nextPage - 1) * EmployeeListState.itemsPerPage + i + 1}',
          firstName: 'Employee ${state.currentSearchQuery}'.trim(),
          fatherName:
              'Father ${(nextPage - 1) * EmployeeListState.itemsPerPage + i + 1}',
          grandName:
              'Grand ${(nextPage - 1) * EmployeeListState.itemsPerPage + i + 1}',
          positionId: i.isEven ? 'Sergeant' : 'Inspector',
          gender: i.isEven ? Gender.male : Gender.female,
          birthDate: DateTime(1990 + i),
          hiredDate: DateTime(2020),
          address1: '456 Side St',
          phone: '0911223355',
          mobile: '0911223355',
          email: 'employee.new${i + 1}@police.com',
          photoUrl:
              'https://i.pravatar.cc/150?u=emp${(nextPage - 1) * EmployeeListState.itemsPerPage + i + 1}',
        ),
      );
      final bool mockHasMore = nextPage < 5; // Simulate having 5 pages total
      // --- END MOCK ---

      final updatedEmployees = List<EmployeeInfoModel>.from(state.employees)
        ..addAll(newMockEmployees /*result.employees*/);

      state = state.copyWith(
        employees: updatedEmployees,
        currentPage: nextPage,
        canLoadMore: mockHasMore, // result.hasMore,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoadingMore: false);
    } finally {
      _isFetching = false;
    }
  }

  Future<void> search(String query) async {
    // Calling fetchInitialEmployees with a new query will reset the list and pagination.
    await fetchInitialEmployees(query: query.trim());
  }

  // Changed to refreshList for clarity and to match the UI's expected method name.
  Future<void> refreshList() async {
    // Re-fetches the first page with the current search query.
    await fetchInitialEmployees(
      query: state.currentSearchQuery,
      isRefresh: true,
    );
  }
}
