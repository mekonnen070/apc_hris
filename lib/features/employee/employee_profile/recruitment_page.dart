import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RecruitmentPage extends ConsumerStatefulWidget {
  const RecruitmentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecruitmentPageState();
}

class _RecruitmentPageState extends ConsumerState<RecruitmentPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Applicant Registration',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'fullName',
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Full name is required',
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Email is required',
                  ),
                  FormBuilderValidators.email(errorText: 'Enter a valid email'),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'phone',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.required(
                  errorText: 'Phone number is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'academicQualification',
                decoration: const InputDecoration(
                  labelText: 'Academic Qualification',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Academic qualification is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'workExperience',
                decoration: const InputDecoration(
                  labelText: 'Work Experience',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: FormBuilderValidators.required(
                  errorText: 'Work experience is required',
                ),
              ),
              const SizedBox(height: 16),
              // Simulated document upload button.
              ElevatedButton.icon(
                onPressed: () {
                  // Simulate file upload by updating a hidden field value.
                  _formKey.currentState?.fields['uploadedDocument']?.didChange(
                    'resume.pdf',
                  );
                },
                icon: const Icon(Icons.upload_file),
                label: Text(
                  _formKey.currentState?.fields['uploadedDocument']?.value ==
                          null
                      ? 'Choose File'
                      : _formKey
                          .currentState!
                          .fields['uploadedDocument']!
                          .value,
                ),
              ),
              FormBuilderField(
                name: 'uploadedDocument',
                builder: (FormFieldState<dynamic> field) {
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    // Process form data.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Application Submitted')),
                    );
                  }
                },
                child: const Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
