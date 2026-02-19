import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/verification/presentation/verification_screen.dart';

class GuestVerificationPage extends StatelessWidget {
  const GuestVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.lango.verifyEmployee)),
      body: const SafeArea(child: VerificationBody()),
    );
  }
}
