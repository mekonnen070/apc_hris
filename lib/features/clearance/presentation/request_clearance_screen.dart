import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/enums/clearance_type.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/clearance/application/clearance_notifier.dart';
import 'package:police_com/features/clearance/domain/clearance_request_create.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:uuid/uuid.dart';

class RequestClearanceScreen extends HookConsumerWidget {
  const RequestClearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);
    final employeeId = ref.watch(currentEmployeeIdProvider);

    final clearanceType = useState<ClearanceType?>(null);
    final completionDate = useState<DateTime?>(null);
    final remarksController = useTextEditingController();

    void handleSubmit() async {
      if (!formKey.currentState!.validate()) return;
      if (employeeId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Error: Not logged in.')));
        return;
      }

      isSubmitting.value = true;

      final request = ClearanceRequestCreate(
        requestId: const Uuid().v4(),
        employeeId: employeeId,
        type: clearanceType.value!,
        requestDate: DateTime.now(),
        targetCompletionDate: completionDate.value,
        clearanceStatus: ClearanceStatus.pending,
        remarks: remarksController.text,
      );

      try {
        await ref
            .read(clearanceNotifierProvider.notifier)
            .createRequest(request);
        // Pop with true to signal success to the previous screen
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Clearance request submitted successfully!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Submission Failed: $e'),
          ),
        );
      } finally {
        isSubmitting.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New Clearance Request')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            AppDropdownField<ClearanceType>(
              labelText: 'Reason for Clearance',
              value: clearanceType.value,
              items:
                  ClearanceType.values
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(t.name.toDisplayCase()),
                        ),
                      )
                      .toList(),
              onChanged: (value) => clearanceType.value = value,
              validator: FormBuilderValidators.required(),
              isRequired: true,
            ),
            const SizedBox(height: 16),

            // --- This is the corrected usage of AppDateField ---
            AppDateField(
              labelText: 'Target Completion Date (Optional)',
              selectedDate: completionDate.value,
              onDateSelected: (date) {
                completionDate.value = date;
              },
              // No validator as it's optional
            ),

            const SizedBox(height: 16),
            AppTextField(
              controller: remarksController,
              labelText: 'Remarks (Optional)',
              maxLines: 4,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: isSubmitting.value ? null : handleSubmit,
                child:
                    isSubmitting.value
                        ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                        : const Text('Submit Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
