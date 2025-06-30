import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/transfer_status.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';

class TransferRequestListItemWidget extends StatelessWidget {
  final TransferRequest request;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const TransferRequestListItemWidget({
    super.key,
    required this.request,
    required this.onTap,
    this.onDelete,
  });

  Color _getStatusColor(BuildContext context, TransferStatus status) {
    switch (status) {
      case TransferStatus.approved:
      case TransferStatus.passed:
        return Colors.green.shade700;
      case TransferStatus.rejected:
        return Theme.of(context).colorScheme.error;
      case TransferStatus.pending:
      case TransferStatus.submitted:
        return Colors.orange.shade800;
      default:
        return Theme.of(context).colorScheme.secondary;
    }
  }

  IconData _getStatusIcon(TransferStatus status) {
    switch (status) {
      case TransferStatus.approved:
      case TransferStatus.passed:
        return Icons.check_circle_outline_rounded;
      case TransferStatus.rejected:
        return Icons.cancel_outlined;
      case TransferStatus.pending:
      case TransferStatus.submitted:
        return Icons.hourglass_empty_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(context, request.status);
    final statusText = request.status.name.toDisplayCase();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      elevation: 1.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
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
                      context.lango.transferTo(
                        location: request.requestedLocation ?? 'N/A',
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Chip(
                    avatar: Icon(
                      _getStatusIcon(request.status),
                      size: 16,
                      color: statusColor,
                    ),
                    label: Text(statusText),
                    labelStyle: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: statusColor.withOpacity(0.1),
                    side: BorderSide.none,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.lango.submittedOn(
                      date: DateFormat.yMMMd().format(request.requestDate),
                    ),
                    style: theme.textTheme.bodySmall,
                  ),
                  if (onDelete != null)
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, size: 18),
                      label: Text(context.lango.delete),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
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
