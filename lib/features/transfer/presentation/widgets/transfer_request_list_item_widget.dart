import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/transfer/application/transfer_notifier.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

class TransferRequestListItemWidget extends ConsumerWidget {
  final TransferRequest request;

  const TransferRequestListItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(theme, request.transferStatus);
    final statusText = request.transferStatus.name.toDisplayCase();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor.withValues(alpha: 0.4), width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    statusText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: statusColor,
                  side: BorderSide.none,
                ),
                Text(
                  DateFormat.yMMMd().format(request.requestDate),
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                _buildLocationColumn(
                  theme,
                  'From',
                  request.currentDepartment,
                  request.currentPosition,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.arrow_forward_rounded, color: Colors.grey),
                ),
                _buildLocationColumn(
                  theme,
                  'To',
                  '${request.toDepartment}',
                  '${request.toPosition}',
                ),
              ],
            ),

            if (request.transferStatus == TransferStatus.pending ||
                request.transferStatus == TransferStatus.submitted)
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  onPressed: () => _confirmDelete(context, ref, request),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Cancel'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the "From" and "To" columns
  Widget _buildLocationColumn(
    ThemeData theme,
    String title,
    String department,
    String position,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            department,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            position,
            style: theme.textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Returns the color for the status chip
  Color _getStatusColor(ThemeData theme, TransferStatus status) {
    switch (status) {
      case TransferStatus.approved:
        return Colors.green.shade600;
      case TransferStatus.rejected:
        return theme.colorScheme.error;
      default:
        return Colors.orange.shade700;
    }
  }

  /// Shows the confirmation dialog for canceling a request
  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    TransferRequest request,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Cancel Request'),
            content: const Text(
              'Are you sure you want to cancel this transfer request? This action cannot be undone.',
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
                      .read(transferNotifierProvider.notifier)
                      .deleteTransferRequest(request.transferRequestId);
                },
                child: const Text('Yes, Cancel'),
              ),
            ],
          ),
    );
  }
}
