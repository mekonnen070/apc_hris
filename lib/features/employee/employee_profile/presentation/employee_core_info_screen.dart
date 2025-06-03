import 'dart:io'; // For File type

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// Enums (via the barrel file)
import 'package:police_com/core/enums/all_enums.dart';
// Your extension for display names
import 'package:police_com/core/extensions/enum_extension.dart'; // Ensure this path is correct
// Corrected import for the step provider:
import 'package:police_com/features/employee/employee_profile/application/providers/add_new_employee_step_provider.dart';
// Providers
import 'package:police_com/features/employee/employee_profile/application/providers/employee_creation_provider.dart';
// Host Screen (to access static totalSteps)
import 'package:police_com/features/employee/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';
// Reusable Widgets (ensure paths are correct for your project)
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:police_com/features/widgets/form_step_layout.dart';

// A top-level helper function for building dropdown items.
List<DropdownMenuItem<T>> _buildEnumDropdownItems<T extends Enum>(
  List<T> enumValues,
) {
  return enumValues.map((T value) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(value.toDisplayString), // Uses the .toDisplayString extension
    );
  }).toList();
}

class EmployeeCoreInfoScreen extends HookConsumerWidget {
  const EmployeeCoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final employeeDataFromNotifier = ref.watch(
      employeeCreationNotifierProvider.select((state) => state.employeeData),
    );

    // Initialize Controllers & Local State with data from Notifier
    final employeeIdController = useTextEditingController(
      text: employeeDataFromNotifier.employeeId,
    );
    final titleController = useTextEditingController(
      text: employeeDataFromNotifier.title,
    );
    final firstNameController = useTextEditingController(
      text: employeeDataFromNotifier.firstName,
    );
    final fatherNameController = useTextEditingController(
      text: employeeDataFromNotifier.fatherName,
    );
    final grandNameController = useTextEditingController(
      text: employeeDataFromNotifier.grandName,
    );
    final motherNameController = useTextEditingController(
      text: employeeDataFromNotifier.motherName,
    );
    final positionIdController = useTextEditingController(
      text: employeeDataFromNotifier.positionId,
    );
    final managerIdController = useTextEditingController(
      text: employeeDataFromNotifier.managerId,
    );
    final address1Controller = useTextEditingController(
      text: employeeDataFromNotifier.address1,
    );
    final address2Controller = useTextEditingController(
      text: employeeDataFromNotifier.address2,
    );
    final houseNumberController = useTextEditingController(
      text: employeeDataFromNotifier.houseNumber,
    );
    final phoneController = useTextEditingController(
      text: employeeDataFromNotifier.phone,
    );
    final mobileController = useTextEditingController(
      text: employeeDataFromNotifier.mobile,
    );
    final emailController = useTextEditingController(
      text: employeeDataFromNotifier.email,
    );
    final retirementNumberController = useTextEditingController(
      text: employeeDataFromNotifier.retirementNumber,
    );
    final tinController = useTextEditingController(
      text: employeeDataFromNotifier.tin,
    );

    final selectedGender = useState<Gender>(employeeDataFromNotifier.gender);
    final selectedBirthDate = useState<DateTime>(
      employeeDataFromNotifier.birthDate,
    );
    final selectedHiredDate = useState<DateTime>(
      employeeDataFromNotifier.hiredDate,
    );
    final selectedNationality = useState<Country>(
      employeeDataFromNotifier.nationality,
    );
    final selectedBloodGroup = useState<BloodGroup>(
      employeeDataFromNotifier.bloodGroup,
    );
    final selectedReligion = useState<Religion>(
      employeeDataFromNotifier.religion,
    );
    final selectedMedicalStatus = useState<MedicalStatus>(
      employeeDataFromNotifier.medicalStatus,
    );
    final selectedMaritalStatus = useState<MaritalStatus>(
      employeeDataFromNotifier.maritalStatus,
    );
    final selectedEmploymentStatus = useState<EmploymentStatus>(
      employeeDataFromNotifier.employmentStatus,
    );
    final selectedEmployeeType = useState<EmployeeType>(
      employeeDataFromNotifier.employeeType,
    );
    final isManagerFlag = useState<bool>(employeeDataFromNotifier.isManager);
    final currentPhotoFile = useState<File?>(
      employeeDataFromNotifier.photoFile,
    );

    void handleNext() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        ref
            .read(employeeCreationNotifierProvider.notifier)
            .updateCoreInfo(
              employeeId: employeeIdController.text,
              title: titleController.text.isEmpty ? null : titleController.text,
              firstName: firstNameController.text,
              fatherName:
                  fatherNameController.text.isEmpty
                      ? null
                      : fatherNameController.text,
              grandName:
                  grandNameController.text.isEmpty
                      ? null
                      : grandNameController.text,
              gender: selectedGender.value,
              birthDate: selectedBirthDate.value,
              photoFile: currentPhotoFile.value,
              motherName:
                  motherNameController.text.isEmpty
                      ? null
                      : motherNameController.text,
              positionId: positionIdController.text,
              managerId:
                  managerIdController.text.isEmpty
                      ? null
                      : managerIdController.text,
              address1: address1Controller.text,
              address2:
                  address2Controller.text.isEmpty
                      ? null
                      : address2Controller.text,
              houseNumber:
                  houseNumberController.text.isEmpty
                      ? null
                      : houseNumberController.text,
              phone: phoneController.text,
              mobile: mobileController.text,
              email: emailController.text,
              nationality: selectedNationality.value,
              bloodGroup: selectedBloodGroup.value,
              religion: selectedReligion.value,
              medicalStatus: selectedMedicalStatus.value,
              retirementNumber:
                  retirementNumberController.text.isEmpty
                      ? null
                      : retirementNumberController.text,
              tin: tinController.text.isEmpty ? null : tinController.text,
              maritalStatus: selectedMaritalStatus.value,
              employmentStatus: selectedEmploymentStatus.value,
              isManager: isManagerFlag.value,
              employeeType: selectedEmployeeType.value,
              hiredDate: selectedHiredDate.value,
            );

        final currentStepVal = ref.read(currentEmployeeCreationStepProvider);
        // Correctly access totalSteps from the imported AddNewEmployeeHostScreen
        if (currentStepVal < AddNewEmployeeHostScreen.totalSteps - 1) {
          ref.read(currentEmployeeCreationStepProvider.notifier).state++;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please correct the errors in the form before proceeding.',
            ),
          ),
        );
      }
    }

    return FormStepLayout(
      formKey: formKey,
      onNext: handleNext,
      // Example: "Next (Contacts)" - adjust based on actual next step name
      nextButtonText: 'Next (Contacts)',
      child: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            // --- Section: Basic Identity ---
            Text(
              'Basic Identity',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            AppTextField(
              controller: employeeIdController,
              labelText: 'Employee ID *',
              hintText: 'Enter unique employee ID (e.g., APC001)',
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'Employee ID is required'
                          : null,
            ),
            AppTextField(
              controller: titleController,
              labelText: 'Title (e.g., Ato., W/ro)',
            ),
            AppTextField(
              controller: firstNameController,
              labelText: 'First Name *',
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'First name is required'
                          : null,
            ),
            AppTextField(
              controller: fatherNameController,
              labelText: "Father's Name",
            ),
            AppTextField(
              controller: grandNameController,
              labelText: "Grandfather's Name",
            ),
            AppTextField(
              controller: motherNameController,
              labelText: "Mother's Full Name",
            ),
            AppDropdownField<Gender>(
              labelText: 'Gender *',
              value: selectedGender.value,
              items: _buildEnumDropdownItems(Gender.values),
              onChanged:
                  (val) =>
                      selectedGender.value =
                          val ?? employeeDataFromNotifier.gender,
              validator: (val) => val == null ? 'Gender is required' : null,
            ),
            AppDateField(
              labelText: 'Date of Birth *',
              selectedDate: selectedBirthDate.value,
              onDateSelected:
                  (date) =>
                      selectedBirthDate.value =
                          date ?? employeeDataFromNotifier.birthDate,
              validator:
                  (val) => val == null ? 'Date of birth is required' : null,
              lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
            ),
            AppFileUploadField(
              labelText: 'Profile Photo',
              pickedFile: currentPhotoFile.value,
              onFileSelected: (file) => currentPhotoFile.value = file,
              allowedExtensions: const ['jpg', 'jpeg', 'png'],
            ),

            // --- Section: Contact Information ---
            const SizedBox(height: 16),
            Text(
              'Contact Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            AppTextField(
              controller: phoneController,
              labelText: 'Primary Phone *',
              keyboardType: TextInputType.phone,
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'Primary phone is required'
                          : null,
            ),
            AppTextField(
              controller: mobileController,
              labelText: 'Mobile Number *',
              keyboardType: TextInputType.phone,
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'Mobile number is required'
                          : null,
            ),
            AppTextField(
              controller: emailController,
              labelText: 'Email Address *',
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Email is required';
                if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(val))
                  return 'Enter a valid email';
                return null;
              },
            ),

            // --- Section: Address Information ---
            const SizedBox(height: 16),
            Text(
              'Address Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            AppTextField(
              controller: address1Controller,
              labelText: 'Primary Address (Street, Locality) *',
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'Address is required'
                          : null,
              maxLines: 2,
            ),
            AppTextField(
              controller: address2Controller,
              labelText: 'Secondary Address',
              maxLines: 2,
            ),
            AppTextField(
              controller: houseNumberController,
              labelText: 'House Number',
            ),
            // TODO: Add structured Ethiopian address fields (Region, Zone, Woreda, Kebele)
            // using AppDropdownFields and dependent logic if EmployeeInfoModel is updated to include them.
            // For example:
            // AppDropdownField<EthiopianRegion>(...),
            // AppDropdownField<AmharaZone>(...), // (if region is Amhara) etc.

            // --- Section: Employment Details ---
            const SizedBox(height: 16),
            Text(
              'Employment Details',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            AppDateField(
              labelText: 'Hired Date *',
              selectedDate: selectedHiredDate.value,
              onDateSelected:
                  (date) =>
                      selectedHiredDate.value =
                          date ?? employeeDataFromNotifier.hiredDate,
              validator: (val) => val == null ? 'Hired date is required' : null,
              lastDate: DateTime.now(),
            ),
            AppTextField(
              // TODO: Replace with a searchable dropdown/selector for actual positions
              controller: positionIdController,
              labelText: 'Position ID *',
              hintText: 'Select or enter Position ID', // Update hint
              validator:
                  (val) =>
                      (val == null || val.isEmpty)
                          ? 'Position is required'
                          : null,
            ),
            AppTextField(
              // TODO: Replace with employee lookup for manager selection
              controller: managerIdController,
              labelText: 'Manager ID (Optional)',
              hintText: "Select or enter Manager's Employee ID",
            ),
            AppDropdownField<EmployeeType>(
              labelText: 'Employee Type *',
              value: selectedEmployeeType.value,
              items: _buildEnumDropdownItems(EmployeeType.values),
              onChanged:
                  (val) =>
                      selectedEmployeeType.value =
                          val ?? employeeDataFromNotifier.employeeType,
              validator: (val) => val == null ? 'Required' : null,
            ),
            AppDropdownField<EmploymentStatus>(
              labelText: 'Employment Status *',
              value: selectedEmploymentStatus.value,
              items: _buildEnumDropdownItems(EmploymentStatus.values),
              onChanged:
                  (val) =>
                      selectedEmploymentStatus.value =
                          val ?? employeeDataFromNotifier.employmentStatus,
              validator: (val) => val == null ? 'Required' : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isManagerFlag.value,
                    onChanged: (val) => isManagerFlag.value = val ?? false,
                  ),
                  const Text('Is this employee a manager?'),
                ],
              ),
            ),

            // --- Section: Additional Information ---
            const SizedBox(height: 16),
            Text(
              'Additional Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            AppDropdownField<Country>(
              labelText: 'Nationality *',
              value: selectedNationality.value,
              items: _buildEnumDropdownItems(Country.values),
              onChanged:
                  (val) =>
                      selectedNationality.value =
                          val ?? employeeDataFromNotifier.nationality,
              validator: (val) => val == null ? 'Required' : null,
            ),
            AppDropdownField<BloodGroup>(
              labelText: 'Blood Group',
              value: selectedBloodGroup.value,
              items: _buildEnumDropdownItems(BloodGroup.values),
              onChanged:
                  (val) =>
                      selectedBloodGroup.value =
                          val ?? employeeDataFromNotifier.bloodGroup,
            ),
            AppDropdownField<Religion>(
              labelText: 'Religion',
              value: selectedReligion.value,
              items: _buildEnumDropdownItems(Religion.values),
              onChanged:
                  (val) =>
                      selectedReligion.value =
                          val ?? employeeDataFromNotifier.religion,
            ),
            AppDropdownField<MedicalStatus>(
              labelText: 'Medical Status *',
              value: selectedMedicalStatus.value,
              items: _buildEnumDropdownItems(MedicalStatus.values),
              onChanged:
                  (val) =>
                      selectedMedicalStatus.value =
                          val ?? employeeDataFromNotifier.medicalStatus,
              validator: (val) => val == null ? 'Required' : null,
            ),
            AppDropdownField<MaritalStatus>(
              labelText: 'Marital Status *',
              value: selectedMaritalStatus.value,
              items: _buildEnumDropdownItems(MaritalStatus.values),
              onChanged:
                  (val) =>
                      selectedMaritalStatus.value =
                          val ?? employeeDataFromNotifier.maritalStatus,
              validator: (val) => val == null ? 'Required' : null,
            ),
            AppTextField(
              controller: retirementNumberController,
              labelText: 'Retirement Number',
            ),
            AppTextField(controller: tinController, labelText: 'TIN Number'),

            const SizedBox(
              height: 24,
            ), // Space for bottom navigation buttons from FormStepLayout
          ],
        ),
      ),
    );
  }
}
