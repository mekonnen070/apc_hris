import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';

class LeaveHistoryListItem extends StatelessWidget {
  final LeaveRequest request;
  const LeaveHistoryListItem({super.key, required this.request});

  Color _getStatusColor(LeaveRequestStatus status, BuildContext context) {
    switch (status) {
      case LeaveRequestStatus.approved:
        return Colors.green;
      case LeaveRequestStatus.rejected:
        return Theme.of(context).colorScheme.error;
      case LeaveRequestStatus.cancelled:
        return Colors.grey;
      case LeaveRequestStatus.pending:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(request.requestStatus, context);
    final formattedStartDate = DateFormat.yMMMd().format(request.startDate);
    final formattedEndDate = DateFormat.yMMMd().format(request.endDate);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${request.leaveTypeId.toCapitalized()} Leave',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    request.requestStatus.name.toCapitalized(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: statusColor),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(
                    text: 'From: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: formattedStartDate),
                  const TextSpan(
                    text: '  To: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: formattedEndDate),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (request.requestReason != null &&
                request.requestReason!.isNotEmpty)
              Text(
                '${request.numOfDays} Day(s) - ${request.requestReason}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            else
              Text(
                '${request.numOfDays} Day(s)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
