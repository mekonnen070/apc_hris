import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/auth/data/auth_repository.dart';
import 'package:police_com/features/auth/data/i_auth_repository.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';
import 'package:police_com/features/auth/domain/user.dart';

/// Provider for the current employee's ID. Eg. EMP-201
final currentEmployeeIdProvider = Provider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final appPreferences = ref.watch(appPreferencesProvider);
  return appPreferences.getEmployeeId(prefs);
});

/// Provider for the current employee's user ID. Eg. 25f9366a-3...
final currentEmployeeUserIdProvider = Provider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final appPreferences = ref.watch(appPreferencesProvider);
  return appPreferences.getEmployeeUserId(prefs);
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

  Future<User> login({required String email, required String password}) async {
    state = const AsyncLoading();
    try {
      final response = await _authRepository.login(
        email: email,
        password: password,
      );
      // Invalidate both providers to ensure all user data is refreshed.
      ref.invalidate(currentEmployeeIdProvider);
      ref.invalidate(currentEmployeeProvider);
      ref.invalidate(currentEmployeeUserIdProvider);
      state = const AsyncData(AuthState.authenticated());
      return response;
    } catch (e, st) {
      log('Error during login', error: e, stackTrace: st);
      state = const AsyncData(AuthState.unauthenticated());
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await _authRepository.logout();
    // Invalidate both providers to clear all user data.
    ref.invalidate(currentEmployeeIdProvider);
    ref.invalidate(currentEmployeeProvider);
    ref.invalidate(currentEmployeeUserIdProvider);
    state = const AsyncData(AuthState.unauthenticated());
  }

  Future<User?> signUp({
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
    } catch (e, st) {
      log('Error during sign up', error: e, stackTrace: st);
      return null;
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      return await _authRepository.forgotPassword(email: email);
    } catch (e, st) {
      log('Error during forgot password', error: e, stackTrace: st);
      return false;
    }
  }
}
