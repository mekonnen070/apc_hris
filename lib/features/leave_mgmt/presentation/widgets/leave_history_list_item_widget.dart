import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/leave_request_status.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/leave_mgmt/application/leave_notifier.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_request.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/request_leave_screen.dart';

class LeaveHistoryListItem extends ConsumerWidget {
  final LeaveRequest request;
  final String leaveTypeName;

  const LeaveHistoryListItem({
    super.key,
    required this.request,
    required this.leaveTypeName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(theme, request.requestStatus);
    final canBeModified = request.requestStatus == LeaveRequestStatus.pending;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    leaveTypeName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(request.requestStatus.name.toDisplayCase()),
                  backgroundColor: statusColor.withOpacity(0.15),
                  side: BorderSide.none,
                ),
              ],
            ),
            if (request.requestReason != null &&
                request.requestReason!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  request.requestReason!,
                  style: theme.textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const Divider(height: 24),
            Row(
              children: [
                _buildDateColumn(
                  theme,
                  context.lango.fromLabel,
                  request.startDate,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        context.lango.daysOnly(count: request.numOfDays),
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                _buildDateColumn(theme, context.lango.toLabel, request.endDate),
              ],
            ),
            if (canBeModified)
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  spacing: 8,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20),
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => RequestLeaveScreen(
                                    requestToEdit: request,
                                  ),
                            ),
                          ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: theme.colorScheme.error,
                      ),
                      onPressed: () => _confirmDelete(context, ref),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateColumn(ThemeData theme, String label, DateTime date) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.labelMedium),
          Text(
            DateFormat.yMMMd().format(date),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ThemeData theme, LeaveRequestStatus status) {
    switch (status) {
      case LeaveRequestStatus.approved:
        return Colors.green.shade700;
      case LeaveRequestStatus.rejected:
        return theme.colorScheme.error;
      default:
        return Colors.orange.shade800;
    }
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Delete Request'),
            content: const Text(
              'Are you sure you want to delete this leave request?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('No'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(leaveNotifierProvider.notifier)
                      .deleteRequest(request.leaveRequestId!);
                },
                child: const Text('Yes, Delete'),
              ),
            ],
          ),
    );
  }
}
