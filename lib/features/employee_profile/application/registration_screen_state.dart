import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/features/employee_profile/domain/registration_form_data.dart';

part 'registration_screen_state.freezed.dart';

@freezed
abstract class RegistrationScreenState with _$RegistrationScreenState {
  const factory RegistrationScreenState({
    // The current snapshot of all collected form data
    @Default(RegistrationFormData()) RegistrationFormData formData,
    // UI state for the overall submission process
    @Default(false) bool isSubmitting,
    // To display any errors during submission or validation
    String? errorMessage,
    // Optional: could be used to control navigation or UI based on current step
    // int currentStepIndex,
  }) = _RegistrationScreenState;
}
