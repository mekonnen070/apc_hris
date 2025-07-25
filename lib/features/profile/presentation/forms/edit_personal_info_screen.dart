import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
            .read(profileNotifierProvider.notifier)
            .updatePersonalInfo(updatedInfo);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.lango.profileUpdatedSuccessfully)),
          );
          Navigator.of(context).pop();
        }
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: context.lango.editPersonalInfo,
        actions: [
          IconButton(
            onPressed: isLoading.value ? null : handleSave,
            icon: const Icon(Icons.save_outlined),
            tooltip: context.lango.saveChanges,
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
              children: [
                AppTextField(
                  controller: phoneController,
                  labelText: context.lango.phoneNumber,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: mobileController,
                  labelText: context.lango.mobileNumber,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: emailController,
                  labelText: context.lango.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: address1Controller,
                  labelText: context.lango.address,
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                AppDropdownField<MaritalStatus>(
                  labelText: context.lango.maritalStatus,
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
                          maritalStatus.value =
                              val ?? employeeInfo.maritalStatus,
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
                          : Text(context.lango.saveChanges),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
