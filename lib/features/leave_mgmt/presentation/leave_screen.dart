import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/leave_mgmt/application/leave_notifier.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_balance_card_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_history_list_item_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/request_leave_screen.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';

class LeaveScreen extends HookConsumerWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(leaveNotifierProvider.notifier);
    final state = ref.watch(leaveNotifierProvider);
    final scrollController = useScrollController();

    useEffect(() {
      Future.microtask(() => notifier.fetchInitialData());
      return null;
    }, const []);

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          notifier.fetchNextPage();
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    // Helper to find a specific leave balance by type
    LeaveBalance? findBalance(String typeId) {
      try {
        return state.leaveBalances.firstWhere((b) => b.leaveTypeId == typeId);
      } catch (e) {
        return null;
      }
    }

    final annualBalance = findBalance('Annual');
    final sickBalance = findBalance('Sick');

    return Scaffold(
      appBar: const AppBarWidget(title: 'Leave Management'),
      body: RefreshIndicator(
        onRefresh: notifier.fetchInitialData,
        child:
            state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null && state.leaveBalances.isEmpty
                ? Center(child: Text(state.errorMessage!))
                : CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Leave Balance',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16),
                            if (annualBalance != null || sickBalance != null)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (annualBalance != null)
                                    LeaveBalanceCard(
                                      title: 'Annual Leave',
                                      used: annualBalance.usedDays,
                                      allowed: annualBalance.totalDays,
                                      color: Colors.blue.shade700,
                                    ),
                                  if (annualBalance != null &&
                                      sickBalance != null)
                                    const SizedBox(width: 16),
                                  if (sickBalance != null)
                                    LeaveBalanceCard(
                                      title: 'Sick Leave',
                                      used: sickBalance.usedDays,
                                      allowed: sickBalance.totalDays,
                                      color: Colors.red.shade700,
                                    ),
                                ],
                              )
                            else
                              const Text('No balance information available.'),
                            const SizedBox(height: 24),
                            Text(
                              'Request History',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (state.leaveHistory.isEmpty && !state.isLoading)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text('No leave history found.'),
                          ),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final request = state.leaveHistory[index];
                          return LeaveHistoryListItem(request: request);
                        }, childCount: state.leaveHistory.length),
                      ),
                    if (state.isFetchingMore)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                  ],
                ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RequestLeaveScreen()),
          );
        },
        label: const Text('New Leave Request'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
