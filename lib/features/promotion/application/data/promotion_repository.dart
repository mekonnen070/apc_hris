// lib/features/promotion/data/promotion_repository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/promotion_status.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/promotion/domain/promotion_request.dart';
import 'package:uuid/uuid.dart';

final promotionRepositoryProvider = Provider(
  (ref) => PromotionRepository(ref.read(dioClientProvider)),
);

// TODO: Replace mock data with real API calls before production.
class PromotionRepository with LoggerMixin {
  final DioClient _dioClient;
  final _uuid = const Uuid();

  PromotionRepository(this._dioClient);

  // Using a local list to simulate a database
  static final List<PromotionRequest> _mockDb = [
    PromotionRequest(
      id: 301,
      employeeId: 'CURRENT_USER_ID',
      requestDate: DateTime.now().subtract(const Duration(days: 90)),
      currentPositionId: 'Junior Officer',
      promotedToPositionId: 'Sergeant',
      reason:
          'Completed all required training and demonstrated leadership skills.',
      status: PromotionStatus.approved,
      comments:
          'Approved by committee on ${DateTime.now().subtract(const Duration(days: 80)).toIso8601String().substring(0, 10)}.',
    ),
    PromotionRequest(
      id: 302,
      employeeId: 'CURRENT_USER_ID',
      requestDate: DateTime.now().subtract(const Duration(days: 10)),
      currentPositionId: 'Sergeant',
      promotedToPositionId: 'Lieutenant',
      reason:
          'Seeking new challenges and responsibilities to further contribute to the department.',
      status: PromotionStatus.pending,
    ),
  ];

  Future<List<PromotionRequest>> getMyPromotionRequests(
    String employeeId,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockDb.where((req) => req.employeeId == employeeId).toList();
  }

  Future<void> submitPromotionRequest(PromotionRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    final newRequest = request.copyWith(id: _uuid.v4().hashCode);
    _mockDb.add(newRequest);
    logInfo('Submitting new promotion request: ${newRequest.toJson()}');
  }
}
