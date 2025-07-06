import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/clearance/application/clearance_notifier.dart';
import 'package:police_com/features/clearance/presentation/widgets/widgets/clearance_list_item_widget.dart';

class ClearanceListWidget extends ConsumerWidget {
  const ClearanceListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clearanceNotifierProvider);

    return state.when(
      data: (requests) {
        if (requests.isEmpty) {
          return const Center(child: Text('No clearance requests found.'));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(clearanceNotifierProvider.notifier).fetchMyRequests(isRefresh: true),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return ClearanceListItemWidget(request: request);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Failed to load requests: $error')),
    );
  }
}