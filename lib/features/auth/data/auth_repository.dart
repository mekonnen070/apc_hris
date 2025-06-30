// lib/features/auth/data/auth_repository.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_auth_repository.dart';

// The master provider remains correct.
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  if (AppConfig.useMockData) {
    throw UnimplementedError('MockAuthRepository is not yet implemented.');
  }

  final dioClient = ref.watch(dioClientProvider);

  return AuthRepository(
    dioClient,
    ref.watch(appPreferencesProvider),
    ref.watch(sharedPreferencesProvider),
  );
});

class AuthRepository with LoggerMixin implements IAuthRepository {
  final DioClient _dioClient;
  final AppPreferences _appPreferences;
  final SharedPreferences _prefs; // The injected instance

  // Dependencies are correctly received via the constructor.
  AuthRepository(this._dioClient, this._appPreferences, this._prefs);

  @override
  Future<bool> login({required String email, required String password}) async {
    final data = {'userName': email, 'password': password, 'rememberMe': true};
    try {
      final response = await _dioClient.post(ApiEndpoints.login, data: data);

      if (response.statusCode == 200 && response.data != null) {
        // Assume the backend response includes 'token' and 'employeeId'.
        final token = response.data['token'] as String?;
        final employeeId = response.data['employeeId'] as String?;

        if (token != null && employeeId != null) {
          // The Architect's Note:
          // The injected `_prefs` instance is now correctly used.
          await _appPreferences.setToken(token, _prefs);
          await _appPreferences.setEmployeeId(employeeId, _prefs);
          await _appPreferences.setUserLoginStatus(true);

          logInfo(
            'Login successful. Token and Employee ID for $employeeId stored.',
          );
          return true;
        }
      }
      logError('Login failed: Server response did not contain required data.');
      return false;
    } on DioException catch (e) {
      logError('Error during login', error: e, stackTrace: e.stackTrace);
      return false;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dioClient.post(ApiEndpoints.logOff);
    } catch (e, st) {
      logError(
        'Backend logout notification failed. Proceeding with local logout.',
        error: e,
        stackTrace: st,
      );
    } finally {
      // The Architect's Note: The injected `_prefs` instance is used here.
      await _appPreferences.clearAuthData(_prefs);
    }
  }

  @override
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
    final data = {
      'email': email,
      'password': password,
      'fullName': fullName,
      'address': address,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'maritalStatus': maritalStatus,
    };
    data.removeWhere((key, value) => value == null);

    try {
      // NOTE: Assumes a dedicated registration endpoint exists.
      await _dioClient.post(ApiEndpoints.signUp, data: data);
      return true;
    } on DioException catch (e, st) {
      logError('Error during signUp', error: e, stackTrace: st);
      return false;
    }
  }

  @override
  Future<bool> forgotPassword({required String email}) async {
    final data = {'email': email};
    try {
      await _dioClient.post(ApiEndpoints.forgotPassword, data: data);
      return true;
    } on DioException catch (e, st) {
      logError('Error during forgot password', error: e, stackTrace: st);
      return false;
    }
  }
}
