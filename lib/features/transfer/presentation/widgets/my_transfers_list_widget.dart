import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/transfer/application/transfer_notifier.dart';
import 'package:police_com/features/transfer/presentation/widgets/transfer_request_list_item_widget.dart';

class MyTransfersListWidget extends ConsumerWidget {
  const MyTransfersListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transferNotifierProvider);

    return state.when(
      data: (requests) {
        if (requests.isEmpty) {
          return const Center(
            child: Text('You have no active transfer requests.'),
          );
        }
        return RefreshIndicator(
          onRefresh:
              () =>
                  ref
                      .read(transferNotifierProvider.notifier)
                      .fetchMyTransferRequests(),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return TransferRequestListItemWidget(request: request);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, stack) =>
              Center(child: Text('Failed to load requests: $error')),
    );
  }
}
