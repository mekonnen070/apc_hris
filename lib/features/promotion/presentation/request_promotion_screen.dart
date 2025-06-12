// lib/features/promotion/presentation/request_promotion_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/promotion_status.dart';
import 'package:police_com/features/promotion/application/data/promotion_repository.dart';
import 'package:police_com/features/promotion/domain/promotion_request.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class RequestPromotionScreen extends HookConsumerWidget {
  const RequestPromotionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final currentPositionController = useTextEditingController(
      text: 'Sergeant',
    ); // Pre-filled from user data
    final promotedPositionController = useTextEditingController();
    final reasonController = useTextEditingController();
    final isLoading = useState(false);

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        final request = PromotionRequest(
          id: 0,
          employeeId: 'CURRENT_USER_ID',
          requestDate: DateTime.now(),
          currentPositionId: currentPositionController.text,
          promotedToPositionId: promotedPositionController.text,
          reason: reasonController.text,
          status: PromotionStatus.pending,
        );

        try {
          await ref
              .read(promotionRepositoryProvider)
              .submitPromotionRequest(request);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Promotion request submitted successfully'),
              ),
            );
            Navigator.of(context).pop(true);
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to submit request: $e')),
            );
          }
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Request Promotion'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: currentPositionController,
                labelText: 'Current Position',
                readOnly: true,
              ),
              const SizedBox(height: 16),
              // In a real app, this should be a searchable dropdown
              AppTextField(
                controller: promotedPositionController,
                labelText: 'Requested Position for Promotion',
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'This field is required'
                            : null,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: reasonController,
                labelText: 'Reason for Request',
                hintText:
                    'Briefly explain why you are requesting this promotion.',
                maxLines: 6,
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please provide a reason'
                            : null,
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
