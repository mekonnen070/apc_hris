import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
// Your extension for display names
import 'package:police_com/core/extensions/enum_extension.dart';
// Models & Enums
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
// Reusable Widgets
import 'package:police_com/features/widgets/app_text_field.dart';

// This helper function is now a top-level function for better reusability and performance.
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

class AddEditEmployeeContactScreen extends HookConsumerWidget {
  final EmployeeContactModel? initialContact;
  final String employeeId; // The ID of the employee this contact belongs to

  const AddEditEmployeeContactScreen({
    super.key,
    this.initialContact,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Initialize controllers and local state from initialContact if editing, or defaults if adding
    final fullNameController = useTextEditingController(
      text: initialContact?.fullName ?? '',
    );
    final addressController = useTextEditingController(
      text: initialContact?.address ?? '',
    );
    final phoneController = useTextEditingController(
      text: initialContact?.phone ?? '',
    );
    final mobileController = useTextEditingController(
      text: initialContact?.mobile ?? '',
    );
    final emailController = useTextEditingController(
      text: initialContact?.email ?? '',
    );

    final selectedRelationship = useState<RelationTypes>(
      initialContact?.relationship ?? RelationTypes.other,
    );
    final isPrimaryContact = useState<bool>(initialContact?.isPrimary ?? false);
    // isActive is managed by the model's default and not typically user-editable on this screen.

    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        final contact = EmployeeContactModel(
          contactId: initialContact?.contactId ?? UniqueKey().toString(),
          employeeId: initialContact?.employeeId ?? employeeId,
          fullName: fullNameController.text,
          relationship: selectedRelationship.value,
          address:
              addressController.text.isEmpty ? null : addressController.text,
          phone: phoneController.text,
          mobile: mobileController.text.isEmpty ? null : mobileController.text,
          email: emailController.text.isEmpty ? null : emailController.text,
          isPrimary: isPrimaryContact.value,
          isActive: initialContact?.isActive ?? true,
          // Audit fields are handled by the backend.
        );
        // Return the saved/updated contact model to the previous screen (EmployeeContactsScreen)
        Navigator.of(context).pop(contact);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialContact == null ? 'Add New Contact' : 'Edit Contact',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Contact',
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
                labelText: 'Full Name *',
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Full name is required'
                            : null,
                textInputAction: TextInputAction.next,
              ),
              AppDropdownField<RelationTypes>(
                labelText: 'Relationship *',
                value: selectedRelationship.value,
                items: _buildEnumDropdownItems(
                  RelationTypes.values,
                ), // Using the helper
                onChanged:
                    (val) =>
                        selectedRelationship.value = val ?? RelationTypes.other,
                validator:
                    (val) => val == null ? 'Relationship is required' : null,
              ),
              AppTextField(
                controller: phoneController,
                labelText: 'Primary Phone *',
                keyboardType: TextInputType.phone,
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Phone number is required'
                            : null,
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: mobileController,
                labelText: 'Mobile Phone (Optional)',
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.next,
              ),
              AppTextField(
                controller: addressController,
                labelText: 'Address (Optional)',
                maxLines: 2,
                textInputAction: TextInputAction.done, // Last text field
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isPrimaryContact.value,
                      onChanged: (val) {
                        // TODO: Add logic in EmployeeCreationNotifier to ensure only one contact is primary.
                        // When a contact is set as primary, the notifier should iterate through other
                        // contacts and set their isPrimary to false.
                        isPrimaryContact.value = val ?? false;
                      },
                    ),
                    const Text('Set as Primary Contact'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialContact == null ? 'Add Contact' : 'Save Changes',
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
