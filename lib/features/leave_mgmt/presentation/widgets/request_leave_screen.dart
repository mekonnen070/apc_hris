import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
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
    final notifier = ref.read(leaveRequestFormNotifierProvider.notifier);
    final state = ref.watch(leaveRequestFormNotifierProvider);

    final selectedLeaveType = useState<LeaveType?>(null);
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);
    final reasonController = useTextEditingController();

    ref.listen(leaveRequestFormNotifierProvider, (_, next) {
      if (next.successMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.successMessage!),
          type: ToastificationType.success,
        );
        Navigator.of(context).pop(true);
      }
      if (next.errorMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.errorMessage!),
          type: ToastificationType.error,
        );
      }
    });

    void handleSubmit() {
      if (formKey.currentState?.validate() ?? false) {
        notifier.submitRequest(
          leaveType: selectedLeaveType.value!,
          startDate: startDate.value!,
          endDate: endDate.value!,
          reason: reasonController.text,
        );
      }
    }

    String getBalanceInfo() {
      if (selectedLeaveType.value == null) {
        return context.lango.selectLeaveTypeToSeeBalance;
      }

      final leaveType = selectedLeaveType.value!;
      LeaveBalance? balance;
      try {
        // Correctly match the string ID from LeaveType to the String ID in LeaveBalance
        balance = state.leaveBalances.firstWhere(
          (b) => b.leaveTypeId == leaveType.typeId,
        );
      } catch (e) {
        balance = null;
      }

      if (balance == null) {
        return context.lango.availableDays(days: leaveType.maximumLeave);
      }
      return context.lango.availableOfTotalDays(remaining: balance.balance, total: balance.totalDays);
    }

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.requestNewLeave),
      body: state.isLoading
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
                          labelText: context.lango.leaveType,
                          isRequired: true,
                          value: selectedLeaveType.value,
                          items: state.leaveTypes
                              .map((type) => DropdownMenuItem(value: type, child: Text(type.typeName)))
                              .toList(),
                          onChanged: (value) => selectedLeaveType.value = value,
                          validator: (value) => value == null ? context.lango.pleaseSelectLeaveType : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                          child: Text(getBalanceInfo(), style: Theme.of(context).textTheme.bodySmall),
                        ),
                        const SizedBox(height: 16),
                        AppDateField(
                          labelText: context.lango.startDate,
                          isRequired: true,
                          selectedDate: startDate.value,
                          onDateSelected: (date) => startDate.value = date,
                          validator: (val) => val == null ? context.lango.pleaseSelectStartDate : null,
                        ),
                        const SizedBox(height: 16),
                        AppDateField(
                          labelText: context.lango.endDate,
                          isRequired: true,
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
                          isRequired: true,
                          maxLines: 4,
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 32),
                        FilledButton(
                          onPressed: state.isSubmitting ? null : handleSubmit,
                          child: state.isSubmitting
                              ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                              : Text(context.lango.submitRequest),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
