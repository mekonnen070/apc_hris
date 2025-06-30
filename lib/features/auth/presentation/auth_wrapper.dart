// lib/features/auth/presentation/auth_wrapper.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
import 'package:police_com/features/widgets/splash_screen.dart'; // Using the refactored splash screen

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      // While checking the initial auth state, show a splash screen.
      loading: () => const SplashScreen(),
      // If there is an error determining state, show the login page.
      error: (err, stack) {
        log('Error determining auth state: $err');
        log('Stack trace: $stack');
        return const LogInPage();
      },
      // Once data is available, route accordingly.
      data: (state) {
        log('Is logged in: $state');
        if (state == const AuthState.authenticated()) {
          return const HomePage();
        } else {
          return const LogInPage();
        }
      },
    );
  }
}
