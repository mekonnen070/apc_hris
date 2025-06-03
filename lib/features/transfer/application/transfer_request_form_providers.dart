// lib/features/transfer/application/transfer_request_form_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/transfer/application/transfer_request_form_notifier.dart';
import 'package:police_com/features/transfer/application/transfer_request_form_state.dart';

final transferRequestFormNotifierProvider = StateNotifierProvider.autoDispose<
  TransferRequestFormNotifier,
  TransferRequestFormState
>((ref) {
  return TransferRequestFormNotifier(ref);
});
