// lib/features/employee_profile/application/employee_detail_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/employee_profile/application/notifiers/employee_detail_notifier.dart';
import 'package:police_com/features/employee_profile/application/states/employee_detail_state.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

// Provider for the EmployeeDetailNotifier.
// It's a family provider because it needs the initial EmployeeInfoModel
// to initialize its state.
final employeeDetailNotifierProvider = StateNotifierProvider.autoDispose
    .family<EmployeeDetailNotifier, EmployeeDetailState, EmployeeInfoModel>((
      ref,
      initialEmployeeData,
    ) {
      // TODO: When you have an API service, inject it here:
      // final apiService = ref.watch(yourEmployeeApiServiceProvider);
      // return EmployeeDetailNotifier(ref, initialEmployeeData, apiService);
      return EmployeeDetailNotifier(ref, initialEmployeeData);
    });
