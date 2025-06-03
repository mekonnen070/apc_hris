import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/application/providers/add_new_employee_step_provider.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_list_providers.dart';
import 'package:police_com/features/employee_profile/presentation/add_new_employee_host_screen.dart';
import 'package:police_com/features/employee_profile/presentation/employee_details/employee_detail_screen.dart';
import 'package:police_com/features/employee_profile/presentation/widgets/employee_list_item_widget.dart';

// A basic loading widget
class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

// A basic error display widget
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const ErrorDisplayWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

// A basic empty list display widget
class EmptyListDisplayWidget extends StatelessWidget {
  final String message;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const EmptyListDisplayWidget({
    super.key,
    required this.message,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inbox_rounded, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onActionPressed,
                child: Text(actionText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class EmployeeListScreen extends HookConsumerWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeListState = ref.watch(employeeListNotifierProvider);
    final employeeListNotifier = ref.read(
      employeeListNotifierProvider.notifier,
    );

    final scrollController = useScrollController();
    final searchController = useTextEditingController();
    final isSearching = useState(false); // To toggle search field visibility

    // Effect for infinite scrolling
    useEffect(
      () {
        void listener() {
          // If scrolled to almost the end of the list
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200) {
            if (employeeListState.canLoadMore &&
                !employeeListState.isLoadingMore) {
              employeeListNotifier.fetchNextPage();
            }
          }
        }

        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [
        scrollController,
        employeeListState.canLoadMore,
        employeeListState.isLoadingMore,
      ],
    );

    // Effect to clear search when search bar is hidden
    useEffect(() {
      if (!isSearching.value && searchController.text.isNotEmpty) {
        searchController.clear();
        employeeListNotifier.search(''); // Clear search results
      }
      return null;
    }, [isSearching.value]);

    Widget buildBody() {
      if (employeeListState.isLoadingInitial &&
          employeeListState.employees.isEmpty) {
        return const CenteredLoadingIndicator();
      }
      if (employeeListState.errorMessage != null &&
          employeeListState.employees.isEmpty) {
        return ErrorDisplayWidget(
          message: employeeListState.errorMessage!,
          onRetry:
              () => employeeListNotifier.fetchInitialEmployees(
                query: employeeListState.currentSearchQuery,
              ),
        );
      }
      if (employeeListState.employees.isEmpty) {
        return EmptyListDisplayWidget(
          message:
              employeeListState.currentSearchQuery.isNotEmpty
                  ? "No employees found matching '${employeeListState.currentSearchQuery}'."
                  : "No employees found. Tap '+' to add a new employee.",
          actionText:
              employeeListState.currentSearchQuery.isNotEmpty
                  ? 'Clear Search'
                  : null,
          onActionPressed:
              employeeListState.currentSearchQuery.isNotEmpty
                  ? () {
                    searchController.clear();
                    employeeListNotifier.search('');
                  }
                  : null,
        );
      }

      return RefreshIndicator(
        onRefresh: () => employeeListNotifier.refreshList(),
        child: ListView.builder(
          controller: scrollController,
          itemCount:
              employeeListState.employees.length +
              (employeeListState.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < employeeListState.employees.length) {
              final employee = employeeListState.employees[index];
              return EmployeeListItemWidget(
                employee: employee,
                onTap: () {
                  // Navigate to the EmployeeDetailScreen, passing the selected employee data.
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EmployeeDetailScreen(employee: employee),
                    ),
                  );
                },
              );
            } else {
              // Loading indicator for the next page
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CenteredLoadingIndicator(),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:
            isSearching.value
                ? TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search employees (Name, ID)...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).appBarTheme.foregroundColor?.withOpacity(0.7),
                    ),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    fontSize: 18,
                  ),
                  onChanged: (query) {
                    // Optional: Implement debouncing for search
                    employeeListNotifier.search(query);
                  },
                )
                : const Text('Employee Management'),
        actions: [
          IconButton(
            icon: Icon(
              isSearching.value ? Icons.close_rounded : Icons.search_rounded,
            ),
            tooltip: isSearching.value ? 'Close Search' : 'Search Employees',
            onPressed: () {
              isSearching.value = !isSearching.value;
              if (!isSearching.value && searchController.text.isNotEmpty) {
                // If search is closed and there was a query, clear it.
                searchController.clear();
                employeeListNotifier.search('');
              }
            },
          ),
          // TODO: Add Filter IconButton if needed
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Prepare notifier for a new employee and reset step provider
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .prepareNewEmployee();
          ref.read(currentEmployeeCreationStepProvider.notifier).state = 0;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddNewEmployeeHostScreen()),
          );
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Employee'),
        tooltip: 'Add New Employee',
      ),
    );
  }
}
