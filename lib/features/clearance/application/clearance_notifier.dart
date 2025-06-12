// lib/features/clearance/application/clearance_notifier.dart
import 'dart:async';

import 'package:police_com/features/clearance/data/clearance_repository.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clearance_notifier.g.dart';

@riverpod
class ClearanceNotifier extends _$ClearanceNotifier {
  @override
  FutureOr<List<ClearanceRequest>> build() {
    return const [];
  }

  Future<void> getMyClearanceRequests(String employeeId) async {
    state = const AsyncValue.loading();
    try {
      final requests = await ref
          .read(clearanceRepositoryProvider)
          .getMyClearanceRequests(employeeId);
      state = AsyncValue.data(requests);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
