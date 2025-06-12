import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee_profile/domain/employee_spouse_model.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditSpouseScreen extends HookConsumerWidget {
  final EmployeeSpouseModel? initialSpouse;
  final String employeeId;

  const AddEditSpouseScreen({
    super.key,
    this.initialSpouse,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController(
      text: initialSpouse?.title ?? '',
    );
    final fullNameController = useTextEditingController(
      text: initialSpouse?.spouseFullName ?? '',
    );
    final selectedGender = useState<Gender>(
      initialSpouse?.gender ?? Gender.other,
    );
    final birthDate = useState<DateTime?>(initialSpouse?.spouseBirthDate);
    final phoneController = useTextEditingController(
      text: initialSpouse?.spousePhone ?? '',
    );
    final occupationController = useTextEditingController(
      text: initialSpouse?.spouseOccupation ?? '',
    );
    final motherNameController = useTextEditingController(
      text: initialSpouse?.motherName ?? '',
    );
    final addressController = useTextEditingController(
      text: initialSpouse?.address ?? '',
    );
    final anniversaryDate = useState<DateTime?>(initialSpouse?.anniversaryDate);
    final retirementNumberController = useTextEditingController(
      text: initialSpouse?.retirementNumber ?? '',
    );
    final tinController = useTextEditingController(
      text: initialSpouse?.tin ?? '',
    );

    void handleSaveChanges() {
      if (formKey.currentState!.validate()) {
        final spouse = EmployeeSpouseModel(
          spouseId: initialSpouse?.spouseId,
          employeeId: employeeId,
          title: titleController.text,
          spouseFullName: fullNameController.text,
          gender: selectedGender.value,
          spouseBirthDate: birthDate.value!,
          spousePhone: phoneController.text,
          spouseOccupation: occupationController.text,
          motherName: motherNameController.text,
          address: addressController.text,
          anniversaryDate: anniversaryDate.value,
          retirementNumber: retirementNumberController.text,
          tin: tinController.text,
        );
        Navigator.of(context).pop(spouse);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(initialSpouse == null ? 'Add Spouse' : 'Edit Spouse'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
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
                labelText: 'Title (e.g., Mr., Mrs., Ms.) *',
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Title is required'
                            : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: fullNameController,
                labelText: 'Full Name *',
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Full name is required'
                            : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<Gender>(
                labelText: 'Gender *',
                value: selectedGender.value,
                items:
                    Gender.values.map((Gender value) {
                      return DropdownMenuItem<Gender>(
                        value: value,
                        child: Text(value.name.toDisplayCase()),
                      );
                    }).toList(),
                onChanged: (val) => selectedGender.value = val ?? Gender.other,
                validator: (val) => val == null ? 'Gender is required' : null,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: 'Date of Birth *',
                selectedDate: birthDate.value,
                onDateSelected: (date) => birthDate.value = date,
                validator:
                    (val) => val == null ? 'Date of birth is required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: phoneController,
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: occupationController,
                labelText: 'Occupation',
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: motherNameController,
                labelText: 'Mother\'s Full Name',
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: addressController,
                labelText: 'Address *',
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Address is required'
                            : null,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: 'Anniversary Date',
                selectedDate: anniversaryDate.value,
                onDateSelected: (date) => anniversaryDate.value = date,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: retirementNumberController,
                labelText: 'Retirement Number',
              ),
              const SizedBox(height: 16),
              AppTextField(controller: tinController, labelText: 'TIN Number'),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: handleSaveChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
