import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/config/server_config/server_setup_screen.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
import 'package:police_com/features/widgets/splash_screen.dart';

/// Manages the two-stage launch sequence:
/// 1. Ensures server is configured and reachable.
/// 2. Checks authentication state.
class AppOrchestrator extends ConsumerWidget {
  const AppOrchestrator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverConfigState = ref.watch(serverConfigProvider);

    return serverConfigState.when(
      loading: () => const SplashScreen(),
      error:
          (error, stack) => ServerRecoveryScreen(
            error: error,
            onRetry:
                () =>
                    ref.read(serverConfigProvider.notifier).retestConnection(),
            onEdit: () {
              // Navigate to the setup screen for editing.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ServerSetupScreen(isFromSettings: true),
                ),
              );
            },
          ),
      data: (config) {
        if (config == null) {
          // First launch: user must set up the server.
          return const ServerSetupScreen();
        } else {
        // Server is ready, proceed to authentication check.
        return const AuthGate();
        }
      },
    );
  }
}

/// Handles authentication logic only after server readiness is confirmed.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      loading: () => const SplashScreen(),
      error: (err, stack) => const LogInPage(),
      data: (state) {
        log('Auth state: $state');
        if (state == const AuthState.authenticated()) {
          return const HomePage();
        } else {
          return const LogInPage();
        }
      },
    );
  }
}

/// A dedicated screen for when the saved server is unreachable on app launch.
class ServerRecoveryScreen extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  final VoidCallback onEdit;

  const ServerRecoveryScreen({
    super.key,
    required this.error,
    required this.onRetry,
    required this.onEdit,
  });

  /// Translates an error key from the notifier into a user-friendly, localized string.
  String _translateError(BuildContext context, Object errorKey) {
    final l10n = context.lango;
    switch (errorKey.toString()) {
      case 'errorServerUnreachable':
        return l10n.errorServerUnreachable;
      case 'errorConnectionTimeout':
        return l10n.errorConnectionTimeout;
      case 'errorUnexpectedResponse':
        return l10n.errorUnexpectedResponse;
      case 'errorGeneric':
        return l10n.errorGeneric;
      default:
        // Fallback for any other error that might not be a key.
        return errorKey.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 20),
              Text(
                context.lango.connectionFailed,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _translateError(context, error),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: Text(context.lango.retryConnection),
                onPressed: onRetry,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: onEdit,
                child: Text(context.lango.editServerSettings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
