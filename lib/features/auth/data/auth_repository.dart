import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';
import 'package:police_com/features/auth/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_auth_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  if (AppConfig.useMockData) {
    throw UnimplementedError('MockAuthRepository is not yet implemented.');
  }

  final dioClient = ref.watch(dioClientProvider);
  final appPreferences = ref.watch(appPreferencesProvider);
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return AuthRepository(dioClient, appPreferences, sharedPreferences);
});

class AuthRepository with LoggerMixin implements IAuthRepository {
  final DioClient _dioClient;
  final AppPreferences _appPreferences;
  final SharedPreferences _prefs;

  AuthRepository(this._dioClient, this._appPreferences, this._prefs);

  @override
  Future<AuthState> checkAuthState() async {
    final isLoggedIn = _appPreferences.getUserLoginStatus(_prefs);
    if (isLoggedIn) {
      return const AuthState.authenticated();
    }
    return const AuthState.unauthenticated();
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    final data = {'userName': email, 'password': password, 'rememberMe': true};
    try {
      final response = await _dioClient.post(ApiEndpoints.login, data: data);

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await _appPreferences.setUserLoginStatus(true, _prefs);

        String? employeeId = user.employeeId;

        await _appPreferences.setEmployeeId(employeeId, _prefs);
        await _appPreferences.setEmployeeUserId(user.userId, _prefs);
        logInfo('Login successful. Employee ID: $employeeId');
        return user;
      }
      logError('Login failed: Status code ${response.statusCode}');
      logError('Login failed: Status code ${response.data}');
      logError('Login failed: Status code ${response.headers}');
      logError('Login failed: Status code ${response.requestOptions}');
      logError('Login failed: Status code ${response.realUri}');
      logError('Login failed: Status code ${response.isRedirect}');
      return null;
    } on DioException catch (e, st) {
      logError('Error during login', error: e, stackTrace: st);
      return null;
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
      // This will clear the login status and the stored employeeId.
      await _appPreferences.clearAuthData(_prefs);
    }
  }

  @override
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
      final response = await _dioClient.post(ApiEndpoints.signUp, data: data);
      final user = User.fromJson(response.data);
      return user;
    } on DioException catch (e, st) {
      logError('Error during signUp', error: e, stackTrace: st);
      return null;
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
