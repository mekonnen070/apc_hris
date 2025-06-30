// lib/features/auth/presentation/log_in_page.dart

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/auth/presentation/forgot_password_page.dart';
import 'package:police_com/features/auth/presentation/sign_up_page.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/language_switcher_widget.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _submitLogin() async {
    // 1. Validate the form. If invalid, do nothing.
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final fields = _formKey.currentState!.fields;
    final authNotifier = ref.read(authNotifierProvider.notifier);

    // 2. Call the login method. The notifier and wrapper handle state and navigation.
    final success = await authNotifier.login(
      email: fields['email']!.value as String,
      password: fields['password']!.value as String,
    );

    // 3. The Architect's Mandate: Check if the widget is still mounted *before*
    //    using its context. This prevents the crash.
    if (mounted && !success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.lango.loginFailed), // Shows "Login Failed"
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the central auth state. This is the only source of truth.
    final authState = ref.watch(authNotifierProvider);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: context.lango.login,
          actions: const [LanguageSwitcherWidget(), ThemeSwitcherWidget()],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.lango.welcomeBack,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.lango.logInWithEmailAndPassword,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
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
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      labelText: context.lango.password,
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordPage(),
                            ),
                          ),
                      child: Text(context.lango.forgotPassword),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      // The button is disabled while authState is loading.
                      onPressed: authState.isLoading ? null : _submitLogin,
                      child:
                          authState.isLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : Text(
                                context.lango.login,
                                style: const TextStyle(fontSize: 18),
                              ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.lango.dontHaveAnAccount),
                      TextButton(
                        onPressed:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const SignUpPage(),
                              ),
                            ),
                        child: Text(context.lango.signUp),
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
