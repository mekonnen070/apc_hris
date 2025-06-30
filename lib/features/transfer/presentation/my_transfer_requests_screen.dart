import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/transfer_status.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/transfer/application/my_transfer_requests_notifier.dart';
import 'package:police_com/features/transfer/domain/transfer_request.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_screen.dart';
import 'package:police_com/features/transfer/presentation/widgets/transfer_request_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:toastification/toastification.dart';

class MyTransferRequestsScreen extends ConsumerWidget {
  const MyTransferRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myTransferRequestsNotifierProvider);
    final notifier = ref.read(myTransferRequestsNotifierProvider.notifier);

    ref.listen(myTransferRequestsNotifierProvider, (previous, next) {
      if (next.successMessage != null) {
        Toastification().show(
          context: context,
          title: Text(next.successMessage!),
          type: ToastificationType.success,
        );
      }
      if (next.errorMessage != null) {
        Toastification().show(
          context: context,
          title: Text(next.errorMessage!),
          type: ToastificationType.error,
        );
      }
    });

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.myTransferRequests),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push<bool>(
            MaterialPageRoute(builder: (_) => const RequestTransferScreen()),
          );
          if (result == true) {
            notifier.fetchMyTransferRequests(isRefresh: true);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => notifier.fetchMyTransferRequests(isRefresh: true),
        child: _buildBody(context, state, notifier),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MyTransferRequestsState state,
    MyTransferRequestsNotifier notifier,
  ) {
    if (state.isLoading && state.requests.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.errorMessage != null && state.requests.isEmpty) {
      return Center(child: Text(context.lango.somethingWentWrong));
    }
    if (state.requests.isEmpty) {
      return Center(
        child: Text(
          context.lango.noTransferRequestsYet,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: state.requests.length,
      itemBuilder: (context, index) {
        final request = state.requests[index];
        return TransferRequestListItemWidget(
          request: request,
          onTap: () => _showTransferRequestDetailDialog(context, request),
          onDelete:
              request.status == TransferStatus.pending ||
                      request.status == TransferStatus.submitted
                  ? () => _confirmCancelRequest(context, notifier, request)
                  : null,
        );
      },
    );
  }

  void _showTransferRequestDetailDialog(
    BuildContext context,
    TransferRequest request,
  ) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(
                context,
                context.lango.requestId,
                request.transferRequestId.toString(),
              ),
              _buildDetailRow(
                context,
                context.lango.status,
                request.status.name.toDisplayCase(),
              ),
              _buildDetailRow(
                context,
                context.lango.requestDate,
                DateFormat.yMMMd().format(request.requestDate),
              ),
              const Divider(height: 24),
              _buildDetailRow(
                context,
                context.lango.currentPosition,
                request.currentPosition ?? 'N/A',
              ),
              _buildDetailRow(
                context,
                context.lango.currentDepartment,
                request.currentDepartment ?? 'N/A',
              ),
              _buildDetailRow(
                context,
                context.lango.currentLocation,
                request.currentLocation ?? 'N/A',
              ),
              const Divider(height: 24),
              _buildDetailRow(
                context,
                context.lango.requestedPosition,
                request.requestedPositionTitle ?? 'N/A',
              ),
              _buildDetailRow(
                context,
                context.lango.requestedDepartment,
                request.requestedDepartment ?? 'N/A',
              ),
              _buildDetailRow(
                context,
                context.lango.requestedLocation,
                request.requestedLocation ?? 'N/A',
              ),
              const Divider(height: 24),
              _buildDetailRow(
                context,
                context.lango.reason,
                request.reasonForRequest?.name.toDisplayCase() ?? 'N/A',
              ),
              if (request.approvalDate != null)
                _buildDetailRow(
                  context,
                  context.lango.approvalDate,
                  DateFormat.yMMMd().format(request.approvalDate!),
                ),
              if (request.approvedBy != null)
                _buildDetailRow(
                  context,
                  context.lango.approvedBy,
                  request.approvedBy!,
                ),
              const Divider(height: 36),
            ],
          ),
        );
      },
    );
  }

  void _confirmCancelRequest(
    BuildContext context,
    MyTransferRequestsNotifier notifier,
    TransferRequest request,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(context.lango.delete),
            content: Text(
              context.lango.confirmDeleteItem(
                itemName: request.requestedLocation ?? 'N/A',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(context.lango.no),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  notifier.deleteTransferRequest(
                    request.transferRequestId.toString(),
                  );
                },
                child: Text(context.lango.delete),
              ),
            ],
          ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
