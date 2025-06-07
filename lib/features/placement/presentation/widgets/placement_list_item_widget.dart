import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/placement/domain/placement.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

class PlacementListItemWidget extends StatelessWidget {
  final Placement placement;
  final VoidCallback onTap;

  const PlacementListItemWidget({
    super.key,
    required this.placement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateRange =
        '${DateFormat.yMMMd().format(placement.startDate)} - ${DateFormat.yMMMd().format(placement.endDate)}';

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
              if (placement.currentUserApplicationStatus != null) ...[
                ApplicationStatusChip(
                  status: placement.currentUserApplicationStatus!,
                ),
                const SizedBox(height: 12),
              ],
              Text(placement.title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                placement.description,
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
                      placement.location,
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
