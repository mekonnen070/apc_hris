import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/enums/gender_enum.dart';
import 'package:police_com/core/enums/marital_status_enum.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/features/auth/application/auth_controller.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/auth/presentation/widgets/google_sign_in_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';
import 'package:police_com/main.dart';
import 'package:toastification/toastification.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> with LoggerMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  // Gender & Marital Status options
  final List<GenderEnum> genders = GenderEnum.values;
  final List<MaritalStatusEnum> maritalStatuses = MaritalStatusEnum.values;

  Future<void> _submitSignup() async {
    // if (_formKey.currentState?.saveAndValidate() ?? false) return;
    final fields = _formKey.currentState!.fields;

    setState(() => _isLoading = true);
    final authController = ref.read(authControllerProvider);

    try {
      await authController.signUp(
        email: fields['email']!.value as String,
        password: fields['password']!.value as String,
        fullName: fields['fullName']!.value as String,
        address: fields['address']!.value as String,
        phoneNumber: fields['phone']!.value as String,
        dateOfBirth: fields['dateOfBirth']!.value as DateTime,
        gender: 'male',
        maritalStatus: 'single',
      );

      toastification.show(
        title: const Text('Signup Successful'),
        description: const Text('You have successfully signed up.'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );

      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LogInPage()),
      );
    } catch (error, stack) {
      logError('Error during signup: $error', error: error, stackTrace: stack);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Sign Up',
          actions: [ThemeSwitcherWidget()],
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  SizedBox(
                    height: 100,
                    child: Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title
                  const Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign up with your email and password',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // Signup Form
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Full Name (Required)
                        FormBuilderTextField(
                          name: 'fullName',
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: FormBuilderValidators.required(
                            errorText: 'Full Name is required',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Address
                        FormBuilderTextField(
                          name: 'address',
                          decoration: InputDecoration(
                            labelText: 'Address',
                            prefixIcon: const Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: FormBuilderValidators.required(
                            errorText: 'Address is required',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Phone Number
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: FormBuilderValidators.required(
                            errorText: 'Phone number is required',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Email Field
                        FormBuilderTextField(
                          name: 'email',
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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

                        // Password Field
                        FormBuilderTextField(
                          name: 'password',
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Password is required',
                            ),
                            FormBuilderValidators.minLength(
                              6,
                              errorText: 'Minimum 6 characters required',
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),

                        // Date of Birth
                        FormBuilderDateTimePicker(
                          name: 'dateOfBirth',
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          inputType: InputType.date,
                          firstDate: DateTime(1900),
                          initialDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          validator: FormBuilderValidators.required(
                            errorText: 'Birth date is required',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Gender
                        FormBuilderDropdown(
                          name: 'gender',
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            prefixIcon: const Icon(Icons.wc),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          items:
                              genders
                                  .map(
                                    (gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender.name),
                                    ),
                                  )
                                  .toList(),
                          validator: FormBuilderValidators.conditional(
                            (value) => value != null,
                            (value) {
                              return null;

                              // FormBuilderValidators.
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Marital Status
                        FormBuilderDropdown(
                          name: 'maritalStatus',
                          decoration: InputDecoration(
                            labelText: 'Marital Status',
                            prefixIcon: const Icon(Icons.family_restroom),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          items:
                              maritalStatuses
                                  .map(
                                    (status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(status.name),
                                    ),
                                  )
                                  .toList(),
                          validator: FormBuilderValidators.required(
                            errorText: 'Select your marital status',
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Signup Button
                        _isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _submitSignup,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: GoogleSignInWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
