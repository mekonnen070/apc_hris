import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/placement/application/available_placements_notifier.dart';
import 'package:police_com/features/placement/presentation/placement_detail_screen.dart';
import 'package:police_com/features/placement/presentation/widgets/placement_list_item_widget.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';

class AvailablePlacementsScreen extends HookConsumerWidget {
  const AvailablePlacementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(availablePlacementsNotifierProvider.notifier);
    final state = ref.watch(availablePlacementsNotifierProvider);
    final scrollController = useScrollController();

    useEffect(() {
      Future.microtask(() => notifier.fetchFirstPage());
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

    return Scaffold(
      appBar: AppBarWidget(
        title: context.lango.availablePlacements,
      ), // <-- REPLACED & REMOVED CONST
      body: RefreshIndicator(
        onRefresh: () => notifier.fetchFirstPage(),
        child:
            state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null && state.placements.isEmpty
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(context.lango.noPlacementsFound),
                  ),
                )
                : ListView.builder(
                  controller: scrollController,
                  itemCount:
                      state.placements.length + (state.isFetchingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.placements.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final placement = state.placements[index];
                    return PlacementListItemWidget(
                      placement: placement,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (_) => PlacementDetailScreen(
                                  placementId:
                                      placement.placementAnnouncementId,
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
      ),
    );
  }
}
