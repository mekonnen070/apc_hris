
// lib/features/employee_profile/application/employee_detail_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_info_model.dart';

part 'employee_detail_state.freezed.dart';

@freezed
abstract class EmployeeDetailState with _$EmployeeDetailState {
  const factory EmployeeDetailState({
    // The core data of the employee being viewed.
    required EmployeeInfoModel employeeData,
    // True if actively fetching fresh data for the current employee.
    @Default(false) bool isLoading,
    // True if a delete operation is in progress.
    @Default(false) bool isDeleting,
    // General error message, e.g., from a failed refresh.
    String? errorMessage,
    // Message to show upon successful deletion.
    String? deleteSuccessMessage,
    // Message to show if deletion fails.
    String? deleteErrorMessage,
  }) = _EmployeeDetailState;
}
