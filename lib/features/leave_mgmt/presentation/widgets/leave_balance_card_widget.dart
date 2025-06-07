import 'package:flutter/material.dart';

class LeaveBalanceCard extends StatelessWidget {
  final String title;
  final int used;
  final int allowed;
  final Color color;

  const LeaveBalanceCard({
    super.key,
    required this.title,
    required this.used,
    required this.allowed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = allowed - used;
    final theme = Theme.of(context);

    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  style: theme.textTheme.bodyLarge?.copyWith(color: color),
                  children: [
                    TextSpan(
                      text: '$remaining',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' Days Left'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Used: $used of $allowed',
                style: theme.textTheme.bodyMedium?.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
