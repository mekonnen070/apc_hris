import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/config/server_config/server_setup_screen.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:police_com/features/auth/domain/auth_state.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
import 'package:police_com/features/widgets/splash_screen.dart'; // The simple, logic-less splash screen

/// AppOrchestrator is the new root widget.
/// It ensures server configuration is ready before checking authentication.
class AppOrchestrator extends ConsumerWidget {
  const AppOrchestrator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // STAGE 1: Watch the server configuration provider.
    final serverConfigState = ref.watch(serverConfigProvider);

    return serverConfigState.when(
      // While checking server config, show a splash screen.
      loading: () => const SplashScreen(),

      // If server is unreachable or config is invalid, show a recovery screen.
      error:
          (err, stack) => ServerRecoveryScreen(
            error: err.toString(),
            onRetry:
                () =>
                    ref.read(serverConfigProvider.notifier).retestConnection(),
            onEdit: () {
              // Allow user to go to the setup screen to enter a new IP/Port.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const ServerSetupScreen(isFromSettings: true),
                ),
              );
            },
          ),

      // If we have data about server config...
      data: (config) {
        if (config == null) {
          // The config is empty (first launch), user must set it up.
          return const ServerSetupScreen();
        } else {
          // The server is ready. Proceed to STAGE 2: Authentication.
          return const AuthGate();
        }
      },
    );
  }
}

/// AuthGate handles the authentication flow.
/// It is only ever reached if the server configuration is valid.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // STAGE 2: Watch the authentication provider.
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      loading: () => const SplashScreen(), // Show splash while checking auth
      error: (err, stack) => const LogInPage(), // On error, default to login
      data: (state) {
        // Route based on authentication state
        if (state == const AuthState.authenticated()) {
          return const HomePage();
        } else {
          return const LogInPage();
        }
      },
    );
  }
}

/// A dedicated screen for when the saved server is unreachable.

class ServerRecoveryScreen extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  final VoidCallback onEdit;

  const ServerRecoveryScreen({
    super.key,
    required this.error,
    required this.onRetry,
    required this.onEdit,
  });

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
                context.lango.connectionFailed, // ⭐️ Localized
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                error,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: Text(context.lango.retryConnection), // ⭐️ Localized
                onPressed: onRetry,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: onEdit,
                child: Text(context.lango.editServerSettings), // ⭐️ Localized
              ),
            ],
          ),
        ),
      ),
    );
  }
}
