import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/transfer_levels.dart';
import 'package:police_com/core/enums/transfer_period.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/transfer/application/transfer_notifier.dart';
import 'package:police_com/features/transfer/domain/location_data.dart';
import 'package:police_com/features/transfer/domain/transfer_request_create.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class RequestTransferForm extends HookConsumerWidget {
  final LocationData locationData;
  const RequestTransferForm({super.key, required this.locationData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final toLocationController = useTextEditingController();
    final toDepartmentController = useTextEditingController();
    final toPositionController = useTextEditingController();
    final reason = useState<TransferReasons?>(null);
    final isSubmitting = useState(false);
    final employeeId = ref.watch(currentEmployeeIdProvider);

    void handleSubmit() async {
      if (formKey.currentState?.validate() != true) return;
      if (employeeId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cannot find employee details.')),
        );
        return;
      }

      isSubmitting.value = true;

      final request = TransferRequestCreate(
        employeeId: employeeId,
        currentLocation: locationData.location,
        currentLocationId: locationData.locationId,
        currentDepartment: locationData.department,
        currentPosition: locationData.position,
        transferLevelFrom: TransferLevels.zone,
        transferLevelTo: TransferLevels.zone,
        toLocation: toLocationController.text,
        toLocationId: toLocationController.text,
        toDepartment: toDepartmentController.text,
        toDepartmentId: toDepartmentController.text,
        toPosition: toPositionController.text,
        toPositionId: toPositionController.text,
        requestDate: DateTime.now(),
        transferPeriod: TransferPeriod.january,
        transferYear: DateTime.now().year.toString(),
        transferReason: reason.value!,
      );

      try {
        await ref
            .read(transferNotifierProvider.notifier)
            .createTransferRequest(request);
        Navigator.of(context).pop(); // Go back after successful submission
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Transfer request submitted!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed to submit: $e'),
          ),
        );
      } finally {
        isSubmitting.value = false;
      }
    }

    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildInfoSection(context, 'Current Details', {
            'Location': locationData.location,
            'Department': locationData.department,
            'Position': locationData.position,
          }),
          const SizedBox(height: 24),
          Text(
            'Requested Destination',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          const SizedBox(height: 8),
          AppTextField(
            controller: toLocationController,
            labelText: 'Requested Location',
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: toDepartmentController,
            labelText: 'Requested Department',
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          AppDropdownField<TransferReasons>(
            labelText: 'Reason for Request',
            value: reason.value,
            items:
                TransferReasons.values
                    .map((r) => DropdownMenuItem(value: r, child: Text(r.name)))
                    .toList(),
            onChanged: (value) => reason.value = value,
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: isSubmitting.value ? null : handleSubmit,
              child:
                  isSubmitting.value
                      ? const CircularProgressIndicator()
                      : const Text('Submit Request'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context,
    String title,
    Map<String, String> details,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const Divider(),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children:
                  details.entries
                      .map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${entry.key}: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(child: Text(entry.value)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
