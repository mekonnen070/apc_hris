import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee_profile/domain/employee_verification_data_model.dart';
import 'package:police_com/features/verification/data/verification_repository.dart';

/// Defines the types of errors specific to the verification feature.
enum VerificationErrorType {
  notFound,
  networkError,
  invalidFormat,
  unauthorized,
}

/// A custom exception class for the verification feature.
class VerificationException implements Exception {
  final VerificationErrorType type;
  final String message;
  VerificationException({required this.type, required this.message});

  @override
  String toString() => 'VerificationException ($type): $message';
}

/// The provider for the verification state.
/// The UI will watch this to react to changes (loading, data, error).
final verifyEmployeeProvider = AutoDisposeAsyncNotifierProvider<
  VerifyEmployeeNotifier,
  EmployeeVerificationDataModel?
>(VerifyEmployeeNotifier.new);

/// Manages the state for the employee verification process.
class VerifyEmployeeNotifier
    extends AutoDisposeAsyncNotifier<EmployeeVerificationDataModel?> {
  @override
  FutureOr<EmployeeVerificationDataModel?> build() {
    // The initial state is null, indicating no search has been performed yet.
    return null;
  }

  /// Searches for an employee using the provided ID.
  Future<void> searchEmployee(String employeeId) async {
    // Set the state to loading while we fetch the data.
    state = const AsyncLoading();

    // Use AsyncValue.guard to automatically handle success and error states.
    state = await AsyncValue.guard(() async {
      final repository = ref.read(verificationRepositoryProvider);
      return repository.verifyEmployeeDataById(employeeId: employeeId);
    });
  }

  /// Resets the state back to the initial (null) state.
  void clear() {
    state = const AsyncData(null);
  }
}
