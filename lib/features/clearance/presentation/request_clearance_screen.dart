import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/clearance_reason.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
            SnackBar(content: Text(context.lango.clearanceRequestSubmitted)),
          );
          Navigator.of(context).pop(true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${context.lango.failedToSubmitRequest}$e'),
            ), // <-- REPLACED
          );
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: context.lango.requestClearance,
      ), // <-- REPLACED & REMOVED CONST
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDropdownField<ClearanceReason>(
                labelText: context.lango.reasonForClearance, // <-- REPLACED
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
                    (value) =>
                        value == null
                            ? context.lango.pleaseSelectReason
                            : null, // <-- REPLACED
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.lastDayOfWorkLabel, // <-- REPLACED
                onDateSelected: (date) => lastDayOfWork.value = date,
                validator:
                    (value) =>
                        lastDayOfWork.value == null
                            ? context
                                .lango
                                .pleaseSelectDate // <-- REPLACED
                            : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: commentsController,
                labelText: context.lango.commentsOptional, // <-- REPLACED
                hintText:
                    context.lango.provideAdditionalDetails, // <-- REPLACED
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading.value ? null : submitForm,
                child:
                    isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : Text(
                          context.lango.submitRequest,
                        ), // <-- REPLACED & REMOVED CONST
              ),
            ],
          ),
        ),
      ),
    );
  }
}
