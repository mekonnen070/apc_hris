import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/auth/application/auth_controller.dart';
import 'package:police_com/features/auth/presentation/log_in_page.dart';

class LogOutPage extends ConsumerStatefulWidget {
  const LogOutPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogOutPageState();
}

class _LogOutPageState extends ConsumerState<LogOutPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout),
      title:
          _isLoading
              ? Center(child: const CircularProgressIndicator.adaptive())
              : const Text('Logout'),
      onTap: () async {
        setState(() => _isLoading = true);

        await Future.delayed(const Duration(seconds: 2));
        await ref.read(authControllerProvider).logout();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LogInPage()),
        );
      },
    );
  }
}
