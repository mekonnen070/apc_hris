import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RetirementPage extends ConsumerStatefulWidget {
  const RetirementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RetirementPageState();
}

class _RetirementPageState extends ConsumerState<RetirementPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEligible = false;
  static const int retirementAge = 60;
  int _age = 0;

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void _checkEligibility() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final birthDate = _formKey.currentState!.value['birthDate'] as DateTime?;
      if (birthDate != null) {
        int age = _calculateAge(birthDate);
        setState(() {
          _age = age;
          _isEligible = age >= retirementAge;
        });
      }
    }
  }

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
              const Text(
                'Retirement Eligibility Check',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'fullName',
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(
                  errorText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderDateTimePicker(
                name: 'birthDate',
                decoration: const InputDecoration(
                  labelText: 'Birth Date',
                  border: OutlineInputBorder(),
                ),
                inputType: InputType.date,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                validator: FormBuilderValidators.required(
                  errorText: 'Select your birth date',
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _checkEligibility,
                child: const Text('Check Eligibility'),
              ),
              const SizedBox(height: 16),
              Text(
                _isEligible
                    ? 'You are eligible for retirement. You are $_age years old.'
                    : 'You are not eligible for retirement. You are $_age years old. You need to be at least $retirementAge years old.',
                style: TextStyle(
                  color: _isEligible ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
