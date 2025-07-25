import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/transfer/domain/department.dart';
import 'package:police_com/features/transfer/domain/location_data.dart';
import 'package:police_com/features/transfer/domain/position.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';
import 'package:police_com/features/transfer/domain/transfer_request_create.dart';

final transferRepositoryProvider = Provider<ITransferRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return TransferRepository(dio);
});

abstract class ITransferRepository {
  Future<List<TransferRequest>> getMyTransferRequests();
  Future<void> createTransferRequest(TransferRequestCreate request);
  Future<void> deleteTransferRequest(int requestId);
  Future<LocationData> getLocationData(String employeeId);
  Future<List<Department>> getDepartmentsByLocation(String locationId);
  Future<List<Position>> getPositionsByDepartment(String departmentId);
}

class TransferRepository implements ITransferRepository {
  final DioClient _dio;
  TransferRepository(this._dio);

  @override
  Future<List<TransferRequest>> getMyTransferRequests() async {
    try {
      final response = await _dio.get(ApiEndpoints.transferRequests);
      final data = response.data as List;
      return data.map((item) => TransferRequest.fromJson(item)).toList();
    } catch (e, st) {
      log('Failed to fetch transfer requests', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> createTransferRequest(TransferRequestCreate request) async {
    try {
      await _dio.post(ApiEndpoints.createTransfer, data: request.toJson());
    } catch (e, st) {
      log('Failed to create transfer request', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteTransferRequest(int requestId) async {
    try {
      await _dio.delete(
        ApiEndpoints.deleteTransfer,
        queryParameters: {'id': requestId.toString()},
      );
    } catch (e, st) {
      log(
        'Failed to delete transfer request for ID: $requestId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<LocationData> getLocationData(String employeeId) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.locationData,
        queryParameters: {'id': employeeId},
      );
      return LocationData.fromJson(response.data);
    } catch (e, st) {
      log(
        'Failed to fetch location data for employee: $employeeId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<List<Department>> getDepartmentsByLocation(String locationId) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.getDepartmentByLocation,
        queryParameters: {'loc': locationId},
      );
      final data = response.data['data'] as List;

      List<Department> flattenedList = [];
      void flatten(List<dynamic> departments) {
        for (final dept in departments) {
          flattenedList.add(Department.fromJson(dept));
          if (dept['childDepartment'] != null &&
              dept['childDepartment'].isNotEmpty) {
            flatten(dept['childDepartment']);
          }
        }
      }

      flatten(data);

      final uniqueDepartments = flattenedList.toSet().toList();

      return uniqueDepartments;
    } catch (e, st) {
      log(
        'Failed to fetch departments for location $locationId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<List<Position>> getPositionsByDepartment(String departmentId) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.getPositionByDepartment,
        queryParameters: {'department': departmentId},
      );
      final data = response.data['data'] as List;
      return data.map((item) => Position.fromJson(item)).toList();
    } catch (e, st) {
      log(
        'Failed to fetch positions for department $departmentId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
