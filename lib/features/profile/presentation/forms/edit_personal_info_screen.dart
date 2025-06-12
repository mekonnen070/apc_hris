// lib/features/profile/presentation/forms/edit_personal_info_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class EditPersonalInfoScreen extends HookConsumerWidget {
  final EmployeeInfoModel employeeInfo;
  const EditPersonalInfoScreen({super.key, required this.employeeInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final phoneController = useTextEditingController(text: employeeInfo.phone);
    final mobileController = useTextEditingController(
      text: employeeInfo.mobile,
    );
    final address1Controller = useTextEditingController(
      text: employeeInfo.address1,
    );
    final emailController = useTextEditingController(text: employeeInfo.email);
    final maritalStatus = useState(employeeInfo.maritalStatus);
    final isLoading = useState(false);

    void handleSave() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        final updatedInfo = employeeInfo.copyWith(
          phone: phoneController.text,
          mobile: mobileController.text,
          address1: address1Controller.text,
          email: emailController.text,
          maritalStatus: maritalStatus.value,
        );

        await ref
            .read(profileNotifierProvider(employeeInfo.employeeId).notifier)
            .updatePersonalInfo(updatedInfo);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully')),
          );
          Navigator.of(context).pop();
        }
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Edit Personal Info',
        actions: [
          IconButton(
            onPressed: isLoading.value ? null : handleSave,
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Save Changes',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: phoneController,
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: mobileController,
                labelText: 'Mobile Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: emailController,
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: address1Controller,
                labelText: 'Address',
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              AppDropdownField<MaritalStatus>(
                labelText: 'Marital Status',
                value: maritalStatus.value,
                items:
                    MaritalStatus.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                onChanged:
                    (val) =>
                        maritalStatus.value = val ?? employeeInfo.maritalStatus,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading.value ? null : handleSave,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child:
                    isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
