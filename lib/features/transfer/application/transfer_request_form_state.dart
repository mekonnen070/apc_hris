// lib/features/transfer/application/transfer_request_form_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

part 'transfer_request_form_state.freezed.dart';

@freezed
abstract class TransferRequestFormState with _$TransferRequestFormState {
  const factory TransferRequestFormState({
    // The transfer request data being built by the user.
    required TransferRequest transferRequestData,
    // True if the form is currently being submitted to the backend.
    @Default(false) bool isSubmitting,
    // Any error message from the last submission attempt.
    String? errorMessage,
    // Message for successful submission.
    String? successMessage,
  }) = _TransferRequestFormState;
}
