// lib/features/clearance/data/clearance_repository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/clearance_reason.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';

final clearanceRepositoryProvider = Provider(
  (ref) => ClearanceRepository(ref.read(dioClientProvider)),
);

class ClearanceRepository {
  final DioClient _dioClient;

  ClearanceRepository(this._dioClient);

  Future<List<ClearanceRequest>> getMyClearanceRequests(
    String employeeId,
  ) async {
    // Mock data based on the defined model
    await Future.delayed(const Duration(seconds: 1));
    return [
      ClearanceRequest(
        id: 201,
        employeeId: employeeId,
        reason: ClearanceReason.resignation,
        requestDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDayOfWork: DateTime.now().subtract(const Duration(days: 15)),
        status: ClearanceStatus.completed,
        comments: 'All assets returned and handover completed.',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now().subtract(const Duration(days: 14)),
      ),
      ClearanceRequest(
        id: 202,
        employeeId: employeeId,
        reason: ClearanceReason.longTermLeave,
        requestDate: DateTime.now().subtract(const Duration(days: 5)),
        lastDayOfWork: DateTime.now().add(const Duration(days: 10)),
        status: ClearanceStatus.approved,
        comments: 'Approved for 3-month sabbatical.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  Future<void> submitClearanceRequest(ClearanceRequest request) async {
    // Mock network request
    await Future.delayed(const Duration(seconds: 2));
    print('Submitting new clearance request: ${request.toJson()}');
  }
}
