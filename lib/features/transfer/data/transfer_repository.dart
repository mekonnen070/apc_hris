import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

/// Provider for the Transfer Repository.
/// This is the single source of truth for accessing transfer-related data.
final transferRepositoryProvider = Provider<ITransferRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return TransferRepository(dio);
});

/// Abstract interface for the transfer repository.
/// This defines the contract that the data layer must adhere to, allowing the
/// application layer to depend on an abstraction, not a concrete implementation.
abstract class ITransferRepository {
  /// Fetches all transfer requests for the currently authenticated user.
  Future<List<TransferRequest>> getMyTransferRequests();

  /// Creates a new transfer request on the backend.
  Future<void> createTransferRequest(TransferRequest request);

  /// Deletes an existing transfer request.
  Future<void> deleteTransferRequest(String requestId);
}

/// Concrete implementation of the ITransferRepository.
/// This class handles the actual HTTP requests to the backend API.
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
  Future<void> createTransferRequest(TransferRequest request) async {
    try {
      await _dio.post(ApiEndpoints.createTransfer, data: request.toJson());
    } catch (e, st) {
      log('Failed to create transfer request', error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deleteTransferRequest(String requestId) async {
    try {
      await _dio.post(ApiEndpoints.deleteTransfer(id: requestId));
    } catch (e, st) {
      log(
        'Failed to delete transfer request for ID: $requestId',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
