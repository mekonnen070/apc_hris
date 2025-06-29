import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/features/auth/application/auth_controller.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage>
    with LoggerMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  Future<void> _submitForgotPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) return;
    final fields = _formKey.currentState!.fields;

    setState(() => _isLoading = true);
    final authController = ref.read(authControllerProvider);

    try {
      await authController.forgotPassword(
        email: fields['email']!.value as String,
      );

      toastification.show(
        title: Text(context.lango.passwordResetSent), // <-- REPLACED
        description: Text(context.lango.checkEmailForResetInstructions), // <-- REPLACED
        type: ToastificationType.success,
      );
    } catch (error, stack) {
      logError(
        'Error during password reset: $error',
        error: error,
        stackTrace: stack,
      );
      toastification.show(
        title: Text(context.lango.passwordResetFailed), // <-- REPLACED
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
        appBar: AppBarWidget( // <-- REMOVED CONST
          title: context.lango.forgotPassword, // <-- REPLACED
          actions: const [ThemeSwitcherWidget()],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.lock_reset_rounded,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                Text( // <-- REMOVED CONST
                  context.lango.resetYourPassword, // <-- REPLACED
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text( // <-- REMOVED CONST
                  context.lango.enterEmailForPasswordReset, // <-- REPLACED
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Forgot Password Form
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
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
                            errorText: context.lango.emailIsRequired, // <-- REPLACED
                          ),
                          FormBuilderValidators.email(
                            errorText: context.lango.enterAValidEmail, // <-- REPLACED
                          ),
                        ]),
                      ),
                      const SizedBox(height: 24),

                      // Submit Button
                      _isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FilledButton(
                              onPressed: () => _submitForgotPassword(),
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text( // <-- REMOVED CONST
                                context.lango.resetPassword, // <-- REPLACED
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      const SizedBox(height: 16),
                      // Back to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.lango.rememberedYourPassword), // <-- REPLACED
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
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