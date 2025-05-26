import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/features/auth/application/auth_controller.dart';
import 'package:police_com/features/auth/presentation/forgot_password_page.dart';
import 'package:police_com/features/auth/presentation/sign_up_page.dart';
import 'package:police_com/features/auth/presentation/widgets/google_sign_in_widget.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';
import 'package:police_com/main.dart';
import 'package:toastification/toastification.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> with LoggerMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  Future<void> _submitLogin() async {
    // if (_formKey.currentState?.saveAndValidate() ?? false) return;
    final fields = _formKey.currentState!.fields;

    setState(() => _isLoading = true);
    final authController = ref.read(authControllerProvider);

    try {
      await Future.delayed(const Duration(seconds: 2));
      await authController.login(
        email: fields['email']!.value as String,
        password: fields['password']!.value as String,
      );

      toastification.show(
        title: const Text('Login Successful'),
        description: const Text('You have successfully logged in.'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );

      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (error, stack) {
      logError('Error during login: $error', error: error, stackTrace: stack);
      toastification.show(
        title: const Text('Login Failed'),
        description: Text('Error: $error'),
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
        appBar: const AppBarWidget(title: 'Login', actions: [ThemeSwitcherWidget()]),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Log in with your email and password',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // Login Form
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
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

                      // Forgot Password Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Login Button
                      _isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => _submitLogin(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      const SizedBox(height: 16),
                      // Google Sign-In
                      const SizedBox(
                        width: double.infinity,
                        child: GoogleSignInWidget(),
                      ),
                      const SizedBox(height: 16),
                      // Signup Redirection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
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
