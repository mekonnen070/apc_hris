// // lib/features/transfer/application/transfer_request_form_notifier.dart
// import 'package:flutter/foundation.dart'; // For debugPrint
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:police_com/core/enums/all_enums.dart'; // For TransferRequestStatus
// import 'package:police_com/features/transfer/application/transfer_request_form_state.dart';
// import 'package:police_com/features/transfer/domain/transfer_request.dart';

// class TransferRequestFormNotifier
//     extends StateNotifier<TransferRequestFormState> {
//   final Ref _ref;

//   // For now, we'll use a mock employee ID and current details.
//   // In a real app, this would come from an authenticated user session.
//   static const String _mockEmployeeId = 'EMP12345';
//   static const String _mockEmployeeFullName = 'Abebe Kebede';
//   static const String _mockCurrentPositionTitle = 'Patrol Officer';
//   static const String _mockCurrentDepartment = 'Patrol Division';
//   static const String _mockCurrentLocation = 'Addis Ababa Central';

//   TransferRequestFormNotifier(this._ref)
//     : super(
//         TransferRequestFormState(
//           transferRequestData: TransferRequest(
//             id: '', // Will be generated or assigned by backend
//             employeeId: _mockEmployeeId,
//             employeeFullName: _mockEmployeeFullName,
//             currentPositionTitle: _mockCurrentPositionTitle,
//             currentDepartment: _mockCurrentDepartment,
//             currentLocation: _mockCurrentLocation,
//             requestedDepartment: '',
//             requestedLocation: '',
//             reasonForRequest: '',
//             requestDate: DateTime.now(),
//           ),
//         ),
//       );

//   /// Initializes the form for a new transfer request, optionally pre-filling current employee data.
//   void initializeNewRequest({
//     String? employeeId,
//     String? employeeFullName,
//     String? currentPositionTitle,
//     String? currentDepartment,
//     String? currentLocation,
//   }) {
//     state = TransferRequestFormState(
//       transferRequestData: TransferRequestModel(
//         id: '', // New request, ID will be generated
//         employeeId: employeeId ?? _mockEmployeeId,
//         employeeFullName: employeeFullName ?? _mockEmployeeFullName,
//         currentPositionTitle: currentPositionTitle ?? _mockCurrentPositionTitle,
//         currentDepartment: currentDepartment ?? _mockCurrentDepartment,
//         currentLocation: currentLocation ?? _mockCurrentLocation,
//         requestedDepartment: '',
//         requestedLocation: '',
//         reasonForRequest: '',
//         requestDate: DateTime.now(),
//       ),
//     );
//   }

//   /// Updates a specific field in the transfer request data.
//   void updateField({
//     String? requestedDepartment,
//     String? requestedLocation,
//     String? requestedPositionTitle,
//     String? reasonForRequest,
//   }) {
//     state = state.copyWith(
//       transferRequestData: state.transferRequestData.copyWith(
//         requestedDepartment:
//             requestedDepartment ??
//             state.transferRequestData.requestedDepartment,
//         requestedLocation:
//             requestedLocation ?? state.transferRequestData.requestedLocation,
//         requestedPositionTitle:
//             requestedPositionTitle ??
//             state.transferRequestData.requestedPositionTitle,
//         reasonForRequest:
//             reasonForRequest ?? state.transferRequestData.reasonForRequest,
//       ),
//       errorMessage: null, // Clear error on field update
//       successMessage: null,
//     );
//   }

//   /// Submits the transfer request.
//   Future<bool> submitTransferRequest() async {
//     final link =
//         _ref.keepAlive(); // Keep the provider alive during async operation
//     state = state.copyWith(
//       isSubmitting: true,
//       errorMessage: null,
//       successMessage: null,
//     );

//     // Basic validation before submission
//     if (state.transferRequestData.requestedDepartment.isEmpty ||
//         state.transferRequestData.requestedLocation.isEmpty ||
//         state.transferRequestData.reasonForRequest.isEmpty) {
//       state = state.copyWith(
//         isSubmitting: false,
//         errorMessage:
//             'Please fill all required fields (Requested Department, Location, and Reason).',
//       );
//       link.close();
//       return false;
//     }

//     try {
//       // In a real application, you would send state.transferRequestData to your backend API.
//       // Example: await _apiService.submitTransferRequest(state.transferRequestData);
//       debugPrint(
//         'Simulating transfer request submission: ${state.transferRequestData.toJson()}',
//       );
//       await Future.delayed(
//         const Duration(seconds: 2),
//       ); // Simulate network delay

//       // Simulate successful submission and update the ID (if backend generates)
//       final submittedRequest = state.transferRequestData.copyWith(
//         id: 'TRF-${UniqueKey().toString().substring(0, 8)}', // Mock ID from backend
//         requestDate: DateTime.now(), // Ensure date is set on submission
//         status: TransferRequestStatus.pendingManagerApproval, // Initial status
//       );

//       state = state.copyWith(
//         isSubmitting: false,
//         successMessage: 'Transfer request submitted successfully!',
//         transferRequestData:
//             submittedRequest, // Update with backend-assigned ID/status
//       );
//       return true;
//     } catch (e) {
//       debugPrint('Transfer request submission error: $e');
//       state = state.copyWith(
//         isSubmitting: false,
//         errorMessage: 'Failed to submit transfer request: ${e.toString()}',
//       );
//       return false;
//     } finally {
//       link.close(); // Release the keepAlive link
//     }
//   }
// }
