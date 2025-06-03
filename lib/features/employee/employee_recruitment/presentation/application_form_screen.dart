import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/identification_type.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_recruitment/application/providers/application_form_providers.dart';
import 'package:police_com/features/widgets/app_file_upload_field.dart';

class ApplicationFormScreen extends HookConsumerWidget {
  final String vacancyId;
  final String vacancyTitle;

  const ApplicationFormScreen({
    super.key,
    required this.vacancyId,
    required this.vacancyTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final formNotifier = ref.watch(
      applicationFormNotifierProvider(vacancyId).notifier,
    );
    final formState = ref.watch(applicationFormNotifierProvider(vacancyId));
    final applicationData = formState.applicationData;

    // Use effect to show snackbar messages
    ref.listen<String?>(
      applicationFormNotifierProvider(
        vacancyId,
      ).select((s) => s.successMessage),
      (prev, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next), backgroundColor: Colors.green),
          );
          // Optionally navigate away or clear form
          if (Navigator.canPop(context)) {
            Navigator.pop(context, true); // Pop with a success flag
          }
          formNotifier
              .clearPickedResume(); // Clear file after successful submission
        }
      },
    );
    ref.listen<String?>(
      applicationFormNotifierProvider(vacancyId).select((s) => s.errorMessage),
      (prev, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
    );

    // Helper to build dropdown items for Gender, excluding 'Other'
    List<DropdownMenuItem<Gender>> buildGenderDropdownItems() {
      return Gender.values
          .where(
            (g) => g != Gender.other,
          ) // Exclude 'Other' for application form
          .map((Gender value) {
            return DropdownMenuItem<Gender>(
              value: value,
              child: Text(value.toDisplayString),
            );
          })
          .toList();
    }

    List<DropdownMenuItem<IdentificationType>> buildIdTypeDropdownItems() {
      return IdentificationType.values.map((IdentificationType value) {
        return DropdownMenuItem<IdentificationType>(
          value: value,
          child: Text(value.toDisplayString),
        );
      }).toList();
    }

    Future<void> submit() async {
      if (formKey.currentState?.saveAndValidate() ?? false) {
        final formData = formKey.currentState!.value;

        // Update notifier with all form data before submitting
        // This ensures all latest values from FormBuilder are in the notifier's state
        formNotifier.updateField(
          firstName: formData['firstName'] as String?,
          lastName: formData['lastName'] as String?,
          middleName: formData['middleName'] as String?,
          email: formData['email'] as String?,
          phoneNumber: formData['phoneNumber'] as String?,
          dateOfBirth: formData['dateOfBirth'] as DateTime?,
          gender: formData['gender'] as Gender?,
          address: formData['address'] as String?,
          nationality: formData['nationality'] as String?,
          identificationNumber: formData['identificationNumber'] as String?,
          identificationType:
              formData['identificationType'] as IdentificationType?,
        );
        // The resume file is already in formState.pickedResumeFile via AppFileUploadField's onFileSelected

        await formNotifier.submitApplication();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please correct the errors in the form.'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Apply for: $vacancyTitle')),
      body: FormBuilder(
        key: formKey,
        initialValue: {
          // Pre-fill form builder with data from notifier for consistency
          'firstName': applicationData.firstName,
          'lastName': applicationData.lastName,
          'middleName': applicationData.middleName,
          'email': applicationData.email,
          'phoneNumber': applicationData.phoneNumber,
          'dateOfBirth': applicationData.dateOfBirth,
          'gender': applicationData.gender,
          'address': applicationData.address,
          'nationality': applicationData.nationality,
          'identificationNumber': applicationData.identificationNumber,
          'identificationType': applicationData.identificationType,
        },
        autovalidateMode: AutovalidateMode.disabled,
        child: Stepper(
          // Using a Stepper for better organization
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child:
                  formState.isSubmitting
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send_rounded),
                          label: const Text('Submit Application'),
                          onPressed: submit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
            );
          },
          steps: [
            Step(
              title: const Text('Personal Information & Contact'),
              isActive: true, // Always active for a single-step concept
              content: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'firstName',
                    decoration: const InputDecoration(
                      labelText: 'First Name *',
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: 'First name is required.',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    decoration: const InputDecoration(labelText: 'Last Name *'),
                    validator: FormBuilderValidators.required(
                      errorText: 'Last name is required.',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'middleName',
                    decoration: const InputDecoration(
                      labelText: 'Middle Name (Optional)',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      labelText: 'Email Address *',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Email is required.',
                      ),
                      FormBuilderValidators.email(
                        errorText: 'Enter a valid email address.',
                      ),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    decoration: const InputDecoration(
                      labelText: 'Phone Number *',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: FormBuilderValidators.required(
                      errorText: 'Phone number is required.',
                    ),
                  ),
                  FormBuilderDateTimePicker(
                    name: 'dateOfBirth',
                    inputType: InputType.date,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth *',
                    ),
                    format: DateFormat('yyyy-MM-dd'),
                    lastDate: DateTime.now().subtract(
                      const Duration(days: 365 * 18),
                    ), // Min age 18
                    validator: FormBuilderValidators.required(
                      errorText: 'Date of birth is required.',
                    ),
                  ),
                  FormBuilderDropdown<Gender>(
                    name: 'gender',
                    decoration: const InputDecoration(labelText: 'Gender *'),
                    items: buildGenderDropdownItems(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Gender is required.',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'address',
                    decoration: const InputDecoration(
                      labelText: 'Current Address *',
                    ),
                    maxLines: 2,
                    validator: FormBuilderValidators.required(
                      errorText: 'Address is required.',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'nationality',
                    decoration: const InputDecoration(
                      labelText: 'Nationality *',
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: 'Nationality is required.',
                    ),
                  ),
                  FormBuilderDropdown<IdentificationType>(
                    name: 'identificationType',
                    decoration: const InputDecoration(
                      labelText: 'Identification Type *',
                    ),
                    items: buildIdTypeDropdownItems(),
                    validator: FormBuilderValidators.required(
                      errorText: 'Identification type is required.',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'identificationNumber',
                    decoration: const InputDecoration(
                      labelText: 'Identification Number *',
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: 'Identification number is required.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppFileUploadField(
                    // Using your custom widget
                    labelText: 'Upload Resume (PDF, DOC, DOCX) *',
                    pickedFile: formState.pickedResumeFile,
                    onFileSelected: (file) {
                      if (file != null) {
                        formNotifier
                            .pickResume(); // This will update pickedResumeFile in notifier
                      } else {
                        formNotifier.clearPickedResume();
                      }
                    },
                    validator: (file) {
                      // Accessing from formState for validation
                      // if (formState.pickedResumeFile == null) {
                      //   return 'Resume is required.';
                      // }
                      return null;
                    },
                    allowedExtensions: const ['pdf', 'doc', 'docx'],
                  ),
                  if (formState.pickedResumeFile != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Selected: ${p.basename(formState.pickedResumeFile!.path)}',
                      ),
                    ),
                  const SizedBox(height: 20), // Space before submit button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
