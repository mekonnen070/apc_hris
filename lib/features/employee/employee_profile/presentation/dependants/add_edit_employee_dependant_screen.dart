import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee/employee_profile/domain/employee_dependant_model.dart';

import '../../../../widgets/app_date_field.dart';
import '../../../../widgets/app_dropdown_field.dart';
// No direct ref.watch needed here if data is passed in and result popped.

// Reusable Widgets
import '../../../../widgets/app_text_field.dart';

class AddEditEmployeeDependantScreen extends HookWidget {
  // Changed to HookWidget for useState/useMemoized
  final EmployeeDependantModel? initialDependant;
  final String employeeId; // ID of the employee this dependant belongs to

  const AddEditEmployeeDependantScreen({
    super.key,
    this.initialDependant,
    required this.employeeId,
  });

  // Helper for Enum Dropdown Items
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

  // Example display name getters (ideally these would be extensions or part of localization)
  static String _getRelationTypeDisplayName(RelationTypes r) =>
      r.name[0].toUpperCase() + r.name.substring(1);
  static String _getGenderDisplayName(Gender g) =>
      g.name[0].toUpperCase() + g.name.substring(1);
  static String _getEthiopianRegionDisplayName(EthiopianRegion r) {
    // Add spaces before capital letters for multi-word enum values if needed
    String name =
        r.name
            .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
            .trim();
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final fullNameController = useTextEditingController(
      text: initialDependant?.dependantFullName ?? '',
    );
    final occupationController = useTextEditingController(
      text: initialDependant?.occupation ?? '',
    );
    // For Ethiopian Address Fields:
    final zoneController = useTextEditingController(
      text: initialDependant?.zone ?? '',
    );
    final woredaController = useTextEditingController(
      text: initialDependant?.woreda ?? '',
    );
    final kebeleController = useTextEditingController(
      text: initialDependant?.kebele ?? '',
    );
    final houseNumberController = useTextEditingController(
      text: initialDependant?.houseNumber ?? '',
    );
    final phoneNumberController = useTextEditingController(
      text: initialDependant?.phoneNumber ?? '',
    );
    final altPhoneNumberController = useTextEditingController(
      text: initialDependant?.alternatePhoneNumber ?? '',
    );
    final emailController = useTextEditingController(
      text: initialDependant?.email ?? '',
    );

    final selectedRelation = useState<RelationTypes>(
      initialDependant?.relation ?? RelationTypes.child,
    ); // Sensible default
    final selectedGender = useState<Gender>(
      initialDependant?.gender ?? Gender.other,
    ); // Default
    final selectedBirthDate = useState<DateTime?>(initialDependant?.birthDate);
    final selectedRegion = useState<EthiopianRegion>(
      initialDependant?.region ?? EthiopianRegion.addisAbaba,
    ); // Default
    final isEnabled = useState<bool>(initialDependant?.enabled ?? true);

    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        final dependant = EmployeeDependantModel(
          dependantId: initialDependant?.dependantId ?? UniqueKey().toString(),
          employeeId: initialDependant?.employeeId ?? employeeId,
          dependantFullName: fullNameController.text,
          relation: selectedRelation.value,
          gender: selectedGender.value,
          birthDate:
              selectedBirthDate.value!, // Validator ensures it's not null
          occupation:
              occupationController.text.isEmpty
                  ? null
                  : occupationController.text,
          region: selectedRegion.value,
          zone: zoneController.text.isEmpty ? null : zoneController.text,
          woreda: woredaController.text.isEmpty ? null : woredaController.text,
          kebele: kebeleController.text.isEmpty ? null : kebeleController.text,
          houseNumber:
              houseNumberController.text.isEmpty
                  ? null
                  : houseNumberController.text,
          phoneNumber: phoneNumberController.text,
          alternatePhoneNumber:
              altPhoneNumberController.text.isEmpty
                  ? null
                  : altPhoneNumberController.text,
          email: emailController.text.isEmpty ? null : emailController.text,
          enabled: isEnabled.value,
          // entryBy and entryDate are handled by the backend
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
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Dependant',
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
                controller: fullNameController,
                labelText: "Dependant's Full Name *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Full name is required'
                            : null,
              ),
              AppDropdownField<RelationTypes>(
                labelText: 'Relationship to Employee *',
                value: selectedRelation.value,
                items: _buildDropdownItems(
                  RelationTypes.values,
                  _getRelationTypeDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedRelation.value = val ?? RelationTypes.child,
                validator:
                    (val) => val == null ? 'Relationship is required' : null,
              ),
              AppDropdownField<Gender>(
                labelText: 'Gender *',
                value: selectedGender.value,
                items: _buildDropdownItems(
                  Gender.values,
                  _getGenderDisplayName,
                ),
                onChanged: (val) => selectedGender.value = val ?? Gender.other,
                validator: (val) => val == null ? 'Gender is required' : null,
              ),
              AppDateField(
                labelText: 'Date of Birth *',
                selectedDate: selectedBirthDate.value,
                onDateSelected: (date) => selectedBirthDate.value = date,
                validator:
                    (val) => val == null ? 'Date of birth is required' : null,
                lastDate: DateTime.now(), // Dependant's DOB cannot be in future
              ),
              AppTextField(
                controller: occupationController,
                labelText: 'Occupation (Optional)',
              ),

              const SizedBox(height: 16),
              Text(
                "Dependant's Address",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              AppDropdownField<EthiopianRegion>(
                labelText: 'Region *',
                value: selectedRegion.value,
                items: _buildDropdownItems(
                  EthiopianRegion.values,
                  _getEthiopianRegionDisplayName,
                ),
                onChanged:
                    (val) =>
                        selectedRegion.value =
                            val ?? EthiopianRegion.addisAbaba,
                validator: (val) => val == null ? 'Region is required' : null,
              ),
              // TODO: Implement dependent dropdowns or searchable selectors for Zone, Woreda, Kebele
              // based on the selected Region using the detailed location enums.
              // For now, they are text fields as per the model's String? type.
              AppTextField(
                controller: zoneController,
                labelText: 'Zone (Optional)',
              ),
              AppTextField(
                controller: woredaController,
                labelText: 'Woreda (Optional)',
              ),
              AppTextField(
                controller: kebeleController,
                labelText: 'Kebele (Optional)',
              ),
              AppTextField(
                controller: houseNumberController,
                labelText: 'House Number (Optional)',
              ),

              const SizedBox(height: 16),
              Text(
                "Dependant's Contact",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              AppTextField(
                controller: phoneNumberController,
                labelText: 'Phone Number *',
                keyboardType: TextInputType.phone,
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Phone number is required'
                            : null,
              ),
              AppTextField(
                controller: altPhoneNumberController,
                labelText: 'Alternate Phone (Optional)',
                keyboardType: TextInputType.phone,
              ),
              AppTextField(
                controller: emailController,
                labelText: 'Email (Optional)',
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val != null &&
                      val.isNotEmpty &&
                      !RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(val)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isEnabled.value,
                      onChanged: (val) => isEnabled.value = val ?? true,
                    ),
                    const Text('Is this dependant record enabled?'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialDependant == null ? 'Add Dependant' : 'Save Changes',
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
