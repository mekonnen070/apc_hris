import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/enums/staff_title.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
    final selectedTitle = useState<StaffTitle?>(initialSpouse?.title);
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
          title: selectedTitle.value,
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
        title: Text(
          initialSpouse == null
              ? context.lango.addSpouse
              : context.lango.editSpouse,
        ), // <-- REPLACED
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: handleSaveChanges,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppDropdownField<StaffTitle>(
                  labelText: context.lango.titleLabel,
                  value: selectedTitle.value,
                  items:
                      StaffTitle.values.map((StaffTitle value) {
                        return DropdownMenuItem<StaffTitle>(
                          value: value,
                          child: Text(value.name.toDisplayCase()),
                        );
                      }).toList(),
                  onChanged: (val) => selectedTitle.value = val,
                  validator:
                      (val) =>
                          val == null
                              ? context.lango.titleIsRequired
                              : null,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: fullNameController,
                  labelText: context.lango.fullNameLabel, // <-- REPLACED
                  validator:
                      (val) =>
                          (val == null || val.isEmpty)
                              ? context
                                  .lango
                                  .fullNameIsRequired // <-- REPLACED
                              : null,
                ),
                const SizedBox(height: 16),
                AppDropdownField<Gender>(
                  labelText: context.lango.genderLabel, // <-- REPLACED
                  value: selectedGender.value,
                  items:
                      Gender.values.map((Gender value) {
                        return DropdownMenuItem<Gender>(
                          value: value,
                          child: Text(value.name.toDisplayCase()),
                        );
                      }).toList(),
                  onChanged: (val) => selectedGender.value = val ?? Gender.other,
                  validator:
                      (val) =>
                          val == null
                              ? context.lango.genderIsRequired
                              : null, // <-- REPLACED
                ),
                const SizedBox(height: 16),
                AppDateField(
                  labelText: context.lango.dateOfBirthLabel, // <-- REPLACED
                  selectedDate: birthDate.value,
                  onDateSelected: (date) => birthDate.value = date,
                  validator:
                      (val) =>
                          val == null
                              ? context.lango.birthDateIsRequired
                              : null, // <-- REPLACED
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: phoneController,
                  labelText: context.lango.phoneNumber, // <-- REPLACED
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: occupationController,
                  labelText: context.lango.occupationLabel, // <-- REPLACED
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: motherNameController,
                  labelText: context.lango.mothersFullName, // <-- REPLACED
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: addressController,
                  labelText: context.lango.addressLabel, // <-- REPLACED
                  validator:
                      (val) =>
                          (val == null || val.isEmpty)
                              ? context
                                  .lango
                                  .addressIsRequired // <-- REPLACED
                              : null,
                ),
                const SizedBox(height: 16),
                AppDateField(
                  labelText: context.lango.anniversaryDate, // <-- REPLACED
                  selectedDate: anniversaryDate.value,
                  onDateSelected: (date) => anniversaryDate.value = date,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: retirementNumberController,
                  labelText: context.lango.retirementNumber, // <-- REPLACED
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: tinController,
                  labelText: context.lango.tinNumber,
                ), // <-- REPLACED
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: handleSaveChanges,
                  child: Text(context.lango.saveChanges), // <-- REPLACED
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
