import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/leave_mgmt/application/leave_notifier.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request_create.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request_edit.dart'; // Import the new Edit model
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

// A local provider to fetch the form data without affecting the main screen's state.
final _formDataProvider = FutureProvider.autoDispose((ref) {
  // We fetch the data from the main notifier to avoid another API call
  final leaveScreenData = ref.watch(leaveNotifierProvider).value;
  return leaveScreenData?.types ?? [];
});

class RequestLeaveScreen extends HookConsumerWidget {
  final LeaveRequest? requestToEdit;
  const RequestLeaveScreen({super.key, this.requestToEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = requestToEdit != null;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);

    // Form field state
    final selectedLeaveType = useState<LeaveType?>(null);
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);
    final reasonController = useTextEditingController();

    final formDataSource = ref.watch(_formDataProvider);

    // `useEffect` is used to initialize the form fields only once when editing.
    useEffect(() {
      if (isEditMode && formDataSource.hasValue) {
        final leaveTypes = formDataSource.value!;
        // Safely find the leave type
        try {
          selectedLeaveType.value = leaveTypes.firstWhere((t) => t.typeId == requestToEdit!.leaveTypeId);
        } catch (e) {
          // Handle case where leave type might not be in the list anymore
          selectedLeaveType.value = null;
        }
        startDate.value = requestToEdit!.startDate;
        endDate.value = requestToEdit!.endDate;
        reasonController.text = requestToEdit!.requestReason ?? '';
      }
      return null; // No cleanup needed
    }, [isEditMode, formDataSource.hasValue]);

    void handleSubmit() async {
      if (!formKey.currentState!.validate()) return;
      final employeeId = ref.read(currentEmployeeIdProvider);
      if (employeeId == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error: User not logged in')));
        return;
      }

      isSubmitting.value = true;
      final notifier = ref.read(leaveNotifierProvider.notifier);

      try {
        // --- THE FIX IS HERE ---
        if (isEditMode) {
          // Construct the LeaveRequestEdit model for editing
          final editRequest = LeaveRequestEdit(
            leaveRequestId: requestToEdit!.leaveRequestId!,
            leaveTypeId: selectedLeaveType.value!.typeId,
            employeeId: employeeId,
            startDate: startDate.value!,
            endDate: endDate.value!,
            numOfDays: endDate.value!.difference(startDate.value!).inDays + 1,
            requestReason: reasonController.text,
            requestDate: requestToEdit!.requestDate, // Keep original request date
            requestStatus: requestToEdit!.requestStatus, // Keep original status
          );
          await notifier.editRequest(id: requestToEdit!.leaveRequestId!, request: editRequest);
        } else {
          // Construct the LeaveRequestCreate model for creating
          final createRequest = LeaveRequestCreate(
            leaveTypeId: selectedLeaveType.value!.typeId,
            employeeId: employeeId,
            startDate: startDate.value!,
            endDate: endDate.value!,
            numOfDays: endDate.value!.difference(startDate.value!).inDays + 1,
            requestReason: reasonController.text,
            requestDate: DateTime.now(),
          );
          await notifier.createRequest(createRequest);
        }
        // On success, pop the screen
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Request ${isEditMode ? 'updated' : 'submitted'} successfully!'),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submission failed: $e')));
      } finally {
        isSubmitting.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? context.lango.editLeaveRequest : context.lango.newLeaveRequest),
      ),
      body: formDataSource.when(
        data: (leaveTypes) => Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              AppDropdownField<LeaveType>(
                labelText: context.lango.leaveType,
                value: selectedLeaveType.value,
                items: leaveTypes
                    .map(
                      (type) => DropdownMenuItem<LeaveType>(
                        value: type,
                        child: Text(type.typeName),
                      ),
                    )
                    .toList(),
                onChanged: (value) => selectedLeaveType.value = value,
                validator: (value) => value == null ? context.lango.pleaseSelectLeaveType : null,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.startDate,
                selectedDate: startDate.value,
                onDateSelected: (date) => startDate.value = date,
                validator: (val) => val == null ? context.lango.pleaseSelectStartDate : null,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.endDate,
                selectedDate: endDate.value,
                onDateSelected: (date) => endDate.value = date,
                validator: (val) {
                  if (val == null) return context.lango.pleaseSelectEndDate;
                  if (startDate.value != null && val.isBefore(startDate.value!)) {
                    return context.lango.endDateAfterStartDate;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: reasonController,
                labelText: context.lango.reasonForLeave,
                maxLines: 4,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: isSubmitting.value ? null : handleSubmit,
                child: isSubmitting.value ? const CircularProgressIndicator() : Text(context.lango.submitRequest),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading data: $e')),
      ),
    );
  }
}
