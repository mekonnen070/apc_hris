import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/transfer/data/transfer_repository.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';
import 'package:police_com/features/transfer/domain/transfer_request_create.dart';

final transferNotifierProvider =
    StateNotifierProvider.autoDispose<TransferNotifier, AsyncValue<List<TransferRequest>>>(
  (ref) => TransferNotifier(ref.watch(transferRepositoryProvider)),
);

class TransferNotifier extends StateNotifier<AsyncValue<List<TransferRequest>>> {
  final ITransferRepository _repository;

  TransferNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchMyTransferRequests();
  }

  Future<void> fetchMyTransferRequests() async {
    state = const AsyncValue.loading();
    try {
      final requests = await _repository.getMyTransferRequests();
      state = AsyncValue.data(requests);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTransferRequest(TransferRequestCreate request) async {
    final previousState = state;
    try {
      await _repository.createTransferRequest(request);
      await fetchMyTransferRequests();
    } catch (e) {
      state = previousState;
      rethrow;
    }
  }

  Future<void> deleteTransferRequest(int requestId) async {
    final previousState = state;
    state = state.whenData((requests) =>
        requests.where((req) => req.transferRequestId != requestId).toList());
    try {
      await _repository.deleteTransferRequest(requestId);
    } catch (e) {
      state = previousState;
      rethrow;
    }
  }
}