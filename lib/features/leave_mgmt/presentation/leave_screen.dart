import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/leave_mgmt/application/leave_notifier.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_balance_card_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/leave_history_list_item_widget.dart';
import 'package:police_com/features/leave_mgmt/presentation/widgets/request_leave_screen.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';

class LeaveScreen extends ConsumerWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leaveNotifierProvider);
    final notifier = ref.read(leaveNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.leaveManagement),
      body: RefreshIndicator(
        onRefresh: notifier.fetchInitialData,
        child: state.isLoading && state.leaveBalances.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : state.errorMessage != null && state.leaveBalances.isEmpty
                ? Center(child: Text(state.errorMessage!))
                : _LeaveScreenContent(state: state),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (context) => const RequestLeaveScreen()),
          );
          if (result == true) {
            notifier.fetchInitialData();
          }
        },
        label: Text(context.lango.newLeaveRequest),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class _LeaveScreenContent extends HookConsumerWidget {
  final LeaveState state;
  const _LeaveScreenContent({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          ref.read(leaveNotifierProvider.notifier).fetchNextPage();
        }
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController],);

    // Create a lookup map for leave types for efficient access.
    final leaveTypeMap = {for (final type in state.leaveTypes) type.typeId: type};

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.lango.leaveBalance,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                if (state.leaveBalances.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.leaveBalances.map((balance) {
                        final leaveType = leaveTypeMap[balance.leaveTypeId];
                        if (leaveType == null) return const SizedBox.shrink();
                        
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: LeaveBalanceCard(
                            balance: balance,
                            leaveType: leaveType,
                          ),
                        );
                      }).toList(),
                    ),
                  )
                else
                  Text(context.lango.noBalanceInfoAvailable),
                const SizedBox(height: 24),
                Text(
                  context.lango.requestHistory,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        if (state.leaveHistory.isEmpty && !state.isLoading)
          SliverFillRemaining(
            child: Center(child: Text(context.lango.noLeaveHistoryFound)),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final request = state.leaveHistory[index];
                final leaveType = leaveTypeMap[request.leaveTypeId];
                return LeaveHistoryListItem(
                  request: request,
                  leaveTypeName: leaveType?.typeName ?? request.leaveTypeId,
                );
              },
              childCount: state.leaveHistory.length,
            ),
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
    );
  }
}
