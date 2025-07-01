import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';

class LeaveHistoryListItem extends StatelessWidget {
  final LeaveRequest request;
  final String leaveTypeName;

  const LeaveHistoryListItem({
    super.key,
    required this.request,
    required this.leaveTypeName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedStartDate = DateFormat.yMMMd().format(request.startDate);
    final formattedEndDate = DateFormat.yMMMd().format(request.endDate);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leaveTypeName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // We can use a generic status chip if the enums are compatible
                // For now, we'll display the text directly.
                Chip(
                  label: Text(request.requestStatus.name.toDisplayCase()),
                  backgroundColor: theme.colorScheme.secondaryContainer
                      .withOpacity(0.5),
                  side: BorderSide.none,
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${context.lango.fromLabel}: $formattedStartDate'),
                Text('${context.lango.toLabel}: $formattedEndDate'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              context.lango.daysOnly(count: request.numOfDays),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
