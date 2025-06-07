import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';

final auhtRepositoryProvider = Provider<AutoRepository>((ref) {
  return AutoRepository();
});

class AutoRepository with LoggerMixin {
  final DioClient dioClient;
  AutoRepository({DioClient? dioClient}) : dioClient = dioClient ?? DioClient();

  Future<void> signUp({
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

    try {
      final response = await dioClient.post(
        ApiEndpoints.signup,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logInfo('Signup successful: ${response.data}');
      } else {
        logError('Signup failed: ${response.statusCode} - ${response.data}');
      }
    } catch (error, stackTrace) {
      logError(
        'Error during signup: $error',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> login({required String email, required String password}) async {
    final data = {'email': email, 'password': password};

    try {
      final response = await dioClient.post(
        ApiEndpoints.login    ,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logInfo('Login successful: ${response.data}');
      } else {
        logError('Login failed: ${response.statusCode} - ${response.data}');
      }
    } catch (error, stackTrace) {
      logError(
        'Error during login: $error',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> forgotPassword({required String email}) async {
    final data = {'email': email};

    try {
      final response = await dioClient.post(
        ApiEndpoints.forgotPassword,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logInfo('Forgot password successful: ${response.data}');
      } else {
        logError(
          'Forgot password failed: ${response.statusCode} - ${response.data}',
        );
      }
    } catch (error, stackTrace) {
      logError(
        'Error during forgot password: $error',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> logout() async {
    try {
      final response = await dioClient.post(ApiEndpoints.logout);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logInfo('Logout successful: ${response.data}');
      } else {
        logError('Logout failed: ${response.statusCode} - ${response.data}');
      }
    } catch (error, stackTrace) {
      logError(
        'Error during logout: $error',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
