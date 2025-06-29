import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/transfer_request_status.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/transfer/application/my_transfer_requests_notifier.dart';
import 'package:police_com/features/transfer/application/my_transfer_requests_providers.dart';
import 'package:police_com/features/transfer/domain/transfer_request_model.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_screen.dart';
import 'package:police_com/features/transfer/presentation/widgets/transfer_request_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:toastification/toastification.dart';

class MyTransferRequestsScreen extends HookConsumerWidget {
  const MyTransferRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferRequestsState = ref.watch(myTransferRequestsNotifierProvider);
    final transferRequestsNotifier = ref.read(
      myTransferRequestsNotifierProvider.notifier,
    );

    // Listen for success/error messages for operations like cancellation
    ref.listen<String?>(
      myTransferRequestsNotifierProvider.select((s) => s.successMessage),
      (prev, next) {
        if (next != null) {
          Toastification().show(
            context: context,
            title: Text(next),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 3),
          );
        }
      },
    );
    ref.listen<String?>(
      myTransferRequestsNotifierProvider.select((s) => s.errorMessage),
      (prev, next) {
        if (next != null) {
          Toastification().show(
            context: context,
            title: Text(next),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
      },
    );

    Widget buildBody() {
      if (transferRequestsState.isLoading &&
          transferRequestsState.requests.isEmpty) {
        return const CenteredLoadingIndicator();
      }
      if (transferRequestsState.errorMessage != null &&
          transferRequestsState.requests.isEmpty) {
        return ErrorDisplayWidget(
          message: transferRequestsState.errorMessage!,
          onRetry:
              () => transferRequestsNotifier.fetchMyTransferRequests(
                isRefresh: true,
              ),
        );
      }
      if (transferRequestsState.requests.isEmpty) {
        return EmptyListDisplayWidget(
          message: context.lango.noTransferRequestsYet, // <-- REPLACED
          actionText: context.lango.refresh, // <-- REPLACED
          onActionPressed:
              () => transferRequestsNotifier.fetchMyTransferRequests(
                isRefresh: true,
              ),
        );
      }

      return Scaffold(
        appBar: AppBarWidget(title: context.lango.myTransferRequests), // <-- REPLACED & REMOVED CONST
        floatingActionButton: FloatingActionButton(
          
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RequestTransferScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh:
              () => transferRequestsNotifier.fetchMyTransferRequests(
                isRefresh: true,
              ),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: transferRequestsState.requests.length,
            itemBuilder: (context, index) {
              final request = transferRequestsState.requests[index];
              return TransferRequestListItemWidget(
                request: request,
                onTap: () {
                  // Show full details of the request in a dialog
                  _showTransferRequestDetailDialog(context, request);
                },
                onCancel:
                    request.status ==
                                TransferRequestStatus.pendingManagerApproval ||
                            request.status ==
                                TransferRequestStatus.pendingHRApproval
                        ? () {
                          _confirmCancelRequest(
                            context,
                            transferRequestsNotifier,
                            request,
                          );
                        }
                        : null,
              );
            },
          ),
        ),
      );
    }

    return Scaffold(body: buildBody());
  }

  void _showTransferRequestDetailDialog(
    BuildContext context,
    TransferRequestModel request,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(context.lango.transferRequestDetails), // <-- REPLACED
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetailRow(context, context.lango.requestId, request.id), // <-- REPLACED
                _buildDetailRow(
                  context,
                  context.lango.currentPosition, // <-- REPLACED
                  request.currentPositionTitle,
                ),
                _buildDetailRow(
                  context,
                  context.lango.currentDepartment, // <-- REPLACED
                  request.currentDepartment,
                ),
                _buildDetailRow(
                  context,
                  context.lango.currentLocation, // <-- REPLACED
                  request.currentLocation,
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  context.lango.requestedDepartment, // <-- REPLACED
                  request.requestedDepartment,
                ),
                _buildDetailRow(
                  context,
                  context.lango.requestedLocation, // <-- REPLACED
                  request.requestedLocation,
                ),
                if (request.requestedPositionTitle != null &&
                    request.requestedPositionTitle!.isNotEmpty)
                  _buildDetailRow(
                    context,
                    context.lango.requestedPosition, // <-- REPLACED
                    request.requestedPositionTitle!,
                  ),
                _buildDetailRow(context, context.lango.reason, request.reasonForRequest), // <-- REPLACED
                _buildDetailRow(
                  context,
                  context.lango.requestDate, // <-- REPLACED
                  request.requestDate.toLocal().toString().split(' ')[0],
                ),
                _buildDetailRow(
                  context,
                  context.lango.status, // <-- REPLACED
                  request.status.name,
                ), // TODO: Use toDisplayString
                if (request.managerComments != null &&
                    request.managerComments!.isNotEmpty)
                  _buildDetailRow(
                    context,
                    context.lango.managerComments, // <-- REPLACED
                    request.managerComments!,
                  ),
                if (request.hrComments != null &&
                    request.hrComments!.isNotEmpty)
                  _buildDetailRow(context, context.lango.hrComments, request.hrComments!), // <-- REPLACED
                if (request.effectiveDate != null)
                  _buildDetailRow(
                    context,
                    context.lango.effectiveDate, // <-- REPLACED
                    request.effectiveDate!.toLocal().toString().split(' ')[0],
                  ),
                if (request.lastUpdated != null)
                  _buildDetailRow(
                    context,
                    context.lango.lastUpdated, // <-- REPLACED
                    request.lastUpdated!.toLocal().toString().split(' ')[0],
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(context.lango.close), // <-- REPLACED
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }

  void _confirmCancelRequest(
    BuildContext context,
    MyTransferRequestsNotifier notifier,
    TransferRequestModel request,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(context.lango.confirmCancellation), // <-- REPLACED
          content: Text(
            context.lango.confirmCancelTransferRequest(location: request.requestedLocation), // <-- REPLACED
          ),
          actions: <Widget>[
            TextButton(
              child: Text(context.lango.no), // <-- REPLACED
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                notifier.cancelTransferRequest(request.id);
              },
              child: Text(context.lango.yesCancel), // <-- REPLACED
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

// CenteredLoadingIndicator
class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

// ErrorDisplayWidget
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorDisplayWidget({
    required this.message,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        FilledButton(onPressed: onRetry, child: Text(context.lango.retry)), // <-- REPLACED
      ],
    );
  }
}

// EmptyListDisplayWidget
class EmptyListDisplayWidget extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onActionPressed;

  const EmptyListDisplayWidget({
    required this.message,
    required this.actionText,
    required this.onActionPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        FilledButton(onPressed: onActionPressed, child: Text(actionText)),
      ],
    );
  }
}