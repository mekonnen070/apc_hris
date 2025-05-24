import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/application/registration_providers.dart';

// TODO: Import your app's home screen or dashboard for navigation
// import 'package:your_app/features/dashboard/presentation/screens/dashboard_screen.dart';
// Or your main navigation handler/router.

// TODO: If you need to clear the registration form state, you can access the provider
// import '../application/registration_providers.dart';

class RegistrationSuccessScreen extends HookConsumerWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Optionally, you can call to reset the registration form state here
    // if it hasn't been done already after a successful submission.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(registrationNotifierProvider.notifier).resetForm();
    });

    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surface, // Or a gentle background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline_rounded,
                color: Theme.of(context).primaryColor, // Or Colors.green
                size: 80.0,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Profile Submitted Successfully!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Thank you for completing your profile. Your information has been received.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                // TODO: Adjust this message based on the actual post-registration workflow
                'You will be notified once your profile is reviewed, or you can now proceed to the main dashboard.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Proceed to Dashboard'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  // TODO: Implement navigation to your app's main dashboard/home screen
                  // This should typically replace the entire registration flow from the navigation stack.
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(builder: (context) => const DashboardScreen()), // Replace with your actual home screen
                  //   (Route<dynamic> route) => false, // This removes all previous routes
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Navigating to Dashboard (Conceptual)...'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
