// lib/features/verification/application/verification_providers.dart
import 'dart:async';

import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/verification/data/verification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verification_providers.g.dart';

@riverpod
class VerifyEmployee extends _$VerifyEmployee {
  @override
  FutureOr<EmployeeInfoModel?> build() {
    // Initial state is null, no employee verified yet.
    return null;
  }

  /// Triggers a search for an employee by their ID.
  Future<void> searchEmployee(String employeeId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () =>
          ref.read(verificationRepositoryProvider).findEmployeeById(employeeId),
    );
  }

  /// Resets the state to the initial prompt.
  void clear() {
    state = const AsyncValue.data(null);
  }
}
