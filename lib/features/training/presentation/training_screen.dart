import 'package:flutter/material.dart';
import 'package:police_com/features/training/presentation/available_trainings_screen.dart';
import 'package:police_com/features/training/presentation/my_training_applications_screen.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Available Trainings'),
              Tab(text: 'My Applications'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                AvailableTrainingsList(),
                MyTrainingApplicationsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
