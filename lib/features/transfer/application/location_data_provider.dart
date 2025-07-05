import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/transfer/data/transfer_repository.dart';
import 'package:police_com/features/transfer/domain/location_data.dart';

final locationDataProvider = FutureProvider.autoDispose<LocationData>((ref) {
  final employeeId = ref.watch(currentEmployeeIdProvider);
  if (employeeId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.watch(transferRepositoryProvider);
  return repository.getLocationData(employeeId);
});
