import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmploymentDetailsPage extends ConsumerStatefulWidget {
  const EmploymentDetailsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmploymentDetailsPageState();
}

class _EmploymentDetailsPageState extends ConsumerState<EmploymentDetailsPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> employmentStatuses = [
    'Full-Time',
    'Part-Time',
    'Contract',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                name: 'position',
                decoration: const InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Position is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'department',
                decoration: const InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Department is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'workLocation',
                decoration: const InputDecoration(
                  labelText: 'Work Location',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Work location is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'manager',
                decoration: const InputDecoration(
                  labelText: 'Manager',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Manager name is required',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderDropdown(
                name: 'employmentStatus',
                decoration: const InputDecoration(
                  labelText: 'Employment Status',
                  border: OutlineInputBorder(),
                ),
                items:
                    employmentStatuses
                        .map(
                          (status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ),
                        )
                        .toList(),
                validator: FormBuilderValidators.required(
                  errorText: 'Select employment status',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'jobHistory',
                decoration: const InputDecoration(
                  labelText: 'Job History',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: FormBuilderValidators.required(
                  errorText: 'Job history is required',
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Employment Details Submitted'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
