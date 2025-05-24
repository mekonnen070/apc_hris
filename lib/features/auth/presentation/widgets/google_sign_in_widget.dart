import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/assets.dart';
import 'package:police_com/core/theme/app_colors.dart';
import 'package:toastification/toastification.dart';

class GoogleSignInWidget extends ConsumerWidget {
  const GoogleSignInWidget({super.key});

  /// Handles the Google sign-in process.
  ///
  Future<void> _handleLogin(WidgetRef ref) async {
    // final authRepo = ref.read(authRepositoryProvider);
    toastification.show(
      title: Text('Coming soon..'),
      description: Text(
        'Google sign-in is not implemented yet. Use email instead.',
      ),
      autoCloseDuration: const Duration(seconds: 2),
    );

    return;
  }

  /// Returns the style for the button.
  ButtonStyle _style() => FilledButton.styleFrom(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    minimumSize: const Size(265, 44),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: AppColors.grey, width: 1),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: () => _handleLogin(ref),
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            Assets.googleLogo,
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
        ),
        label: Text('Sign in with Google'),
        style: _style(),
      ),
    );
  }
}
