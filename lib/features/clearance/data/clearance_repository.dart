import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';
import 'package:police_com/features/clearance/domain/clearance_request_create.dart';

final clearanceRepositoryProvider = Provider<IClearanceRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return ClearanceRepository(dio);
});

abstract class IClearanceRepository {
  /// Fetches all clearance requests for a given employee.
  Future<List<ClearanceRequest>> getMyClearanceRequests({
    required String employeeId,
  });

  /// Creates a new clearance request.
  Future<void> createClearanceRequest(ClearanceRequestCreate request);

  /// Deletes a clearance request by its ID.
  Future<void> deleteClearanceRequest({required String requestId});
}

class ClearanceRepository implements IClearanceRepository {
  final DioClient _dio;
  ClearanceRepository(this._dio);

  @override
  Future<List<ClearanceRequest>> getMyClearanceRequests({
    required String employeeId,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.myClearanceRequests,
        queryParameters: {'employeeId': employeeId},
      );
      final data = response.data as List;
      return data.map((item) => ClearanceRequest.fromJson(item)).toList();
    } catch (e, st) {
      log(
        'Failed to fetch clearance requests for employee: $employeeId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<void> createClearanceRequest(ClearanceRequestCreate request) async {
    try {
      await _dio.post(ApiEndpoints.createClearance, data: request.toJson());
    } catch (e, st) {
      log('Failed to create clearance request', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteClearanceRequest({required String requestId}) async {
    try {
      await _dio.post(
        ApiEndpoints.deleteClearance,
        queryParameters: {'id': requestId},
      );
    } catch (e, st) {
      log(
        'Failed to delete clearance request for ID: $requestId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
