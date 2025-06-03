// lib/features/transfer/application/my_transfer_requests_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/transfer/domain/transfer_request_model.dart';

part 'my_transfer_requests_state.freezed.dart';

@freezed
abstract class MyTransferRequestsState with _$MyTransferRequestsState {
  const factory MyTransferRequestsState({
    @Default([]) List<TransferRequestModel> requests,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? successMessage, // For operations like cancellation
  }) = _MyTransferRequestsState;
}

