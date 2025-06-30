// lib/features/auth/presentation/sign_up_page.dart

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _submitSignUp() async {
    // 1. Validate the form.
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final fields = _formKey.currentState!.fields;
    final authNotifier = ref.read(authNotifierProvider.notifier);

    // 2. Call the signUp method from the notifier.
    final success = await authNotifier.signUp(
      email: fields['email']!.value as String,
      password: fields['password']!.value as String,
      fullName: fields['fullName']!.value as String,
      address: fields['address']!.value as String?,
      phoneNumber: fields['phoneNumber']!.value as String?,
      dateOfBirth: fields['dob']!.value as DateTime?,
      gender: fields['gender']!.value as String?,
      maritalStatus: fields['maritalStatus']!.value as String?,
    );

    // 3. The Architect's Mandate: Check if mounted before using context.
    //    Provide clear user feedback based on the result.
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.lango.signupSuccessful),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to the login page upon successful registration.
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const LogInPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.lango.signupFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the central auth provider to react to loading states.
    final authState = ref.watch(authNotifierProvider);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: context.lango.signUp,
          actions: const [ThemeSwitcherWidget()],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.lango.createAnAccount,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.lango.signUpWithEmailAndPassword,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // Form Fields (Unchanged from original implementation)
                  FormBuilderTextField(
                    name: 'fullName',
                    decoration: InputDecoration(
                      labelText: context.lango.fullName,
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                      labelText: context.lango.email,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      labelText: context.lango.password,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'address',
                    decoration: InputDecoration(
                      labelText: context.lango.address,
                      prefixIcon: const Icon(Icons.location_city_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    decoration: InputDecoration(
                      labelText: context.lango.phoneNumber,
                      prefixIcon: const Icon(Icons.phone_outlined),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDateTimePicker(
                    name: 'dob',
                    decoration: InputDecoration(
                      labelText: context.lango.dateOfBirth,
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    inputType: InputType.date,
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDropdown(
                    name: 'gender',
                    decoration: InputDecoration(
                      labelText: context.lango.gender,
                      prefixIcon: const Icon(Icons.wc_outlined),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'male',
                        child: Text(context.lango.male),
                      ),
                      DropdownMenuItem(
                        value: 'female',
                        child: Text(context.lango.female),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDropdown(
                    name: 'maritalStatus',
                    decoration: InputDecoration(
                      labelText: context.lango.maritalStatus,
                      prefixIcon: const Icon(Icons.family_restroom_outlined),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'single',
                        child: Text(context.lango.single),
                      ),
                      DropdownMenuItem(
                        value: 'married',
                        child: Text(context.lango.married),
                      ),
                      DropdownMenuItem(
                        value: 'divorced',
                        child: Text(context.lango.divorced),
                      ),
                      DropdownMenuItem(
                        value: 'widowed',
                        child: Text(context.lango.widowed),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: authState.isLoading ? null : _submitSignUp,
                      child:
                          authState.isLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : Text(
                                context.lango.signUp,
                                style: const TextStyle(fontSize: 18),
                              ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Redirection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.lango.alreadyHaveAnAccount),
                      TextButton(
                        onPressed:
                            () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const LogInPage(),
                              ),
                            ),
                        child: Text(context.lango.login),
                      ),
                    ],
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
