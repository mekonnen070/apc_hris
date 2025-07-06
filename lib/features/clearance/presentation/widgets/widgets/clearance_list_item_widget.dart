import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/clearance_status.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/clearance/application/clearance_notifier.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';

class ClearanceListItemWidget extends ConsumerWidget {
  final ClearanceRequest request;

  const ClearanceListItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(theme, request.clearanceStatus);
    final statusText = request.clearanceStatus.name.toDisplayCase();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.type.name.toDisplayCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(
                    statusText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  labelStyle: TextStyle(color: statusColor),
                  backgroundColor: statusColor.withValues(alpha: 0.15),
                  side: BorderSide.none,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Requested on: ${DateFormat.yMMMd().format(request.requestDate)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            if (request.remarks != null && request.remarks!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                request.remarks!,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (request.clearanceStatus == ClearanceStatus.pending)
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: theme.colorScheme.error,
                  ),
                  onPressed: () => _confirmDelete(context, ref, request),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(ThemeData theme, ClearanceStatus status) {
    switch (status) {
      case ClearanceStatus.approved:
        return Colors.green.shade700;
      case ClearanceStatus.rejected:
        return theme.colorScheme.error;
      default:
        return Colors.orange.shade800;
    }
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    ClearanceRequest request,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Cancel Request'),
            content: const Text(
              'Are you sure you want to cancel this clearance request?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  ref
                      .read(clearanceNotifierProvider.notifier)
                      .deleteRequest(request.requestId);
                },
                child: const Text('Yes, Cancel'),
              ),
            ],
          ),
    );
  }
}
