import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/training/domain/training.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

class TrainingListItemWidget extends StatelessWidget {
  final Training training;
  final VoidCallback onTap;

  const TrainingListItemWidget({
    super.key,
    required this.training,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateRange =
        '${DateFormat.yMMMd().format(training.startDate)} - ${DateFormat.yMMMd().format(training.endDate)}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (training.currentUserApplicationStatus != null) ...[
                ApplicationStatusChip(
                  status: training.currentUserApplicationStatus!,
                ),
                const SizedBox(height: 12),
              ],
              Text(training.trainingName, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                training.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(dateRange, style: theme.textTheme.bodySmall),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${training.trainingCenter} by ${training.organizedBy}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
