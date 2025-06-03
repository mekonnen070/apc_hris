// lib/features/employee_profile/application/employee_list_notifier.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart'; // Barrel file for enums
import 'package:police_com/features/employee/employee_profile/application/states/employee_list_state.dart';
// Import the state, models, and enums
import 'package:police_com/features/employee/employee_profile/domain/employee_info_model.dart';

// TODO: Define and import your actual Employee API service/repository.
// abstract class IEmployeeRepository {
//   Future<(List<EmployeeInfoModel> employees, bool hasMore)> getEmployees({
//     required int page,
//     required int limit,
//     String? searchQuery,
//   });
// }
// class MockEmployeeRepository implements IEmployeeRepository { /* ... mock implementation ... */ }

class EmployeeListNotifier extends StateNotifier<EmployeeListState> {
  // final IEmployeeRepository _employeeRepository; // TODO: Inject repository

  EmployeeListNotifier() : super(const EmployeeListState()) {
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

      // --- MOCK IMPLEMENTATION (Police Context) ---
      await Future.delayed(const Duration(seconds: 1));
      final policeRanks = [
        'Constable',
        'Sergeant',
        'Inspector',
        'Chief Inspector',
        'Superintendent',
        'Commander',
      ];
      final firstNames = [
        'Abebe',
        'Chala',
        'Fatuma',
        'Kebede',
        'Lensa',
        'Mekonnen',
        'Sara',
        'Taye',
        'Zenebech',
        'Yonas',
      ];
      final fatherNames = [
        'Bekele',
        'Desta',
        'Girma',
        'Haile',
        'Lemma',
        'Negash',
        'Tadesse',
        'Worku',
        'Zewdu',
        'Gebre',
      ];

      final mockEmployees = List.generate(EmployeeListState.itemsPerPage, (i) {
        final rankIndex = i % policeRanks.length;
        final firstNameIndex = i % firstNames.length;
        final fatherNameIndex = (i + 1) % fatherNames.length;
        final employeeNumber =
            (nextPage - 1) * EmployeeListState.itemsPerPage + i + 1;

        return EmployeeInfoModel(
          employeeId:
              'APC${employeeNumber.toString().padLeft(4, '0')}', // Amhara Police Commission ID
          firstName: firstNames[firstNameIndex],
          fatherName: fatherNames[fatherNameIndex],
          grandName: 'Grand${i + 1}', // Keeping grandName simple for mock
          positionId: policeRanks[rankIndex], // Using police ranks
          gender: i.isEven ? Gender.male : Gender.female,
          birthDate: DateTime(
            1980 + i % 15,
            (i % 12) + 1,
            (i % 28) + 1,
          ), // Vary birth dates
          hiredDate: DateTime(
            2010 + i % 10,
            (i % 12) + 1,
            (i % 28) + 1,
          ), // Vary hired dates
          address1: '${i + 1} Kebele, ${policeRanks[rankIndex]} Division',
          phone: '0911${(100000 + i).toString().padLeft(6, '0')}',
          mobile: '0912${(100000 + i).toString().padLeft(6, '0')}',
          email:
              '${firstNames[firstNameIndex].toLowerCase()}.$employeeNumber@amaharapolice.gov.et',
          photoUrl: 'https://i.pravatar.cc/150?u=apc$employeeNumber',
          religion: Religion.christianity, // Example default
          medicalStatus: MedicalStatus.fit, // Example default
        );
      });
      const bool mockHasMore = true; // Simulate more pages available
      // --- END MOCK ---

      state = state.copyWith(
        employees: mockEmployees,
        currentPage: nextPage,
        canLoadMore: mockHasMore,
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

      // --- MOCK IMPLEMENTATION (Police Context) ---
      await Future.delayed(const Duration(seconds: 1));
      final policeRanks = [
        'Constable',
        'Sergeant',
        'Inspector',
        'Chief Inspector',
        'Superintendent',
        'Commander',
      ];
      final firstNames = [
        'Abeba',
        'Samuel',
        'Fatuma',
        'Kebede',
        'Lensa',
        'Mekonnen',
        'Sara',
        'Taye',
        'Zenebech',
        'Yonas',
      ];
      final fatherNames = [
        'Bekele',
        'Desta',
        'Girma',
        'Haile',
        'Lemma',
        'Negash',
        'Tadesse',
        'Worku',
        'Zewdu',
        'Gebre',
      ];

      final newMockEmployees = List.generate(EmployeeListState.itemsPerPage, (
        i,
      ) {
        final rankIndex = (i + nextPage) % policeRanks.length; // Vary ranks
        final firstNameIndex = (i + nextPage) % firstNames.length;
        final fatherNameIndex = (i + nextPage + 1) % fatherNames.length;
        final employeeNumber =
            (nextPage - 1) * EmployeeListState.itemsPerPage + i + 1;

        return EmployeeInfoModel(
          employeeId: 'APC${employeeNumber.toString().padLeft(4, '0')}',
          firstName: firstNames[firstNameIndex],
          fatherName: fatherNames[fatherNameIndex],
          grandName: 'Grand$employeeNumber',
          positionId: policeRanks[rankIndex],
          gender: i.isEven ? Gender.female : Gender.male, // Alternate gender
          birthDate: DateTime(
            1980 + (i + nextPage) % 15,
            ((i + nextPage) % 12) + 1,
            ((i + nextPage) % 28) + 1,
          ),
          hiredDate: DateTime(
            2010 + (i + nextPage) % 10,
            ((i + nextPage) % 12) + 1,
            ((i + nextPage) % 28) + 1,
          ),
          address1: '$employeeNumber Woreda, ${policeRanks[rankIndex]} Unit',
          phone: '0921${(100000 + employeeNumber).toString().padLeft(6, '0')}',
          mobile: '0922${(100000 + employeeNumber).toString().padLeft(6, '0')}',
          email:
              '${firstNames[firstNameIndex].toLowerCase()}.$employeeNumber@amaharapolice.gov.et',
          photoUrl: 'https://i.pravatar.cc/150?u=apc$employeeNumber',
          religion: Religion.islam, // Example default
          maritalStatus: MaritalStatus.married, // Example default
        );
      });
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

  Future<void> refreshList() async {
    // Re-fetches the first page with the current search query.
    await fetchInitialEmployees(
      query: state.currentSearchQuery,
      isRefresh: true,
    );
  }
}
