import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/auth/data/auth_repository.dart';
import 'package:police_com/features/auth/data/i_auth_repository.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';

final currentEmployeeIdProvider = Provider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final appPreferences = ref.watch(appPreferencesProvider);
  return appPreferences.getEmployeeId(prefs);
});

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<AuthState> {
  late IAuthRepository _authRepository;

  @override
  FutureOr<AuthState> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return _authRepository.checkAuthState();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    try {
      final success = await _authRepository.login(
        email: email,
        password: password,
      );
      if (success) {
        // Invalidate both providers to ensure all user data is refreshed.
        ref.invalidate(currentEmployeeIdProvider);
        ref.invalidate(currentEmployeeProvider);
        state = const AsyncData(AuthState.authenticated());
      } else {
        state = const AsyncData(AuthState.unauthenticated());
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await _authRepository.logout();
    // Invalidate both providers to clear all user data.
    ref.invalidate(currentEmployeeIdProvider);
    ref.invalidate(currentEmployeeProvider);
    state = const AsyncData(AuthState.unauthenticated());
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
    String? address,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? maritalStatus,
  }) async {
    try {
      return await _authRepository.signUp(
        email: email,
        password: password,
        fullName: fullName,
        address: address,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
        gender: gender,
        maritalStatus: maritalStatus,
      );
    } catch (e) {
      return false;
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      return await _authRepository.forgotPassword(email: email);
    } catch (e) {
      return false;
    }
  }
}
