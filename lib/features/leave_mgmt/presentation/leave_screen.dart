import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/leave_mgmt/application/leave_notifier.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_balance_card_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_history_list_item_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/request_leave_screen.dart';

class LeaveScreen extends ConsumerWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leaveNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: state.when(
          data:
              (data) => RefreshIndicator(
                onRefresh:
                    () =>
                        ref
                            .read(leaveNotifierProvider.notifier)
                            .fetchInitialData(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(
                          context.lango.leaveBalance,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 160,
                        child:
                            data.balances.isEmpty
                                ? Center(
                                  child: Text(
                                    context.lango.noBalanceInfoAvailable,
                                  ),
                                )
                                : ListView.builder(
                                  padding: const EdgeInsets.all(16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.balances.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final balance = data.balances[index];
                                    final matchingTypes = data.types.where(
                                      (t) => t.typeId == balance.leaveTypeId,
                                    );
                                    if (matchingTypes.isEmpty) {
                                      return const SizedBox.shrink();
                                    }
                                    return LeaveBalanceCard(
                                      balance: balance,
                                      leaveType: matchingTypes.first,
                                    );
                                  },
                                ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          context.lango.requestHistory,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    if (data.history.isEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Text(context.lango.noLeaveHistoryFound),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final request = data.history[index];
                          final matchingTypes = data.types.where(
                            (t) => t.typeId == request.leaveTypeId,
                          );
                          if (matchingTypes.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return LeaveHistoryListItem(
                            request: request,
                            leaveTypeName: matchingTypes.first.typeName,
                          );
                        }, childCount: data.history.length),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 80)),
                  ],
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RequestLeaveScreen()),
            ),
        label: Text(context.lango.newLeaveRequest),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
