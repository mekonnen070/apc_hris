import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/leave_mgmt/application/leave_request_form_notifier.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:toastification/toastification.dart';

class RequestLeaveScreen extends HookConsumerWidget {
  const RequestLeaveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final notifier = ref.watch(leaveRequestFormNotifierProvider.notifier);
    final state = ref.watch(leaveRequestFormNotifierProvider);

    final selectedLeaveType = useState<LeaveType?>(null);
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);
    final reasonController = useTextEditingController();

    useEffect(() {
      Future.microtask(notifier.initialize);
      return null;
    }, const []);

    void handleSubmit() async {
      if (formKey.currentState?.validate() != true) return;

      await notifier.submitRequest(
        leaveType: selectedLeaveType.value!,
        startDate: startDate.value!,
        endDate: endDate.value!,
        reason: reasonController.text,
      );

      final currentState = ref.read(leaveRequestFormNotifierProvider);
      if (context.mounted) {
        if (currentState.successMessage != null) {
          toastification.show(
            context: context,
            title: Text(currentState.successMessage!),
            type: ToastificationType.success,
          );
          Navigator.of(context).pop(true);
        } else if (currentState.errorMessage != null) {
          toastification.show(
            context: context,
            title: Text(currentState.errorMessage!),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
        notifier.clearMessages();
      }
    }

    final balanceInfo =
        selectedLeaveType.value == null
            ? context.lango.selectLeaveTypeToSeeBalance // <-- REPLACED
            : () {
              LeaveBalance? balance;
              try {
                balance = state.leaveBalances.firstWhere(
                  (b) =>
                      b.leaveTypeId == selectedLeaveType.value!.leaveTypeName,
                );
              } catch (e) {
                balance = null;
              }

              if (balance == null) {
                return context.lango.availableDays(days: selectedLeaveType.value!.maximumDays); // <-- REPLACED
              }
              final remaining = balance.totalDays - balance.usedDays;
              return context.lango.availableOfTotalDays(remaining: remaining, total: balance.totalDays); // <-- REPLACED
            }();

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.requestNewLeave), // <-- REPLACED & REMOVED CONST
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.errorMessage != null && state.leaveTypes.isEmpty
              ? Center(child: Text(state.errorMessage!))
              : Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppDropdownField<LeaveType>(
                        labelText: context.lango.leaveType, // <-- REPLACED
                        isRequired: true,
                        value: selectedLeaveType.value,
                        items:
                            state.leaveTypes
                                .map(
                                  (type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type.leaveTypeName),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => selectedLeaveType.value = value,
                        validator:
                            (value) =>
                                value == null
                                    ? context.lango.pleaseSelectLeaveType // <-- REPLACED
                                    : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                        child: Text(
                          balanceInfo,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppDateField(
                        labelText: context.lango.startDate, // <-- REPLACED
                        isRequired: true,
                        selectedDate: startDate.value,
                        onDateSelected: (date) => startDate.value = date,
                        validator:
                            (val) =>
                                val == null
                                    ? context.lango.pleaseSelectStartDate // <-- REPLACED
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      AppDateField(
                        labelText: context.lango.endDate, // <-- REPLACED
                        isRequired: true,
                        selectedDate: endDate.value,
                        onDateSelected: (date) => endDate.value = date,
                        validator: (val) {
                          if (val == null) return context.lango.pleaseSelectEndDate; // <-- REPLACED
                          if (startDate.value != null &&
                              val.isBefore(startDate.value!)) {
                            return context.lango.endDateAfterStartDate; // <-- REPLACED
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: reasonController,
                        labelText: context.lango.reasonForLeave, // <-- REPLACED
                        isRequired: true,
                        maxLines: 4,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 32),
                      FilledButton(
                        onPressed: state.isSubmitting ? null : handleSubmit,
                        child:
                            state.isSubmitting
                                ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
                                )
                                : Text(context.lango.submitRequest), // <-- REPLACED & REMOVED CONST
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}