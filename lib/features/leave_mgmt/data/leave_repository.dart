import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request_create.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

final leaveRepositoryProvider = Provider<ILeaveRepository>((ref) {
  return LeaveRepository(ref.watch(dioClientProvider));
});

abstract class ILeaveRepository {
  Future<List<LeaveBalance>> getLeaveBalanceByEmployee({
    required String employeeId,
  });
  Future<List<LeaveRequest>> getLeaveRequests({
    required int page,
    required int pageSize,
  });
  Future<Response> createLeaveRequest(LeaveRequestCreate request);
  Future<List<LeaveType>> getLeaveTypes();
}

class LeaveRepository implements ILeaveRepository {
  final DioClient _dio;
  LeaveRepository(this._dio);

  @override
  Future<List<LeaveBalance>> getLeaveBalanceByEmployee({
    required String employeeId,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.leaveBalanceByEmployee,
      queryParameters: {'employeeId': employeeId},
    );
    return (response.data as List)
        .map((e) => LeaveBalance.fromJson(e))
        .toList();
  }

  @override
  Future<List<LeaveRequest>> getLeaveRequests({
    required int page,
    required int pageSize,
  }) async {
    final response = await _dio.get(
      ApiEndpoints.leaveRequests,
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    return (response.data as List)
        .map((e) => LeaveRequest.fromJson(e))
        .toList();
  }

  @override
  Future<Response> createLeaveRequest(LeaveRequestCreate request) async {
    return await _dio.post(ApiEndpoints.applyForLeave, data: request.toJson());
  }

  @override
  Future<List<LeaveType>> getLeaveTypes() async {
    final response = await _dio.get(ApiEndpoints.leaveTypes);
    return (response.data as List).map((e) => LeaveType.fromJson(e)).toList();
  }
}
