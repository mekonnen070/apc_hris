// lib/features/splash/presentation/splash_screen.dart

import 'package:flutter/material.dart';

// The Architect's Note:
// The splash screen is now a stateless, logic-less UI component.
// Its only responsibility is to display the initial loading state.
// All navigation and state-checking logic has been removed, as it does not belong here.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
