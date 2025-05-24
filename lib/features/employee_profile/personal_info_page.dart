import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:toastification/toastification.dart';

class PersonalInformationPage extends StatefulWidget {
  /// Pass in the initial data to pre-populate the form.
  final Map<String, dynamic> initialData;

  const PersonalInformationPage({super.key, required this.initialData});

  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Personal Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          // Set the initial values from the passed data.
          initialValue: widget.initialData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'fullName',
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                    errorText: 'Full name is required',
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'address',
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                    errorText: 'Address is required',
                  ),
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
                    FormBuilderValidators.email(
                      errorText: 'Enter a valid email',
                    ),
                  ]),
                ),
                const SizedBox(height: 16),
                FormBuilderDateTimePicker(
                  name: 'dateOfBirth',
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                  ),
                  inputType: InputType.date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  validator: FormBuilderValidators.required(
                    errorText: 'Birth date is required',
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderDropdown(
                  name: 'gender',
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      genders
                          .map(
                            (gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ),
                          )
                          .toList(),
                  validator: FormBuilderValidators.required(
                    errorText: 'Select your gender',
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderDropdown(
                  name: 'maritalStatus',
                  decoration: const InputDecoration(
                    labelText: 'Marital Status',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      maritalStatuses
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                  validator: FormBuilderValidators.required(
                    errorText: 'Select your marital status',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      // Here you would normally update the information in your backend.
                      toastification.show(
                        title: Text('Success'),
                        description: Text('Personal information updated!'),
                        autoCloseDuration: const Duration(seconds: 2),
                      );

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
