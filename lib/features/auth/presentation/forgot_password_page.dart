// lib/features/auth/presentation/forgot_password_page.dart

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

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _submitForgotPassword() async {
    // 1. Validate the form.
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }
    final fields = _formKey.currentState!.fields;
    final authNotifier = ref.read(authNotifierProvider.notifier);

    // 2. Call the notifier's method.
    final success = await authNotifier.forgotPassword(
      email: fields['email']!.value as String,
    );

    // 3. Check if mounted and provide robust user feedback.
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.lango.checkEmailForResetInstructions),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate back to the login page on success.
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const LogInPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.lango.passwordResetFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // The Architect's Note: The UI now watches the central auth state for loading indicators.
    final authState = ref.watch(authNotifierProvider);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: context.lango.forgotPassword,
          actions: const [ThemeSwitcherWidget()],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_reset_rounded,
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 24),
                Text(
                  context.lango.resetYourPassword,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.lango.enterEmailForPasswordReset,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          labelText: context.lango.email,
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed:
                              authState.isLoading
                                  ? null
                                  : _submitForgotPassword,
                          child:
                              authState.isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : Text(
                                    context.lango.resetPassword,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.lango.rememberedYourPassword),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
