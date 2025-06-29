import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/all_enums.dart'; // For TransferRequestStatus
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/enum_extension.dart'; // For toDisplayString
import 'package:police_com/features/transfer/domain/transfer_request_model.dart';

class TransferRequestListItemWidget extends StatelessWidget {
  final TransferRequestModel request;
  final VoidCallback onTap;
  final VoidCallback? onCancel; // Optional callback for cancellation

  const TransferRequestListItemWidget({
    super.key,
    required this.request,
    required this.onTap,
    this.onCancel,
  });

  Color _getStatusColor(TransferRequestStatus status, ThemeData theme) {
    switch (status) {
      case TransferRequestStatus.pendingManagerApproval:
      case TransferRequestStatus.pendingHRApproval:
        return Colors.orange.shade700;
      case TransferRequestStatus.approved:
      case TransferRequestStatus.completed:
        return Colors.green.shade700;
      case TransferRequestStatus.rejectedByManager:
      case TransferRequestStatus.rejectedByHR:
      case TransferRequestStatus.cancelledByEmployee:
        return theme.colorScheme.error;
      default:
        return theme.textTheme.bodySmall?.color ?? Colors.grey;
    }
  }

  IconData _getStatusIcon(TransferRequestStatus status) {
    switch (status) {
      case TransferRequestStatus.pendingManagerApproval:
      case TransferRequestStatus.pendingHRApproval:
        return Icons.hourglass_empty_rounded;
      case TransferRequestStatus.approved:
        return Icons.check_circle_outline_rounded;
      case TransferRequestStatus.completed:
        return Icons.done_all_rounded;
      case TransferRequestStatus.rejectedByManager:
      case TransferRequestStatus.rejectedByHR:
        return Icons.cancel_outlined;
      case TransferRequestStatus.cancelledByEmployee:
        return Icons.do_not_disturb_on_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(request.status, theme);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
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
                      context.lango.requestTo(
                        department: request.requestedDepartment,
                      ), // <-- REPLACED
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Chip(
                    avatar: Icon(
                      _getStatusIcon(request.status),
                      size: 18,
                      color: statusColor,
                    ),
                    label: Text(
                      request.status.toDisplayString,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: statusColor.withValues(alpha: 0.1),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      request.requestedLocation,
                      style: theme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              if (request.requestedPositionTitle != null &&
                  request.requestedPositionTitle!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.work_outline,
                      size: 16,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        request.requestedPositionTitle!,
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.lango.submittedOn(
                      date: DateFormat(
                        'dd MMM, yyyy',
                      ).format(request.requestDate),
                    ), // <-- REPLACED
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  if (onCancel != null)
                    TextButton.icon(
                      onPressed: onCancel,
                      icon: const Icon(Icons.cancel_outlined, size: 18),
                      label: Text(context.lango.cancel), // <-- REPLACED
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
