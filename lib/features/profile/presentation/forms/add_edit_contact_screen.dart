// lib/features/profile/presentation/forms/add_edit_contact_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_contact_model.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class AddEditContactScreen extends HookWidget {
  final EmployeeContactModel? initialContact;
  final String employeeId;

  const AddEditContactScreen({
    super.key,
    this.initialContact,
    required this.employeeId,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
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

    void handleSaveChanges() {
      if (formKey.currentState!.validate()) {
        final contact = EmployeeContactModel(
          contactId: initialContact?.contactId,
          employeeId: employeeId,
          fullName: fullNameController.text,
          relationship: selectedRelationship.value,
          address: addressController.text,
          phone: phoneController.text,
          mobile: mobileController.text,
          email: emailController.text,
        );
        Navigator.of(context).pop(contact);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(initialContact == null ? 'Add Contact' : 'Edit Contact'),
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
                labelText: 'Full Name *',
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppDropdownField<RelationTypes>(
                labelText: 'Relationship *',
                value: selectedRelationship.value,
                items:
                    RelationTypes.values
                        .map(
                          (r) =>
                              DropdownMenuItem(value: r, child: Text(r.name)),
                        )
                        .toList(),
                onChanged:
                    (v) =>
                        selectedRelationship.value = v ?? RelationTypes.other,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: phoneController,
                labelText: 'Phone *',
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: mobileController,
                labelText: 'Mobile',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: addressController,
                labelText: 'Address',
                maxLines: 2,
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
