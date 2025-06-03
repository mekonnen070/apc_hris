import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/onboarding_task_status.dart';
import 'package:police_com/features/employee/employee_profile/presentation/employee_list_screen.dart';
import 'package:police_com/features/employee/employee_recruitment/application/providers/onboarding_providers.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/widgets/onboarding_task_item_widget.dart';

class OnboardingManagementScreen extends ConsumerWidget {
  final String applicantId;
  final String? applicantName; // Optional: To display name in AppBar

  const OnboardingManagementScreen({
    super.key,
    required this.applicantId,
    this.applicantName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingNotifierProvider(applicantId));
    final onboardingNotifier = ref.read(
      onboardingNotifierProvider(applicantId).notifier,
    );

    // Listen for success/error messages from the notifier
    ref.listen<String?>(
      onboardingNotifierProvider(applicantId).select((s) => s.successMessage),
      (prev, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next), backgroundColor: Colors.green),
          );
          // Clear message after showing
          Future.delayed(const Duration(milliseconds: 100), () {
            onboardingNotifier.state = onboardingNotifier.state.copyWith(
              successMessage: null,
            );
          });
        }
      },
    );
    ref.listen<String?>(
      onboardingNotifierProvider(applicantId).select((s) => s.errorMessage),
      (prev, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          Future.delayed(const Duration(milliseconds: 100), () {
            onboardingNotifier.state = onboardingNotifier.state.copyWith(
              errorMessage: null,
            );
          });
        }
      },
    );

    Widget buildBody() {
      if (onboardingState.isLoading && onboardingState.tasks.isEmpty) {
        return const CenteredLoadingIndicator();
      }
      if (onboardingState.errorMessage != null &&
          onboardingState.tasks.isEmpty) {
        return ErrorDisplayWidget(
          message: onboardingState.errorMessage!,
          onRetry:
              () => onboardingNotifier.fetchOnboardingTasks(isRefresh: true),
        );
      }
      if (onboardingState.tasks.isEmpty) {
        return EmptyListDisplayWidget(
          message: 'No onboarding tasks found for this applicant.',
          actionText: 'Refresh Tasks',
          onActionPressed:
              () => onboardingNotifier.fetchOnboardingTasks(isRefresh: true),
        );
      }

      // Calculate progress
      final completedTasks =
          onboardingState.tasks
              .where(
                (task) =>
                    task.status == OnboardingTaskStatus.completed ||
                    task.status == OnboardingTaskStatus.waived,
              )
              .length;
      final totalTasks = onboardingState.tasks.length;
      final progress = totalTasks > 0 ? completedTasks / totalTasks : 0.0;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Onboarding Progress:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}% ($completedTasks/$totalTasks)',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh:
                  () =>
                      onboardingNotifier.fetchOnboardingTasks(isRefresh: true),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                itemCount: onboardingState.tasks.length,
                itemBuilder: (context, index) {
                  final task = onboardingState.tasks[index];
                  return OnboardingTaskItemWidget(
                    task: task,
                    applicantId: applicantId,
                  );
                },
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          applicantName != null
              ? 'Onboarding: $applicantName'
              : 'Manage Onboarding',
        ),
        // Potentially add actions like "Add Manual Task" or "Complete Onboarding Process"
      ),
      body: buildBody(),
    );
  }
}
