import 'package:flutter/material.dart';
import 'package:police_com/features/placement/presentation/widgets/available_placements_list.dart';
import 'package:police_com/features/placement/presentation/widgets/my_placement_applications_list.dart';

class PlacementScreen extends StatelessWidget {
  const PlacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Available Placements'),
              Tab(text: 'My Applications'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                AvailablePlacementsList(),
                MyPlacementApplicationsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
