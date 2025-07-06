import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/transfer_levels.dart';
import 'package:police_com/core/enums/transfer_period.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/transfer/application/transfer_notifier.dart';
import 'package:police_com/features/transfer/application/transfer_options_provider.dart';
import 'package:police_com/features/transfer/domain/department.dart';
import 'package:police_com/features/transfer/domain/location_data.dart';
import 'package:police_com/features/transfer/domain/position.dart';
import 'package:police_com/features/transfer/domain/transfer_request_create.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';

class RequestTransferForm extends HookConsumerWidget {
  final LocationData locationData;
  const RequestTransferForm({super.key, required this.locationData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Form State
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);
    final employeeId = ref.watch(currentEmployeeIdProvider);

    // Form Field State - Using hooks to manage selections
    final transferReason = useState<TransferReasons?>(null);
    final transferPeriod = useState<TransferPeriod?>(null);
    final transferLevelTo = useState<TransferLevels?>(null);
    final transferLevelFrom = useState<TransferLevels?>(null);
    // --- State for dependent dropdowns ---
    final selectedDepartment = useState<Department?>(null);
    final selectedPosition = useState<Position?>(null);

    void handleSubmit() async {
      if (!formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Please fill all required fields.'),
          ),
        );
        return;
      }
      isSubmitting.value = true;

      // --- THE FIX IS HERE ---
      // Replaced hardcoded 'toLocation' and 'toLocationId' with the
      // values from the locationData object that was fetched for the employee.
      final request = TransferRequestCreate(
        employeeId: employeeId!,
        currentLocation: locationData.location,
        currentLocationId: locationData.locationId,
        currentDepartment: locationData.department,
        currentPosition: locationData.position,
        transferLevelFrom: transferLevelFrom.value!,
        transferLevelTo: transferLevelTo.value!,
        toLocation: locationData.location,
        toLocationId: locationData.locationId,
        toDepartment: selectedDepartment.value!.departmentName,
        toDepartmentId: selectedDepartment.value!.id,
        toPosition: selectedPosition.value!.designationName,
        toPositionId: selectedPosition.value!.designationId,
        requestDate: DateTime.now(),
        transferPeriod: transferPeriod.value!,
        transferYear: DateTime.now().year.toString(),
        transferReason: transferReason.value!,
      );

      try {
        await ref
            .read(transferNotifierProvider.notifier)
            .createTransferRequest(request);
        Navigator.of(context).pop(true); // Pop with true to signal success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Transfer request submitted successfully!'),
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

    // The rest of the widget build method remains unchanged...
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
            'Transfer Destination',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          const SizedBox(height: 8),

          // --- Cascading Dropdowns ---
          ref
              .watch(departmentsByLocationProvider(locationData.locationId))
              .when(
                data:
                    (departments) => AppDropdownField<Department>(
                      labelText: 'Department',
                      value: selectedDepartment.value,
                      items:
                          departments
                              .map(
                                (d) => DropdownMenuItem(
                                  value: d,
                                  child: Text(d.departmentName),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        selectedDepartment.value = value;
                        selectedPosition.value =
                            null; // CRITICAL: Reset position when department changes
                      },
                      validator: FormBuilderValidators.required(),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Text('Error loading departments: $e'),
              ),
          const SizedBox(height: 16),
          // Dependent dropdown for Position
          if (selectedDepartment.value != null)
            ref
                .watch(
                  positionsByDepartmentProvider(selectedDepartment.value!.id),
                )
                .when(
                  data:
                      (positions) => AppDropdownField<Position>(
                        labelText: 'Position',
                        value: selectedPosition.value,
                        items:
                            positions
                                .map(
                                  (p) => DropdownMenuItem(
                                    value: p,
                                    child: Text(p.designationName),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => selectedPosition.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error: (e, s) => Text('Error loading positions: $e'),
                ),

          const SizedBox(height: 24),
          Text(
            'Transfer Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          const SizedBox(height: 8),

          // --- Static Enum Dropdowns ---
          AppDropdownField<TransferLevels>(
            labelText: 'From Level',
            value: transferLevelFrom.value,
            items:
                TransferLevels.values
                    .map(
                      (l) => DropdownMenuItem(
                        value: l,
                        child: Text(l.name.toDisplayCase()),
                      ),
                    )
                    .toList(),
            onChanged: (v) => transferLevelFrom.value = v,
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          AppDropdownField<TransferLevels>(
            labelText: 'To Level',
            value: transferLevelTo.value,
            items:
                TransferLevels.values
                    .map(
                      (l) => DropdownMenuItem(
                        value: l,
                        child: Text(l.name.toDisplayCase()),
                      ),
                    )
                    .toList(),
            onChanged: (v) => transferLevelTo.value = v,
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          AppDropdownField<TransferPeriod>(
            labelText: 'Period',
            value: transferPeriod.value,
            items:
                TransferPeriod.values
                    .map(
                      (p) => DropdownMenuItem(
                        value: p,
                        child: Text(p.name.toDisplayCase()),
                      ),
                    )
                    .toList(),
            onChanged: (v) => transferPeriod.value = v,
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          AppDropdownField<TransferReasons>(
            labelText: 'Reason',
            value: transferReason.value,
            items:
                TransferReasons.values
                    .map(
                      (r) => DropdownMenuItem(
                        value: r,
                        child: Text(r.name.toDisplayCase()),
                      ),
                    )
                    .toList(),
            onChanged: (v) => transferReason.value = v,
            validator: FormBuilderValidators.required(),
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
    );
  }

  // Helper widget for displaying info
  Widget _buildInfoSection(
    BuildContext context,
    String title,
    Map<String, String> details,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children:
                  details.entries
                      .map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${entry.key}: ',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  entry.value,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
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
