import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/placement/application/available_placements_notifier.dart';
import 'package:police_com/features/placement/presentation/widgets/placement_list_item_widget.dart';

class AvailablePlacementsList extends ConsumerWidget {
  const AvailablePlacementsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(availablePlacementsNotifierProvider);

    return state.when(
      data: (placements) {
        if (placements.isEmpty) {
          return const Center(
            child: Text('No available placements at the moment.'),
          );
        }
        return RefreshIndicator(
          onRefresh:
              () async => ref.invalidate(availablePlacementsNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: placements.length,
            itemBuilder: (context, index) {
              final placement = placements[index];
              return PlacementListItemWidget(placement: placement);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
