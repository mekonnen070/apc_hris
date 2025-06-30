import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/enums/transfer_levels.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';
import 'package:police_com/features/transfer/data/transfer_repository.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';
import 'package:uuid/uuid.dart';

part 'request_transfer_notifier.freezed.dart';

final requestTransferNotifierProvider = StateNotifierProvider.autoDispose<
  RequestTransferNotifier,
  RequestTransferState
>((ref) => RequestTransferNotifier(ref.watch(transferRepositoryProvider)));

@freezed
abstract class RequestTransferState with _$RequestTransferState {
  const factory RequestTransferState({
    @Default(false) bool isSubmitting,
    String? successMessage,
    String? errorMessage,
  }) = _RequestTransferState;
}

class RequestTransferNotifier extends StateNotifier<RequestTransferState> {
  final ITransferRepository _repository;

  RequestTransferNotifier(this._repository)
    : super(const RequestTransferState());

  Future<void> submitRequest({
    required String toLocation,
    required String toDepartment,
    required TransferReasons reason,
  }) async {
    state = state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    );
    try {
      final newRequest = TransferRequest(
        transferRequestId: 0,
        currentLocation: null,
        currentDepartment: null,
        currentPosition: null,
        transferLevelFrom: TransferLevels.zone,
        transferLevelTo: TransferLevels.zone,
        // Data from the form
        requestedLocation: toLocation,
        requestedDepartment: toDepartment,
        reasonForRequest: reason,

        requestDate: DateTime.now(),
        status: TransferStatus.submitted, // Initial status is submitted
      );

      await _repository.createTransferRequest(newRequest);

      state = state.copyWith(
        isSubmitting: false,
        successMessage: 'Transfer request submitted successfully!',
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
}
