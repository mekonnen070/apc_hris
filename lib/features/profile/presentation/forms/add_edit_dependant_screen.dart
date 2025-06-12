// lib/features/profile/presentation/forms/add_edit_dependant_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_dependant_model.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditDependantScreen extends HookWidget {
  final EmployeeDependantModel? initialDependant;
  final String employeeId;

  const AddEditDependantScreen({
    super.key,
    this.initialDependant,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final fullNameController = useTextEditingController(
      text: initialDependant?.dependantFullName ?? '',
    );
    final occupationController = useTextEditingController(
      text: initialDependant?.occupation ?? '',
    );
    final phoneNumberController = useTextEditingController(
      text: initialDependant?.phoneNumber ?? '',
    );
    final selectedRelation = useState<RelationTypes>(
      initialDependant?.relation ?? RelationTypes.child,
    );
    final selectedGender = useState<Gender>(
      initialDependant?.gender ?? Gender.other,
    );
    final selectedBirthDate = useState<DateTime?>(initialDependant?.birthDate);
    final selectedRegion = useState<EthiopianRegion>(
      initialDependant?.region ?? EthiopianRegion.addisAbaba,
    );

    void handleSaveChanges() {
      if (formKey.currentState!.validate()) {
        final dependant = EmployeeDependantModel(
          dependantId: initialDependant?.dependantId,
          employeeId: employeeId,
          dependantFullName: fullNameController.text,
          relation: selectedRelation.value,
          gender: selectedGender.value,
          birthDate: selectedBirthDate.value!,
          occupation: occupationController.text,
          region: selectedRegion.value,
          phoneNumber: phoneNumberController.text,
        );
        Navigator.of(context).pop(dependant);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialDependant == null ? 'Add Dependant' : 'Edit Dependant',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: handleSaveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: fullNameController,
                labelText: "Dependant's Full Name *",
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<RelationTypes>(
                labelText: 'Relationship *',
                value: selectedRelation.value,
                items:
                    RelationTypes.values
                        .map(
                          (r) =>
                              DropdownMenuItem(value: r, child: Text(r.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedRelation.value = val ?? RelationTypes.child,
              ),
              const SizedBox(height: 16),
              AppDropdownField<Gender>(
                labelText: 'Gender *',
                value: selectedGender.value,
                items:
                    Gender.values
                        .map(
                          (g) =>
                              DropdownMenuItem(value: g, child: Text(g.name)),
                        )
                        .toList(),
                onChanged: (val) => selectedGender.value = val ?? Gender.other,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: 'Date of Birth *',
                selectedDate: selectedBirthDate.value,
                onDateSelected: (d) => selectedBirthDate.value = d,
                validator: (d) => d == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: occupationController,
                labelText: 'Occupation',
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: phoneNumberController,
                labelText: 'Phone Number *',
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<EthiopianRegion>(
                labelText: 'Region *',
                value: selectedRegion.value,
                items:
                    EthiopianRegion.values
                        .map(
                          (r) =>
                              DropdownMenuItem(value: r, child: Text(r.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        selectedRegion.value =
                            val ?? EthiopianRegion.addisAbaba,
              ),
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
