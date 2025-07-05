import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/features/transfer/application/transfer_notifier.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

class TransferRequestListItemWidget extends ConsumerWidget {
  final TransferRequest request;

  const TransferRequestListItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(theme, request.status);
    final statusText = request.status.name;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: statusColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'To: ${request.requestedLocation ?? 'N/A'}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (request.status == TransferStatus.pending ||
                    request.status == TransferStatus.submitted)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _confirmDelete(context, ref, request),
                  ),
              ],
            ),
            const Divider(height: 20),
            _buildInfoRow(
              theme,
              Icons.apartment_outlined,
              'Department',
              request.requestedDepartment ?? 'N/A',
            ),
            const SizedBox(height: 8),
            _buildInfoRow(
              theme,
              Icons.calendar_today_outlined,
              'Submitted',
              DateFormat.yMMMd().format(request.requestDate),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: Chip(
                label: Text(
                  statusText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: statusColor,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    ThemeData theme,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 16, color: theme.primaryColor),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

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
              'Are you sure you want to cancel this transfer request?',
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
