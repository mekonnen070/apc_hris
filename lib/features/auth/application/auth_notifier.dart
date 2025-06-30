// lib/features/auth/application/auth_notifier.dart

import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/network/dio_client.dart'; // For sharedPreferencesProvider
import 'package:police_com/features/auth/data/auth_repository.dart';
import 'package:police_com/features/auth/data/i_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentEmployeeIdProvider = Provider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ref.watch(appPreferencesProvider).getEmployeeId(prefs);
});

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
}, dependencies: [authRepositoryProvider, sharedPreferencesProvider]);

class AuthNotifier extends AsyncNotifier<bool> {
  late IAuthRepository _authRepository;
  late AppPreferences _appPreferences;
  late SharedPreferences _prefs;

  @override
  FutureOr<bool> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _appPreferences = ref.watch(appPreferencesProvider);
    _prefs = ref.watch(sharedPreferencesProvider);
    return _appPreferences.getUserLoginStatus(_prefs);
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

  Future<bool> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _authRepository.login(email: email, password: password);
    });
    log('Login state: ${state.value}');
    return state.hasValue && state.value == true;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await _authRepository.logout();
    state = const AsyncValue.data(false);
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      return await _authRepository.forgotPassword(email: email);
    } catch (e) {
      return false;
    }
  }
}
