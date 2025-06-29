import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED

class SomethingWentWrongWidget extends ConsumerWidget {
  const SomethingWentWrongWidget({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.lango.somethingWentWrong), // <-- REPLACED & REMOVED CONST
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: Text(context.lango.retry)), // <-- REPLACED & REMOVED CONST
        ],
      ),
    );
  }
}