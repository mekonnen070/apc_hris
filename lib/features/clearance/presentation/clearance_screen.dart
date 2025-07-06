import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/clearance/application/clearance_notifier.dart';
import 'package:police_com/features/clearance/presentation/request_clearance_screen.dart';
import 'package:police_com/features/clearance/presentation/widgets/widgets/clearance_list_widget.dart';

class ClearanceScreen extends ConsumerWidget {
  const ClearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const ClearanceListWidget(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const RequestClearanceScreen()),
          );
          if (result == true) {
            ref
                .read(clearanceNotifierProvider.notifier)
                .fetchMyRequests(isRefresh: true);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('New Request'),
      ),
    );
  }
}
