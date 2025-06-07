import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/training/domain/training.dart';

class OpportunityDetailHeader extends StatelessWidget {
  final Training training;
  const OpportunityDetailHeader({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateRange =
        '${DateFormat.yMMMd().format(training.startDate)} - ${DateFormat.yMMMd().format(training.endDate)}';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            training.trainingName,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            icon: Icons.calendar_today_outlined,
            text: dateRange,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            icon: Icons.business_outlined,
            text: 'Organized by: ${training.organizedBy}',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            context,
            icon: Icons.location_on_outlined,
            text: 'Location: ${training.trainingCenter}',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, {required IconData icon, required String text}) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: theme.textTheme.bodyLarge),
        ),
      ],
    );
  }
}