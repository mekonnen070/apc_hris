// lib/features/transfer/presentation/request_transfer_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/transfer/application/transfer_request_form_providers.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:toastification/toastification.dart';

class RequestTransferScreen extends HookConsumerWidget {
  const RequestTransferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final formNotifier = ref.read(transferRequestFormNotifierProvider.notifier);
    final formState = ref.watch(transferRequestFormNotifierProvider);

    // Initialize the form with current employee data when the screen is first built
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Initialize the form with current employee data
        formNotifier.initializeNewRequest();
      });
      return null;
    }, const []);

    // Listen for success/error messages from the notifier
    ref.listen<String?>(
      transferRequestFormNotifierProvider.select((s) => s.successMessage),
      (prev, next) {
        if (next != null) {
          Toastification().show(
            context: context,
            title: Text(next),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 3),
          );
          // Optionally clear the form after success or navigate back
          formKey.currentState?.reset();
          formNotifier
              .initializeNewRequest(); // Reset notifier state for a new request
        }
      },
    );
    ref.listen<String?>(
      transferRequestFormNotifierProvider.select((s) => s.errorMessage),
      (prev, next) {
        if (next != null) {
          Toastification().show(
            context: context,
            title: Text(next),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
      },
    );

    final currentRequestData = formState.transferRequestData;

    Future<void> handleSubmit() async {
      if (formKey.currentState?.saveAndValidate() ?? false) {
        final formData = formKey.currentState!.value;

        formNotifier.updateField(
          requestedDepartment: formData['requestedDepartment'] as String,
          requestedLocation: formData['requestedLocation'] as String,
          requestedPositionTitle: formData['requestedPositionTitle'] as String?,
          reasonForRequest: formData['reasonForRequest'] as String,
        );

        await formNotifier.submitTransferRequest();
      } else {
        Toastification().show(
          context: context,
          title: const Text('Please correct the errors in the form.'),
          type: ToastificationType.warning,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Current Employee Details:',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildDetailRow(
                context,
                'Employee ID',
                currentRequestData.employeeId,
              ),
              _buildDetailRow(
                context,
                'Full Name',
                currentRequestData.employeeFullName,
              ),
              _buildDetailRow(
                context,
                'Current Position',
                currentRequestData.currentPositionTitle,
              ),
              _buildDetailRow(
                context,
                'Current Department',
                currentRequestData.currentDepartment,
              ),
              _buildDetailRow(
                context,
                'Current Location',
                currentRequestData.currentLocation,
              ),
              const Divider(height: 32),
              Text(
                'New Transfer Request:',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: useTextEditingController(
                  text: currentRequestData.requestedDepartment,
                ),
                labelText: 'Requested Department *',
                hintText: 'e.g., CID, Traffic Police, HR',
                validator: FormBuilderValidators.required(
                  errorText: 'Requested department is required.',
                ),
                onChanged:
                    (value) =>
                        formNotifier.updateField(requestedDepartment: value),
              ),
              AppTextField(
                controller: useTextEditingController(
                  text: currentRequestData.requestedLocation,
                ),
                labelText: 'Requested Location *',
                hintText: 'e.g., Gondar Zonal Office, Bahir Dar City',
                validator: FormBuilderValidators.required(
                  errorText: 'Requested location is required.',
                ),
                onChanged:
                    (value) =>
                        formNotifier.updateField(requestedLocation: value),
              ),
              AppTextField(
                controller: useTextEditingController(
                  text: currentRequestData.requestedPositionTitle,
                ),
                labelText: 'Requested Position Title (Optional)',
                hintText: 'e.g., Investigator, Trainer',
                onChanged:
                    (value) =>
                        formNotifier.updateField(requestedPositionTitle: value),
              ),
              AppTextField(
                controller: useTextEditingController(
                  text: currentRequestData.reasonForRequest,
                ),
                labelText: 'Reason for Request *',
                hintText:
                    'Provide a detailed reason for your transfer request.',
                maxLines: 4,
                validator: FormBuilderValidators.required(
                  errorText: 'Reason for request is required.',
                ),
                onChanged:
                    (value) =>
                        formNotifier.updateField(reasonForRequest: value),
              ),
              const SizedBox(height: 24),
              Center(
                child:
                    formState.isSubmitting
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                          onPressed: handleSubmit,
                          icon: const Icon(Icons.send_rounded),
                          label: const Text('Submit Transfer Request'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
