import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class PerformanceTab extends StatelessWidget {
  final EmployeeInfoModel employee;
  const PerformanceTab({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final performances = employee.performances;

    if (performances.isEmpty) {
      return Center(
        child: Text(context.lango.noPerformanceReviews), // <-- REPLACED
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
                context.lango.reviewDate(date: DateFormat.yMMMd().format(performance.evaluationDate))), // <-- REPLACED
            subtitle: Text(
                context.lango.ratingAndComments(rating: performance.rating.toDouble(), comments: performance.comments ?? context.lango.noComments)), // <-- REPLACED
          ),
        );
      },
    );
  }
}