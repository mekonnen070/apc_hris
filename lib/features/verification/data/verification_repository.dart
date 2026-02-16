import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/employee_profile/domain/employee_verification_data_model.dart';
import 'package:police_com/features/verification/application/verification_providers.dart';

/// Provider for the Verification Repository.
final verificationRepositoryProvider = Provider<IVerificationRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return VerificationRepository(dio);
});

/// Abstract interface for the verification repository.
abstract class IVerificationRepository {
  Future<EmployeeInfoModel> verifyEmployee({required String employeeId});
  Future<EmployeeVerificationDataModel> verifyEmployeeDataById({
    required String employeeId,
  });
}

/// Concrete implementation of the IVerificationRepository.
class VerificationRepository implements IVerificationRepository {
  final DioClient _dio;
  VerificationRepository(this._dio);

  @override
  Future<EmployeeInfoModel> verifyEmployee({required String employeeId}) async {
    try {
      // FIX: Changed from _dio.post to _dio.get to match the backend requirement.
      // The 405 Method Not Allowed error will now be resolved.
      final response = await _dio.get(
        ApiEndpoints.employeeDetails,
        queryParameters: {'EmpId': employeeId},
      );

      // The backend returns the employee data directly in the response body.
      return EmployeeInfoModel.fromJson(response.data);
    } on DioException catch (e) {
      final safeId =
          kDebugMode
              ? employeeId
              : '***${employeeId.substring(employeeId.length < 4 ? 0 : employeeId.length - 4)}';
      log('Verification network error for ID: $safeId', error: e);

      throw VerificationException(
        type: VerificationErrorType.notFound,
        message: 'No employee found with the specified ID.',
      );
    }
  }

  // employeeDataById
  @override
  Future<EmployeeVerificationDataModel> verifyEmployeeDataById({
    required String employeeId,
  }) async {
    try {
      // FIX: Changed from _dio.post to _dio.get to match the backend requirement.
      // The 405 Method Not Allowed error will now be resolved.
      final response = await _dio.get(
        ApiEndpoints.employeeDataById,
        queryParameters: {'employeeId': employeeId},
      );

      // The backend returns the employee data directly in the response body.
      return EmployeeVerificationDataModel.fromJson(response.data);
    } on DioException catch (e, st) {
      final safeId =
          kDebugMode
              ? employeeId
              : '***${employeeId.substring(employeeId.length < 4 ? 0 : employeeId.length - 4)}';
      log(
        'Verification network error for ID: $safeId',
        error: e,
        stackTrace: st,
      );

      throw VerificationException(
        type: VerificationErrorType.notFound,
        message: 'No employee found with the specified ID.',
      );
    } catch (e, st) {
      final safeId =
          kDebugMode
              ? employeeId
              : '***${employeeId.substring(employeeId.length < 4 ? 0 : employeeId.length - 4)}';
      log('Verification error for ID: $safeId', error: e, stackTrace: st);

      throw VerificationException(
        type: VerificationErrorType.notFound,
        message: 'No employee found with the specified ID.',
      );
    }
  }
}
