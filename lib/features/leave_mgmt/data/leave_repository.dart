import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

final leaveRepositoryProvider = Provider<ILeaveRepository>((ref) {
  if (AppConfig.useMockData) {
    return MockLeaveRepository();
  }
  return LeaveRepository(ref.watch(dioClientProvider));
});

abstract class ILeaveRepository {
  Future<List<LeaveBalance>> getLeaveBalance();
  Future<List<LeaveRequest>> getLeaveRequests({
    required int page,
    required int pageSize,
  });
  Future<void> createLeaveRequest(LeaveRequest request);
  Future<List<LeaveType>> getLeaveTypes();
}

class LeaveRepository implements ILeaveRepository {
  final DioClient _dio;
  LeaveRepository(this._dio);

  @override
  Future<List<LeaveBalance>> getLeaveBalance() async {
    final response = await _dio.get(ApiEndpoints.leaveBalance);
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
  Future<void> createLeaveRequest(LeaveRequest request) async {
    await _dio.post(ApiEndpoints.leaveRequests, data: request.toJson());
  }

  @override
  Future<List<LeaveType>> getLeaveTypes() async {
    final response = await _dio.get(ApiEndpoints.leaveTypes);
    return (response.data as List).map((e) => LeaveType.fromJson(e)).toList();
  }
}

class MockLeaveRepository implements ILeaveRepository {
  @override
  Future<List<LeaveBalance>> getLeaveBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      LeaveBalance(
        leaveBalanceId: 1,
        employeeId: '1',
        leaveTypeId: 'Annual',
        budgetYear: 2024,
        totalDays: 20,
        usedDays: 5,
      ),
      LeaveBalance(
        leaveBalanceId: 2,
        employeeId: '1',
        leaveTypeId: 'Sick',
        budgetYear: 2024,
        totalDays: 10,
        usedDays: 2,
      ),
      LeaveBalance(
        leaveBalanceId: 3,
        employeeId: '1',
        leaveTypeId: 'Maternity',
        budgetYear: 2024,
        totalDays: 90,
        usedDays: 0,
      ),
    ];
  }

  final _mockRequests = List.generate(
    25,
    (index) => LeaveRequest(
      leaveRequestId: index,
      leaveTypeId: 'Annual',
      employeeId: '1',
      startDate: DateTime.now().subtract(Duration(days: (index + 1) * 10)),
      endDate: DateTime.now().subtract(Duration(days: (index + 1) * 10 - 2)),
      numOfDays: 3,
      requestReason: 'Vacation with family',
      requestStatus:
          LeaveRequestStatus.values[index % LeaveRequestStatus.values.length],
    ),
  );

  @override
  Future<List<LeaveRequest>> getLeaveRequests({
    required int page,
    required int pageSize,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));
    final start = (page - 1) * pageSize;
    final end = start + pageSize;
    if (start >= _mockRequests.length) {
      return [];
    }
    return _mockRequests.sublist(
      start,
      end > _mockRequests.length ? _mockRequests.length : end,
    );
  }

  @override
  Future<void> createLeaveRequest(LeaveRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    // Simulate success
  }

  @override
  Future<List<LeaveType>> getLeaveTypes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const LeaveType(
        leaveTypeId: 1,
        leaveTypeName: 'Annual',
        isPaid: true,
        maximumDays: 20,
      ),
      const LeaveType(
        leaveTypeId: 2,
        leaveTypeName: 'Sick',
        isPaid: true,
        maximumDays: 10,
      ),
      const LeaveType(
        leaveTypeId: 3,
        leaveTypeName: 'Maternity',
        isPaid: true,
        maximumDays: 90,
      ),
      const LeaveType(
        leaveTypeId: 4,
        leaveTypeName: 'Paternity',
        isPaid: true,
        maximumDays: 5,
      ),
      const LeaveType(
        leaveTypeId: 5,
        leaveTypeName: 'Unpaid',
        isPaid: false,
        maximumDays: 30,
      ),
    ];
  }
}
