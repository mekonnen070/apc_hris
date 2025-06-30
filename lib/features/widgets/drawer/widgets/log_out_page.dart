// lib/features/auth/presentation/widgets/logout_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';

// The Architect's Note:
// This is no longer a page but a compliant, reusable widget.
// It is a ConsumerWidget that derives its state from the central authNotifierProvider.
// It has a single responsibility: to initiate the logout process.
class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the auth state to show a loading indicator when logging out.
    final authState = ref.watch(authNotifierProvider);

    return ListTile(
      leading: const Icon(Icons.logout),
      title: Text(context.lango.logout),
      // The Architect's Note:
      // The UI state is handled declaratively. If authState is loading,
      // a progress indicator is shown in the trailing position.
      trailing:
          authState.isLoading
              ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(strokeWidth: 2),
              )
              : null,
      // The onTap handler's only job is to call the notifier's method.
      // It is disabled during the logout process to prevent multiple calls.
      onTap:
          authState.isLoading
              ? null
              : () => ref.read(authNotifierProvider.notifier).logout(),
    );
  }
}
