// lib/features/profile/presentation/tabs/performance_tab.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class PerformanceTab extends StatelessWidget {
  final EmployeeInfoModel employee;
  const PerformanceTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final performances = employee.performances;

    if (performances.isEmpty) {
      return const Center(
        child: Text('No performance reviews available.'),
      );
    }

    return ListView.builder(
      itemCount: performances.length,
      itemBuilder: (context, index) {
        final performance = performances[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
                'Review Date: ${DateFormat.yMMMd().format(performance.evaluationDate)}'),
            subtitle: Text(
                'Rating: ${performance.rating} - ${performance.comments ?? 'No comments'}'),
          ),
        );
      },
    );
  }
}
