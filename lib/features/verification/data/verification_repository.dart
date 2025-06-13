// lib/features/verification/data/verification_repository.dart
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/data/profile_repository.dart'; // Re-using for mock data access

/// Custom exception types for better error handling
class VerificationException implements Exception {
  final String message;
  final VerificationErrorType type;

  VerificationException(this.message, this.type);

  @override
  String toString() => message;
}

enum VerificationErrorType {
  notFound,
  networkError,
  serverError,
  invalidFormat,
  unauthorized,
  unknown,
}

final verificationRepositoryProvider = Provider((ref) {
  // In a real app, this might have its own API client or use a shared one.
  return VerificationRepository(
    ref.read(dioClientProvider),
    ref.read(profileRepositoryProvider),
  );
});

class VerificationRepository {
  final DioClient _dioClient;
  final ProfileRepository
  _profileRepository; // Using this to access mock user data

  VerificationRepository(this._dioClient, this._profileRepository);

  /// Validates if a string could be a valid employee ID
  /// This is a basic validation that can be expanded based on ID format requirements
  bool isValidEmployeeIdFormat(String employeeId) {
    if (employeeId.isEmpty) return false;

    // Example validation: Ensure it follows the pattern EMP-XXX where X is a digit
    // Adjust this regex based on your actual employee ID format
    // final regex = RegExp(r'^EMP-\d{3}$', caseSensitive: false);
    final regex = RegExp(r'^\d+$');
    return regex.hasMatch(employeeId);
  }

  /// Searches for an employee by their ID.
  /// Throws a VerificationException with appropriate type if there's an issue.
  Future<EmployeeInfoModel> findEmployeeById(String employeeId) async {
    // Validate ID format first
    if (!isValidEmployeeIdFormat(employeeId)) {
      throw VerificationException(
        'Invalid employee ID format. Expected format: EMP-000',
        VerificationErrorType.invalidFormat,
      );
    }

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // --- MOCK IMPLEMENTATION ---
      // In a real app, this would be an API call:
      // try {
      //   final response = await _dioClient.get('/api/employees/$employeeId');
      //   return EmployeeInfoModel.fromJson(response.data);
      // } on DioException catch (e) {
      //   _handleDioException(e, employeeId);
      // }

      if (employeeId.toUpperCase() == '1') {
        // For demonstration, we successfully find the user from the profile repository
        return _profileRepository.getEmployeeProfile(employeeId);
      } else if (employeeId.toUpperCase() == '2') {
        // Simulate unauthorized access
        throw VerificationException(
          'You do not have permission to view this employee record.',
          VerificationErrorType.unauthorized,
        );
      } else if (employeeId.toUpperCase() == '3') {
        // Simulate server error
        throw VerificationException(
          'Server error occurred. Please try again later.',
          VerificationErrorType.serverError,
        );
      } else {
        // Simulate a user not found error from the backend
        throw VerificationException(
          'Employee with ID $employeeId not found.',
          VerificationErrorType.notFound,
        );
      }
    } on TimeoutException {
      throw VerificationException(
        'Connection timed out. Please check your network and try again.',
        VerificationErrorType.networkError,
      );
    } on SocketException {
      throw VerificationException(
        'Network error. Please check your connection and try again.',
        VerificationErrorType.networkError,
      );
    } on VerificationException {
      rethrow; // Re-throw our custom exceptions
    } catch (e) {
      throw VerificationException(
        'An unexpected error occurred: ${e.toString()}',
        VerificationErrorType.unknown,
      );
    }
  }

  // Helper method to handle Dio exceptions in a real implementation
  void _handleDioException(DioException e, String employeeId) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw VerificationException(
          'Connection timed out. Please try again.',
          VerificationErrorType.networkError,
        );
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          throw VerificationException(
            'Employee with ID $employeeId not found.',
            VerificationErrorType.notFound,
          );
        } else if (e.response?.statusCode == 403) {
          throw VerificationException(
            'You do not have permission to view this employee record.',
            VerificationErrorType.unauthorized,
          );
        } else {
          throw VerificationException(
            'Server error: ${e.response?.statusCode}',
            VerificationErrorType.serverError,
          );
        }
      default:
        throw VerificationException(
          'Network error. Please check your connection and try again.',
          VerificationErrorType.networkError,
        );
    }
  }
}
