import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';
import 'package:police_com/features/home/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Simulate splash delay
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    // Retrieve the boolean value. Default to false if not found.
    final isLoggedIn = prefs.getBool(AppConstants.isLoggedInKey) ?? false;

    if (!isLoggedIn) {
      // Navigate to LoginPage if user is not logged in.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      // Navigate to LoginPage if not logged in.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LogInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
