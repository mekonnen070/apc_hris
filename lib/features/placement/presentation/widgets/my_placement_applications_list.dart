import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/application/my_placement_applications_notifier.dart';
import 'package:police_com/features/placement/presentation/widgets/my_placement_application_list_item_widget.dart';

class MyPlacementApplicationsList extends ConsumerWidget {
  const MyPlacementApplicationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPlacementApplicationsNotifierProvider);

    return state.when(
      data: (applications) {
        if (applications.isEmpty) {
          return const Center(
            child: Text('You have not applied for any placements.'),
          );
        }
        return RefreshIndicator(
          onRefresh:
              () async =>
                  ref.invalidate(myPlacementApplicationsNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: applications.length,
            itemBuilder: (context, index) {
              final application = applications[index];
              return MyPlacementApplicationListItemWidget(
                application: application,
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
