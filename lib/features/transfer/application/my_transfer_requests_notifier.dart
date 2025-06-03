// lib/features/transfer/application/my_transfer_requests_notifier.dart
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart'; // For TransferRequestStatus
import 'package:police_com/features/transfer/application/my_transfer_requests_state.dart';
import 'package:police_com/features/transfer/domain/transfer_request_model.dart';

class MyTransferRequestsNotifier
    extends StateNotifier<MyTransferRequestsState> {
  final AutoDisposeStateNotifierProviderRef _ref;

  // Mock employee ID for fetching requests. In a real app, this would be dynamic.
  static const String _currentEmployeeId = 'EMP12345';

  MyTransferRequestsNotifier(this._ref)
    : super(const MyTransferRequestsState()) {
    fetchMyTransferRequests();
  }

  /// Fetches the transfer requests for the current employee.
  Future<void> fetchMyTransferRequests({bool isRefresh = false}) async {
    if (state.isLoading && !isRefresh) return;
    final link =
        _ref.keepAlive(); // Keep the provider alive during async operation
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      // In a real application, you would fetch requests for _currentEmployeeId from your backend.
      // Example: final fetchedRequests = await _apiService.getMyTransferRequests(_currentEmployeeId);
      debugPrint(
        'Simulating fetching transfer requests for $_currentEmployeeId',
      );
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate network delay

      final mockRequests = _generateMockTransferRequests(_currentEmployeeId);

      state = state.copyWith(requests: mockRequests, isLoading: false);
    } catch (e) {
      debugPrint('Error fetching transfer requests: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load transfer requests: ${e.toString()}',
      );
    } finally {
      link.close(); // Release the keepAlive link
    }
  }

  /// Cancels a pending transfer request.
  Future<bool> cancelTransferRequest(String requestId) async {
    final link = _ref.keepAlive(); // Keep the provider alive
    state = state.copyWith(
      isLoading: true, // Indicate operation is in progress
      errorMessage: null,
      successMessage: null,
    );

    try {
      // In a real application, you would send a cancellation request to your backend.
      // Example: await _apiService.cancelTransferRequest(requestId);
      debugPrint('Simulating cancellation of request: $requestId');
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate network delay

      // Update the local state: change status to cancelledByEmployee
      final updatedRequests =
          state.requests.map((request) {
            if (request.id == requestId) {
              return request.copyWith(
                status: TransferRequestStatus.cancelledByEmployee,
                lastUpdated: DateTime.now(),
                hrComments: 'Cancelled by employee.',
              );
            }
            return request;
          }).toList();

      state = state.copyWith(
        requests: updatedRequests,
        isLoading: false,
        successMessage: 'Transfer request $requestId cancelled successfully.',
      );
      return true;
    } catch (e) {
      debugPrint('Error cancelling transfer request: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to cancel request: ${e.toString()}',
      );
      return false;
    } finally {
      link.close(); // Release the keepAlive link
    }
  }

  /// Generates mock transfer requests for a given employee ID.
  List<TransferRequestModel> _generateMockTransferRequests(String employeeId) {
    return [
      TransferRequestModel(
        id: 'TRF-001-${employeeId.substring(3)}',
        employeeId: employeeId,
        employeeFullName: 'Abebe Kebede',
        currentPositionTitle: 'Patrol Officer',
        currentDepartment: 'Patrol Division',
        currentLocation: 'Addis Ababa Central',
        requestedDepartment: 'CID',
        requestedLocation: 'Gondar Zonal Office',
        requestedPositionTitle: 'Investigator',
        reasonForRequest:
            'Seeking new challenges and specialized experience in criminal investigation.',
        requestDate: DateTime.now().subtract(const Duration(days: 30)),
        status: TransferRequestStatus.pendingHRApproval,
        managerComments:
            'Approved by manager. Abebe is a valuable asset, but this opportunity aligns with his career goals.',
        lastUpdated: DateTime.now().subtract(const Duration(days: 20)),
      ),
      TransferRequestModel(
        id: 'TRF-002-${employeeId.substring(3)}',
        employeeId: employeeId,
        employeeFullName: 'Abebe Kebede',
        currentPositionTitle: 'Patrol Officer',
        currentDepartment: 'Patrol Division',
        currentLocation: 'Addis Ababa Central',
        requestedDepartment: 'Traffic Police',
        requestedLocation: 'Bahir Dar City',
        reasonForRequest:
            'Desire to relocate closer to family and contribute to traffic safety initiatives.',
        requestDate: DateTime.now().subtract(const Duration(days: 60)),
        status: TransferRequestStatus.rejectedByHR,
        managerComments: 'Approved by manager.',
        hrComments:
            'Request denied due to insufficient staffing in Traffic Police at Bahir Dar and current role criticality.',
        lastUpdated: DateTime.now().subtract(const Duration(days: 45)),
      ),
      TransferRequestModel(
        id: 'TRF-003-${employeeId.substring(3)}',
        employeeId: employeeId,
        employeeFullName: 'Abebe Kebede',
        currentPositionTitle: 'Patrol Officer',
        currentDepartment: 'Patrol Division',
        currentLocation: 'Addis Ababa Central',
        reasonForRequest: 'Personal reasons requiring relocation to Hawassa.',
        requestedDepartment: 'Community Policing',
        requestedLocation: 'Hawassa',
        requestedPositionTitle: 'Community Officer',
        requestDate: DateTime.now().subtract(const Duration(days: 10)),
      ),
      TransferRequestModel(
        id: 'TRF-004-${employeeId.substring(3)}',
        employeeId: employeeId,
        employeeFullName: 'Abebe Kebede',
        currentPositionTitle: 'Patrol Officer',
        currentDepartment: 'Patrol Division',
        currentLocation: 'Addis Ababa Central',
        requestedDepartment: 'Training Academy',
        requestedLocation: 'Debre Markos',
        requestedPositionTitle: 'Trainer',
        reasonForRequest:
            'Interest in contributing to the development of new recruits and sharing field experience.',
        requestDate: DateTime.now().subtract(const Duration(days: 90)),
        status: TransferRequestStatus.completed,
        managerComments: 'Strongly recommended.',
        hrComments:
            'Approved and implemented. Effective Date: ${DateTime.now().subtract(const Duration(days: 15)).toIso8601String().split('T').first}',
        effectiveDate: DateTime.now().subtract(const Duration(days: 15)),
        lastUpdated: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
  }
}
