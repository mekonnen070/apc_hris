import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/transfer_reasons.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/transfer/application/request_transfer_notifier.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:toastification/toastification.dart';

class RequestTransferScreen extends HookConsumerWidget {
  const RequestTransferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final notifier = ref.read(requestTransferNotifierProvider.notifier);
    final state = ref.watch(requestTransferNotifierProvider);

    final toLocationController = useTextEditingController();
    final toDepartmentController = useTextEditingController();
    final reason = useState<TransferReasons?>(null);

    ref.listen(requestTransferNotifierProvider, (_, next) {
      if (next.successMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.successMessage!),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 4),
        );
        Navigator.of(context).pop(true);
      }
      if (next.errorMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.errorMessage!),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    });

    void handleSubmit() {
      if (formKey.currentState?.validate() ?? false) {
        notifier.submitRequest(
          toLocation: toLocationController.text,
          toDepartment: toDepartmentController.text,
          reason: reason.value!,
        );
      }
    }

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.requestTransfer),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.lango.requestedLocation,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              const SizedBox(height: 8),
              AppTextField(
                controller: toLocationController,
                labelText: context.lango.requestedLocation,
                isRequired: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: toDepartmentController,
                labelText: context.lango.requestedDepartment,
                isRequired: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 24),
              Text(
                context.lango.reasonForRequest,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              const SizedBox(height: 8),
              AppDropdownField<TransferReasons>(
                labelText: context.lango.reasonForRequest,
                isRequired: true,
                value: reason.value,
                items:
                    TransferReasons.values
                        .map(
                          (r) => DropdownMenuItem(
                            value: r,
                            child: Text(r.name.toDisplayCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) => reason.value = value,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: state.isSubmitting ? null : handleSubmit,
                  child:
                      state.isSubmitting
                          ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                          : Text(context.lango.submitRequest),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
