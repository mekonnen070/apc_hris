// lib/features/employee_profile/application/employee_detail_notifier.dart
import 'package:flutter/material.dart'; // Required for BuildContext in confirmDeleteEmployee
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee/employee_profile/application/states/employee_detail_state.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_info_model.dart';
// TODO: Import your actual API service
// import 'package:police_com/services/employee_api_service.dart'; // Example

class EmployeeDetailNotifier extends StateNotifier<EmployeeDetailState> {
  final Ref _ref;
  // TODO: Uncomment and use your actual API service
  // final YourEmployeeApiService _apiService;

  EmployeeDetailNotifier(
    this._ref,
    EmployeeInfoModel initialEmployeeData,
    // TODO: Inject your API service: , this._apiService
  ) : super(EmployeeDetailState(employeeData: initialEmployeeData));

  Future<void> refreshEmployeeDetails() async {
    final link = _ref.keepAlive();
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      deleteSuccessMessage: null,
      deleteErrorMessage: null,
    );
    try {
      // --- TODO: Implement actual API call to refresh employee data ---
      // final updatedData = await _apiService.getEmployeeDetails(state.employeeData.employeeId);
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Simulate data update (in a real app, this would be the fetched data)
      // For police context, ensure positionId reflects a rank
      final refreshedData = state.employeeData.copyWith(
        firstName:
            "${state.employeeData.firstName.split(' ').first} (Refreshed)", // Avoid appending (Refreshed) multiple times
        positionId: 'Senior Sergeant', // Example refreshed rank
        // In a real scenario: employeeData: updatedData
      );
      state = state.copyWith(employeeData: refreshedData, isLoading: false);
    } catch (e) {
      debugPrint('Error refreshing employee details: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to refresh details: ${e.toString()}',
      );
    } finally {
      link.close();
    }
  }

  Future<void> confirmDeleteEmployee(BuildContext context) async {
    // Clear previous messages
    state = state.copyWith(
      deleteSuccessMessage: null,
      deleteErrorMessage: null,
    );

    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text(
            'Are you sure you want to delete the profile for ${state.employeeData.computedFullName}? This action cannot be undone.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(dialogContext).pop(false),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(dialogContext).colorScheme.error,
              ),
              child: const Text('Delete'),
              onPressed: () => Navigator.of(dialogContext).pop(true),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await _performDeleteEmployee();
    }
  }

  Future<void> _performDeleteEmployee() async {
    final link = _ref.keepAlive();
    state = state.copyWith(isDeleting: true);
    try {
      // --- TODO: Implement actual API call to delete employee ---
      // await _apiService.deleteEmployee(state.employeeData.employeeId);
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 2));
      debugPrint(
        'Mock deletion successful for ${state.employeeData.employeeId}',
      );
      state = state.copyWith(
        isDeleting: false,
        deleteSuccessMessage: 'Employee profile deleted successfully.',
      );
    } catch (e) {
      debugPrint('Error deleting employee: $e');
      state = state.copyWith(
        isDeleting: false,
        deleteErrorMessage: 'Failed to delete employee: ${e.toString()}',
      );
    } finally {
      link.close();
    }
  }

  void clearDeleteMessages() {
    state = state.copyWith(
      deleteSuccessMessage: null,
      deleteErrorMessage: null,
    );
  }
}
