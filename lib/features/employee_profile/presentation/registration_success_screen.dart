import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: Import your app's main dashboard/home screen for navigation
// import 'package:police_com/features/dashboard/presentation/screens/dashboard_screen.dart'; // Example path
// Or import your main navigation router/handler

class RegistrationSuccessScreen extends HookConsumerWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                'Employee Added Successfully!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'The new employee profile has been created and saved to the system.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                // This message can be customized based on next steps for the admin user
                'You can now manage this employee or add another.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.dashboard_customize_outlined,
                ), // Changed icon
                label: const Text(
                  'Go to Employee List',
                ), // Or "Go to Dashboard"
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
                  // TODO: Implement navigation to your app's employee list or main dashboard.
                  // This should typically replace the entire registration flow from the navigation stack.
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(builder: (context) => const EmployeeListScreen()), // Replace with your actual screen
                  //   (Route<dynamic> route) => false,
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Navigating to Employee List (Conceptual)...',
                      ),
                    ),
                  );
                  // Fallback or if staying in same flow but wanting to go "home"
                  // if (Navigator.canPop(context)) { // Pop until a certain route or just pop this success screen
                  //   Navigator.of(context).popUntil((route) => route.isFirst); // Example: Go to initial route
                  // }
                },
              ),
              const SizedBox(height: 16.0),
              TextButton(
                child: const Text('Add Another Employee'),
                onPressed: () {
                  // Navigate back to the beginning of the employee creation flow.
                  // The AddNewEmployeeHostScreen's useEffect should handle resetting the form via notifier.
                  // This pop will take them back to the screen *before* AddNewEmployeeHostScreen if that's how it was launched.
                  // Or, if AddNewEmployeeHostScreen is always root for this flow, it might re-trigger its useEffect.
                  // A more robust way is to use a specific route or a global navigator key to go to the start of add employee.
                  // For now, just pop.
                  if (Navigator.canPop(context)) {
                    // This will pop the success screen. The review screen should have used pushAndRemoveUntil.
                    // If ReviewScreen did use pushAndRemoveUntil to get here, this pop won't go back to review.
                    // This implies the screen that launched AddNewEmployeeHostScreen is now visible.
                    // To truly restart, you might need a dedicated navigation action.
                    Navigator.of(context).pop(); // Pops this success screen
                    // Then, the screen that shows "Add New Employee" button would allow starting again.
                    // Or, use a deep link / specific route to restart the AddNewEmployeeHostScreen.
                    // Example:
                    // Navigator.of(context).pushReplacementNamed('/add-new-employee-host');
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Preparing for new employee entry (Conceptual)...',
                      ),
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
