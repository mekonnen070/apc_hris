import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

// TODO: Define your Riverpod provider for registration state
// final registrationDataProvider = StateNotifierProvider<RegistrationNotifier, RegistrationState>((ref) {
//   return RegistrationNotifier();
// });

class PersonalInfoScreen extends HookConsumerWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Controllers for text fields using flutter_hooks
    final fullNameController = useTextEditingController();
    final addressController =
        useTextEditingController(); // For a simple address field
    // For structured address, you'd have more controllers or a dedicated widget
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();

    // State for date and dropdowns using flutter_hooks
    final selectedDateOfBirth = useState<DateTime?>(null);
    final selectedGender = useState<String?>(null);
    final selectedMaritalStatus = useState<String?>(null);

    // TODO: Populate these lists from a constants file or configuration
    final genderOptions = [
      const DropdownMenuItem(value: 'Male', child: Text('Male')),
      const DropdownMenuItem(value: 'Female', child: Text('Female')),
      const DropdownMenuItem(value: 'Other', child: Text('Other')),
    ];
    final maritalStatusOptions = [
      const DropdownMenuItem(value: 'Single', child: Text('Single')),
      const DropdownMenuItem(value: 'Married', child: Text('Married')),
      const DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
      const DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
    ];

    void onNextPressed() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState
            ?.save(); // Triggers onSaved if defined in AppTextField

        // TODO: Collate data into PersonalInfoData model
        // final personalInfo = PersonalInfoData(
        //   fullName: fullNameController.text,
        //   address: addressController.text,
        //   phoneNumber: phoneNumberController.text,
        //   email: emailController.text,
        //   dateOfBirth: selectedDateOfBirth.value,
        //   gender: selectedGender.value,
        //   maritalStatus: selectedMaritalStatus.value,
        // );
        // TODO: Update Riverpod state with personalInfo
        // ref.read(registrationDataProvider.notifier).updatePersonalInfo(personalInfo);
        // TODO: Navigate to the next step (e.g., Academic Qualifications)
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => AcademicQualificationsScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Personal Info (Conceptual) Saved! Moving to next.'),
          ),
        );
      }
    }

    return FormStepLayout(
      stepTitle: 'Personal Information',
      formKey: formKey, // Pass the form key for validation on next
      onNext: onNextPressed,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppTextField(
              controller: fullNameController,
              labelText: 'Full Name',
              hintText: 'As per official documents',
              validator:
                  (value) =>
                      (value == null || value.isEmpty)
                          ? 'Full name is required'
                          : null,
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: addressController, // For a simple address
              labelText: 'Current Address',
              hintText: 'Kebele, Woreda, City', // Guide the user
              validator:
                  (value) =>
                      (value == null || value.isEmpty)
                          ? 'Address is required'
                          : null,
              textInputAction: TextInputAction.next,
              maxLines: 3,
            ),
            AppTextField(
              controller: phoneNumberController,
              labelText: 'Phone Number',
              hintText: 'e.g., 0912345678',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Phone number is required';
                // TODO: Add more specific phone number validation if needed
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            AppTextField(
              controller: emailController,
              labelText: 'Email Address',
              hintText: 'example@domain.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required';
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
                );
                if (!emailRegex.hasMatch(value))
                  return 'Enter a valid email address';
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            AppDateField(
              labelText: 'Date of Birth',
              selectedDate: selectedDateOfBirth.value,
              onDateSelected: (date) => selectedDateOfBirth.value = date,
              validator:
                  (date) => date == null ? 'Date of birth is required' : null,
              // Optional: Set firstDate and lastDate for reasonable birth years
              firstDate: DateTime(1920),
              lastDate: DateTime.now().subtract(
                const Duration(days: 365 * 18),
              ), // e.g. min 18 years old
            ),
            AppDropdownField<String>(
              labelText: 'Gender',
              value: selectedGender.value,
              items: genderOptions,
              onChanged: (value) => selectedGender.value = value,
              validator: (value) => value == null ? 'Gender is required' : null,
              hintText: 'Select Gender',
            ),
            AppDropdownField<String>(
              labelText: 'Marital Status',
              value: selectedMaritalStatus.value,
              items: maritalStatusOptions,
              onChanged: (value) => selectedMaritalStatus.value = value,
              validator:
                  (value) =>
                      value == null ? 'Marital status is required' : null,
              hintText: 'Select Marital Status',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
