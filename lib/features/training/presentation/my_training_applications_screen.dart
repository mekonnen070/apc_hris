import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/training/application/my_training_applications_notifier.dart';
import 'package:police_com/features/training/presentation/widgets/my_training_application_list_item_widget.dart';

class MyTrainingApplicationsList extends ConsumerWidget {
  const MyTrainingApplicationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myTrainingApplicationsNotifierProvider);

    return state.when(
      data: (applications) {
        if (applications.isEmpty) {
          return const Center(
            child: Text('You have not applied for any trainings.'),
          );
        }
        return RefreshIndicator(
          onRefresh:
              () async =>
                  ref.invalidate(myTrainingApplicationsNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: applications.length,
            itemBuilder: (context, index) {
              final application = applications[index];
              return MyTrainingApplicationListItemWidget(
                application: application,
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
