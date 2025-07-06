import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/clearance/application/clearance_notifier.dart';
import 'package:police_com/features/clearance/presentation/request_clearance_screen.dart';
import 'package:police_com/features/clearance/presentation/widgets/clearance_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class ClearanceScreen extends ConsumerStatefulWidget {
  const ClearanceScreen({super.key});

  @override
  ConsumerState<ClearanceScreen> createState() => _ClearanceScreenState();
}

class _ClearanceScreenState extends ConsumerState<ClearanceScreen> {
  @override
  void initState() {
    super.initState();
    // In a real app, this ID would come from the authenticated user's state.
    Future.microtask(
      () => ref
          .read(clearanceNotifierProvider.notifier)
          .getMyClearanceRequests('CURRENT_USER_ID'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(clearanceNotifierProvider);

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.clearanceRequests),
      body: SafeArea(
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (requests) {
            if (requests.isEmpty) {
              return Center(child: Text(context.lango.noClearanceRequests));
            }
            return RefreshIndicator(
              onRefresh:
                  () => ref
                      .read(clearanceNotifierProvider.notifier)
                      .getMyClearanceRequests('CURRENT_USER_ID'),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  return ClearanceListItemWidget(request: requests[index]);
                },
              ),
            );
          },
          error:
              (e, st) => SomethingWentWrongWidget(
                onRetry: () => ref.read(clearanceNotifierProvider),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push<bool?>(
            MaterialPageRoute(
              builder: (context) => const RequestClearanceScreen(),
            ),
          );
          if (result == true) {
            ref
                .read(clearanceNotifierProvider.notifier)
                .getMyClearanceRequests('CURRENT_USER_ID');
          }
        },
        tooltip: context.lango.requestClearance, // <-- REPLACED
        child: const Icon(Icons.add_task_outlined),
      ),
    );
  }
}
