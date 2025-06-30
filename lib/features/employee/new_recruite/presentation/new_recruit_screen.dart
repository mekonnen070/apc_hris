import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee/new_recruite/application/new_recruit_notifier.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/uuid.dart';

class NewRecruitScreen extends HookConsumerWidget {
  const NewRecruitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final notifier = ref.watch(newRecruitNotifierProvider.notifier);
    final state = ref.watch(newRecruitNotifierProvider);

    final firstNameController = useTextEditingController();
    final fatherNameController = useTextEditingController();
    final grandNameController = useTextEditingController();
    final mobileController = useTextEditingController();
    final emailController = useTextEditingController();

    final announcementId = useState<String?>(null);
    final gender = useState<Gender>(Gender.male);
    final birthDate = useState<DateTime?>(null);

    // **THE FIX IS HERE:**
    // This listener now only calls `clearMessages` AFTER a message has been handled,
    // which prevents the infinite loop.
    ref.listen(newRecruitNotifierProvider, (_, next) {
      if (next.successMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.successMessage!),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 4),
        );
        Navigator.of(context).pop(true);
        // Clear the message *after* it's been shown.
        notifier.clearMessages();
      } else if (next.errorMessage != null) {
        toastification.show(
          context: context,
          title: Text(next.errorMessage!),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
        // Clear the message *after* it's been shown.
        notifier.clearMessages();
      }
    });

    Future<void> handleSubmit() async {
      if (formKey.currentState?.validate() ?? false) {
        const uuid = Uuid();
        final request = RecruitInfo(
          recruitId: uuid.v4(),
          announcementId: announcementId.value,
          firstName: firstNameController.text,
          fatherName: fatherNameController.text,
          grandName:
              grandNameController.text.isNotEmpty
                  ? grandNameController.text
                  : null,
          gender: gender.value,
          birthDate: birthDate.value!,
          mobile: mobileController.text,
          email: emailController.text.isNotEmpty ? emailController.text : null,
        );
        notifier.updateCreateRequest(request);
        await notifier.submitNewRecruit(request);
      }
    }

    if (state.isSubmitting) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.newRecruitApplication),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDropdownField<String>(
                labelText: context.lango.recruitmentAnnouncement,
                isRequired: true,
                value: announcementId.value,
                items:
                    state.announcements
                        .map(
                          (ann) => DropdownMenuItem(
                            value: ann.announcementId,
                            child: Text(ann.announcementTitle ?? 'No Title'),
                          ),
                        )
                        .toList(),
                onChanged: (value) => announcementId.value = value,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: firstNameController,
                labelText: context.lango.firstName,
                isRequired: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: fatherNameController,
                labelText: context.lango.middleName,
                isRequired: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: grandNameController,
                labelText: context.lango.lastName,
              ),
              const SizedBox(height: 16),
              AppDateField(
                labelText: context.lango.dateOfBirth,
                isRequired: true,
                selectedDate: birthDate.value,
                onDateSelected: (newDate) => birthDate.value = newDate,
                validator: (val) {
                  if (val == null) return 'This field cannot be empty.';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppDropdownField<Gender>(
                labelText: context.lango.gender,
                isRequired: true,
                value: gender.value,
                items:
                    Gender.values
                        .map(
                          (g) => DropdownMenuItem(
                            value: g,
                            child: Text(g.name.toDisplayCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value != null) gender.value = value;
                },
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: mobileController,
                labelText: context.lango.phoneNumber,
                isRequired: true,
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: emailController,
                labelText: context.lango.email,
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.email(),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: state.isSubmitting ? null : handleSubmit,
                child:
                    state.isSubmitting
                        ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                        : Text(context.lango.submit),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
