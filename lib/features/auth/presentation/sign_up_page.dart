import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/features/auth/application/auth_controller.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/auth/presentation/widgets/google_sign_in_widget.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
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

  Future<void> _submitSignUp() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;
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
        title: Text(context.lango.signupSuccessful), // <-- REPLACED
        description: Text(context.lango.youHaveSuccessfullySignedUp), // <-- REPLACED
        type: ToastificationType.success,
      );
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e, st) {
      logError('Error during sign up: $e', error: e, stackTrace: st);
      toastification.show(
        title: const Text('Signup Failed'), // Not in ARB. Left as is.
        description: Text('Error: $e'),
        type: ToastificationType.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget( // <-- REMOVED CONST
          title: context.lango.signUp, // <-- REPLACED
          actions: const [ThemeSwitcherWidget()],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text( // <-- REMOVED CONST
                  context.lango.createAnAccount, // <-- REPLACED
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text( // <-- REMOVED CONST
                  context.lango.signUpWithEmailAndPassword, // <-- REPLACED
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // Signup Form
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'fullName',
                        decoration: InputDecoration(
                          labelText: context.lango.fullName, // <-- REPLACED
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: context.lango.fullNameIsRequired,), // <-- REPLACED
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: context.lango.email, // <-- REPLACED
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: context.lango.emailIsRequired,), // <-- REPLACED
                          FormBuilderValidators.email(
                              errorText: context.lango.enterAValidEmail,), // <-- REPLACED
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'password',
                        decoration: InputDecoration(
                          labelText: context.lango.password, // <-- REPLACED
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: context.lango.passwordIsRequired,), // <-- REPLACED
                          FormBuilderValidators.minLength(6,
                              errorText:
                                  context.lango.minimum6CharactersRequired,), // <-- REPLACED
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'address',
                        decoration: InputDecoration(
                          labelText: context.lango.address, // <-- REPLACED
                          prefixIcon: const Icon(Icons.location_city),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: context.lango.addressIsRequired,), // <-- REPLACED
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'phoneNumber',
                        decoration: InputDecoration(
                          labelText: context.lango.phoneNumber, // <-- REPLACED
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.required(
                            errorText: context.lango.phoneNumberIsRequired,), // <-- REPLACED
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDateTimePicker(
                        name: 'dob',
                        decoration: InputDecoration(
                          labelText: context.lango.dateOfBirth, // <-- REPLACED
                          prefixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        inputType: InputType.date,
                        validator: FormBuilderValidators.required(
                            errorText: context.lango.birthDateIsRequired,), // <-- REPLACED
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDropdown(
                        name: 'gender',
                        decoration: InputDecoration(
                          labelText: context.lango.gender, // <-- REPLACED
                          prefixIcon: const Icon(Icons.wc),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'male',
                            child: Text(context.lango.male), // <-- REPLACED
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text(context.lango.female), // <-- REPLACED
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDropdown(
                        name: 'maritalStatus',
                        decoration: InputDecoration(
                          labelText: context.lango.maritalStatus, // <-- REPLACED
                          prefixIcon: const Icon(Icons.family_restroom),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'single',
                            child: Text(context.lango.single), // <-- REPLACED
                          ),
                          DropdownMenuItem(
                            value: 'married',
                            child: Text(context.lango.married), // <-- REPLACED
                          ),
                          DropdownMenuItem(
                            value: 'divorced',
                            child: Text(context.lango.divorced), // <-- REPLACED
                          ),
                          DropdownMenuItem(
                            value: 'widowed',
                            child: Text(context.lango.widowed), // <-- REPLACED
                          ),
                        ],
                        validator: FormBuilderValidators.required(
                            errorText: context.lango.selectYourMaritalStatus,), // <-- REPLACED
                      ),
                      const SizedBox(height: 24),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: FilledButton(
                                onPressed: _submitSignUp,
                                style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text( // <-- REMOVED CONST
                                  context.lango.signUp, // <-- REPLACED
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 16),
                      const GoogleSignInWidget(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'), // Not in ARB. Left as is.
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInPage(),
                                ),
                              );
                            },
                            child: Text(
                              context.lango.login, // <-- REPLACED
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}