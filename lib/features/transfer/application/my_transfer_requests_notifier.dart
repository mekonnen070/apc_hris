import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/transfer/data/transfer_repository.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

part 'my_transfer_requests_notifier.freezed.dart';

/// Provider for the MyTransferRequestsNotifier.
/// The UI will watch this provider to get the state for the transfer list screen.
final myTransferRequestsNotifierProvider = StateNotifierProvider.autoDispose<
  MyTransferRequestsNotifier,
  MyTransferRequestsState
>((ref) => MyTransferRequestsNotifier(ref.watch(transferRepositoryProvider)));

/// State definition for the MyTransferRequests screen.
@freezed
abstract class MyTransferRequestsState with _$MyTransferRequestsState {
  const factory MyTransferRequestsState({
    @Default(true) bool isLoading,
    @Default([]) List<TransferRequest> requests,
    String? errorMessage,
    String? successMessage,
  }) = _MyTransferRequestsState;
}

/// Manages the state for the MyTransferRequestsScreen.
class MyTransferRequestsNotifier
    extends StateNotifier<MyTransferRequestsState> {
  final ITransferRepository _repository;

  MyTransferRequestsNotifier(this._repository)
    : super(const MyTransferRequestsState()) {
    // Fetch the initial list of requests when the notifier is created.
    fetchMyTransferRequests();
  }

  /// Fetches the list of transfer requests from the repository.
  /// Handles loading and error states.
  Future<void> fetchMyTransferRequests({bool isRefresh = false}) async {
    // Only show the full-screen loader on the initial load.
    if (!isRefresh) {
      state = state.copyWith(isLoading: true, errorMessage: null);
    }

    try {
      final requests = await _repository.getMyTransferRequests();
      state = state.copyWith(
        isLoading: false,
        requests: requests,
        errorMessage: null,
      );
    } catch (e, st) {
      log('Failed to fetch transfer requests', error: e, stackTrace: st);
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// Cancels a specific transfer request.
  Future<void> deleteTransferRequest(String requestId) async {
    // You could set a specific loading state for cancellation if needed, e.g.,
    // state = state.copyWith(isCancelling: true);

    try {
      await _repository.deleteTransferRequest(requestId);
      state = state.copyWith(
        // Remove the cancelled request from the list for an immediate UI update.
        requests:
            state.requests
                .where((req) => req.transferRequestId.toString() != requestId)
                .toList(),
        successMessage: 'Request successfully deleted.',
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      // Clear the success/error messages after a short delay
      Future.delayed(const Duration(milliseconds: 100), () {
        state = state.copyWith(successMessage: null, errorMessage: null);
      });
    }
  }
}
