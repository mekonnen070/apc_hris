import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/transfer/data/transfer_repository.dart';
import 'package:police_com/features/transfer/domain/department.dart';
import 'package:police_com/features/transfer/domain/position.dart';

// Provider to get departments based on a location ID.
// This uses .family to pass the locationId parameter to the provider.
final departmentsByLocationProvider = FutureProvider.autoDispose
    .family<List<Department>, String>((ref, locationId) {
      // Watches the main repository provider
      final repository = ref.watch(transferRepositoryProvider);
      // Calls the new repository method with the passed-in locationId
      return repository.getDepartmentsByLocation(locationId);
    });

// Provider to get positions based on a department ID.
// This also uses .family to pass the departmentId parameter.
final positionsByDepartmentProvider = FutureProvider.autoDispose
    .family<List<Position>, String>((ref, departmentId) {
      // Watches the main repository provider
      final repository = ref.watch(transferRepositoryProvider);
      // Calls the new repository method with the passed-in departmentId
      return repository.getPositionsByDepartment(departmentId);
    });
