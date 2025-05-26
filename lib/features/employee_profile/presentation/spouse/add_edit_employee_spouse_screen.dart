import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/employee_profile/presentation/experience/add_edit_employee_experience_screen.dart';

import '../../../widgets/app_date_field.dart';
import '../../../widgets/app_dropdown_field.dart';
// Reusable Widgets
import '../../../widgets/app_text_field.dart';

class AddEditEmployeeSpouseScreen extends HookWidget {
  final EmployeeSpouseModel? initialSpouse;
  final String employeeId;

  const AddEditEmployeeSpouseScreen({
    super.key,
    this.initialSpouse,
    required this.employeeId,
  });

  static List<DropdownMenuItem<T>> _buildDropdownItems<T extends Enum>(
    List<T> enumValues,
    String Function(T) getDisplayName,
  ) {
    return enumValues.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(getDisplayName(value)),
      );
    }).toList();
  }

  static String _getGenderDisplayName(Gender g) => g.name.toDisplayCase();
  // Placeholder for spouse titles if you make it a dropdown
  // static String _getSpouseTitleDisplayName(SpouseTitle t) => t.name.toDisplayCase();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // C# EmployeeSpouseModel has non-nullable Title, SpouseFullName, SpouseBirthDate, SpousePhone, SpouseOccupation, MotherName, Address, AnniversaryDate, RetirementNumber, TIN.
    // Consider if all these are truly mandatory for admin input or if some can be optional.
    // The C# constructor initializes BirthDate and AnniversaryDate.
    final titleController = useTextEditingController(
      text: initialSpouse?.title ?? '',
    );
    final spouseFullNameController = useTextEditingController(
      text: initialSpouse?.spouseFullName ?? '',
    );
    final spousePhoneController = useTextEditingController(
      text: initialSpouse?.spousePhone ?? '',
    );
    final spouseOccupationController = useTextEditingController(
      text: initialSpouse?.spouseOccupation ?? '',
    );
    final motherNameController = useTextEditingController(
      text: initialSpouse?.motherName ?? '',
    );
    final addressController = useTextEditingController(
      text: initialSpouse?.address ?? '',
    );
    final retirementNumberController = useTextEditingController(
      text: initialSpouse?.retirementNumber ?? '',
    );
    final tinController = useTextEditingController(
      text: initialSpouse?.tin ?? '',
    );

    final selectedGender = useState<Gender>(
      initialSpouse?.gender ?? Gender.other,
    ); // Default
    final selectedSpouseBirthDate = useState<DateTime?>(
      initialSpouse?.spouseBirthDate ??
          DateTime.now().subtract(const Duration(days: 365 * 25)),
    ); // Default age
    final selectedAnniversaryDate = useState<DateTime?>(
      initialSpouse?.anniversaryDate ??
          DateTime.now().subtract(const Duration(days: 365 * 1)),
    ); // Default 1 year ago

    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        if (selectedSpouseBirthDate.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Spouse date of birth is required.')),
          );
          return;
        }

        final spouseRecord = EmployeeSpouseModel(
          spouseId: initialSpouse?.spouseId ?? UniqueKey().toString(),
          employeeId: initialSpouse?.employeeId ?? employeeId,
          title: titleController.text,
          spouseFullName: spouseFullNameController.text,
          gender: selectedGender.value,
          spouseBirthDate: selectedSpouseBirthDate.value!, // Validated
          spousePhone:
              spousePhoneController
                  .text, // C# model non-nullable, consider if truly required here
          spouseOccupation:
              spouseOccupationController.text, // C# model non-nullable
          motherName: motherNameController.text, // C# model non-nullable
          address: addressController.text, // C# model non-nullable
          anniversaryDate:
              selectedAnniversaryDate.value, // C# model non-nullable
          retirementNumber:
              retirementNumberController.text, // C# model non-nullable
          tin: tinController.text, // C# model non-nullable
        );
        Navigator.of(context).pop(spouseRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialSpouse == null
              ? 'Add Spouse Information'
              : 'Edit Spouse Information',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Spouse Info',
            onPressed: handleSaveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppTextField(
                controller: titleController,
                labelText:
                    'Title (e.g., Mr., Mrs., Ms.) *', // C# Title is required
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Title is required'
                            : null,
              ),
              AppTextField(
                controller: spouseFullNameController,
                labelText: "Spouse's Full Name *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? "Spouse's full name is required"
                            : null,
              ),
              AppDropdownField<Gender>(
                labelText: "Spouse's Gender *",
                value: selectedGender.value,
                items: _buildDropdownItems(
                  Gender.values,
                  _getGenderDisplayName,
                ),
                onChanged: (val) => selectedGender.value = val ?? Gender.other,
                validator: (val) => val == null ? 'Gender is required' : null,
              ),
              AppDateField(
                labelText: "Spouse's Date of Birth *",
                selectedDate: selectedSpouseBirthDate.value,
                onDateSelected: (date) => selectedSpouseBirthDate.value = date,
                validator:
                    (val) => val == null ? 'Date of birth is required' : null,
                lastDate: DateTime.now().subtract(
                  const Duration(days: 365 * 16),
                ), // Spouse min age 16 for example
              ),
              AppTextField(
                // C# 'SpousePhone' is not nullable
                controller: spousePhoneController,
                labelText: "Spouse's Phone Number *",
                keyboardType: TextInputType.phone,
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Spouse phone is required'
                            : null,
              ),
              AppTextField(
                // C# 'SpouseOccupation' is not nullable
                controller: spouseOccupationController,
                labelText: "Spouse's Occupation *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Spouse occupation is required'
                            : null,
              ),
              AppTextField(
                // C# 'MotherName' is not nullable
                controller: motherNameController,
                labelText: "Spouse's Mother's Full Name *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? "Spouse's Mother's name is required"
                            : null,
              ),
              AppTextField(
                // C# 'Address' is not nullable
                controller: addressController,
                labelText: "Spouse's Address *",
                maxLines: 2,
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Address is required'
                            : null,
              ),
              AppDateField(
                // C# 'AnniversaryDate' is not nullable
                labelText: 'Marriage Anniversary Date *',
                selectedDate: selectedAnniversaryDate.value,
                onDateSelected: (date) => selectedAnniversaryDate.value = date,
                validator:
                    (val) =>
                        val == null ? 'Anniversary date is required' : null,
                lastDate: DateTime.now(), // Anniversary cannot be in future
              ),
              AppTextField(
                // C# 'RetirementNumber' is not nullable
                controller: retirementNumberController,
                labelText: "Spouse's Retirement Number *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Retirement number is required'
                            : null,
              ),
              AppTextField(
                // C# 'TIN' is not nullable
                controller: tinController,
                labelText: "Spouse's TIN *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty) ? 'TIN is required' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialSpouse == null ? 'Add Spouse' : 'Save Changes',
                ),
                onPressed: handleSaveChanges,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
