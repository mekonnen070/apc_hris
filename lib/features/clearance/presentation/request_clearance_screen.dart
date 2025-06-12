// lib/features/clearance/presentation/request_clearance_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/clearance_reason.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/clearance/data/clearance_repository.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class RequestClearanceScreen extends HookConsumerWidget {
  const RequestClearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final commentsController = useTextEditingController();
    final lastDayOfWork = useState<DateTime?>(null);
    final reason = useState<ClearanceReason?>(null);
    final isLoading = useState(false);

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        final request = ClearanceRequest(
          id: 0, // Set by backend
          employeeId:
              'CURRENT_USER_ID', // Replace with actual authenticated user ID
          reason: reason.value!,
          requestDate: DateTime.now(),
          lastDayOfWork: lastDayOfWork.value!,
          comments: commentsController.text,
          status: ClearanceStatus.pending,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        try {
          await ref
              .read(clearanceRepositoryProvider)
              .submitClearanceRequest(request);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Clearance request submitted successfully'),
            ),
          );
          Navigator.of(context).pop(true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit request: $e')),
          );
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Request Clearance'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDropdownField<ClearanceReason>(
                labelText: 'Reason for Clearance',
                value: reason.value,
                items:
                    ClearanceReason.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.name.toDisplayCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) => reason.value = value,
                validator:
                    (value) => value == null ? 'Please select a reason' : null,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: 'Last Day of Work',
                onDateSelected: (date) => lastDayOfWork.value = date,
                validator:
                    (value) =>
                        lastDayOfWork.value == null
                            ? 'Please select a date'
                            : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: commentsController,
                labelText: 'Comments (Optional)',
                hintText: 'Provide any additional details.',
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading.value ? null : submitForm,
                child:
                    isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
