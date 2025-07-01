import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/verification/application/verification_providers.dart';

/// Provider for the Verification Repository.
final verificationRepositoryProvider = Provider<IVerificationRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return VerificationRepository(dio);
});

/// Abstract interface for the verification repository.
abstract class IVerificationRepository {
  Future<EmployeeInfoModel> verifyEmployee({required String employeeId});
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
      log('Verification network error for ID: $employeeId', error: e);
      if (e.response?.statusCode == 404) {
        throw VerificationException(
          type: VerificationErrorType.notFound,
          message: 'No employee found with the specified ID.',
        );
      }
      throw VerificationException(
        type: VerificationErrorType.notFound,
        message: 'Couldn\'t find employee with the specified ID.',
      );
    } catch (e, st) {
      log(
        'Verification parsing error for ID: $employeeId',
        error: e,
        stackTrace: st,
      );
      throw VerificationException(
        type: VerificationErrorType.invalidFormat,
        message: 'The server response was not in the expected format.',
      );
    }
  }
}
