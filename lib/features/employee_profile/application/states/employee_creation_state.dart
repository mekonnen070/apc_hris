import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

part 'employee_creation_state.freezed.dart';

@freezed
abstract class EmployeeCreationState with _$EmployeeCreationState {
  const factory EmployeeCreationState({
    // Holds the complete employee data being built across steps.
    // Initialize with a new or empty EmployeeInfoModel.
    required EmployeeInfoModel employeeData,
    // True if the entire form is currently being submitted to the backend.
    @Default(false) bool isSubmitting,
    // Any error message from the last submission attempt.
    String? errorMessage,
    // Optional: To track which main section/collection is currently being edited if needed globally.
    // int currentMajorStep,
  }) = _EmployeeCreationState;
}