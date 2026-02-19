import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/errors/app_exceptions.dart';
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
  final cookieJar = ref.watch(cookieJarProvider);

  return AuthRepository(
    dioClient,
    appPreferences,
    sharedPreferences,
    cookieJar,
  );
});

class AuthRepository with LoggerMixin implements IAuthRepository {
  final DioClient _dioClient;
  final AppPreferences _appPreferences;
  final SharedPreferences _prefs;
  final CookieJar _cookieJar;

  AuthRepository(
    this._dioClient,
    this._appPreferences,
    this._prefs,
    this._cookieJar,
  );

  @override
  Future<AuthState> checkAuthState() async {
    final isLoggedIn = _appPreferences.getUserLoginStatus(_prefs);
    if (isLoggedIn) {
      return const AuthState.authenticated();
    }
    return const AuthState.unauthenticated();
  }

  @override
  Future<User> login({required String email, required String password}) async {
    final data = {'userName': email, 'password': password, 'rememberMe': true};
    try {
      final response = await _dioClient.post(ApiEndpoints.login, data: data);

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        if (user.employeeId == null) {
          // The server already created a session from the successful 200
          // response (cookies were stored by CookieManager). We must
          // tear down that session so repeated taps don't slip through.
          await logout();
          throw const NoEmployeeLinkedExeption();
        }

        await _appPreferences.setUserLoginStatus(true, _prefs);

        final employeeId = user.employeeId;

        await _appPreferences.setEmployeeId(employeeId, _prefs);
        await _appPreferences.setEmployeeUserId(user.userId, _prefs);
        logInfo('Login successful. Employee ID: $employeeId');
        return user;
      }
      logError('Login failed: Status code ${response.statusCode}');
      logError('Login failed: Response data ${response.data}');
      final message = _extractErrorMessage(response);
      throw Exception(message);
    } on NoEmployeeLinkedExeption {
      rethrow;
    } on DioException catch (e, st) {
      logError('Error during login', error: e, stackTrace: st);
      final message =
          e.response != null
              ? _extractErrorMessage(e.response!)
              : 'Connection failed. Please check your network.';
      throw Exception(message);
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
      // This will clear the login status, stored employeeId, and session cookies.
      await _appPreferences.clearAuthData(_prefs);
      await _cookieJar.deleteAll();
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

  String _extractErrorMessage(Response response) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      // Try common backend error response shapes
      if (data.containsKey('message')) return data['message'] as String;
      if (data.containsKey('error')) {
        final error = data['error'];
        if (error is String) return error;
        if (error is Map && error.containsKey('message')) {
          return error['message'] as String;
        }
      }
      if (data.containsKey('title')) return data['title'] as String;
    }
    if (data is String && data.isNotEmpty) return data;
    return 'Login failed. Please check your credentials and try again.';
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
