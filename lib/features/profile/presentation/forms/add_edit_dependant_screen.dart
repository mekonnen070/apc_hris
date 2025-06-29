import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
          initialDependant == null ? context.lango.addDependant : context.lango.editDependant, // <-- REPLACED
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
                labelText: context.lango.dependantsFullNameLabel, // <-- REPLACED
                validator: (v) => v!.isEmpty ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDropdownField<RelationTypes>(
                labelText: context.lango.relationshipLabel, // <-- REPLACED
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
                labelText: context.lango.genderLabel, // <-- REPLACED
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
                labelText: context.lango.dateOfBirthLabel, // <-- REPLACED
                selectedDate: selectedBirthDate.value,
                onDateSelected: (d) => selectedBirthDate.value = d,
                validator: (d) => d == null ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: occupationController,
                labelText: context.lango.occupationLabel, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: phoneNumberController,
                labelText: context.lango.phoneNumberLabel, // <-- REPLACED
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? context.lango.requiredField : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDropdownField<EthiopianRegion>(
                labelText: context.lango.regionLabel, // <-- REPLACED
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
                child: Text(context.lango.saveChanges), // <-- REPLACED
              ),
            ],
          ),
        ),
      ),
    );
  }
}