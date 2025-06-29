import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class VerificationResultWidget extends StatelessWidget {
  final EmployeeInfoModel employee;
  const VerificationResultWidget({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            _buildHeader(context, colorScheme),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildDetailRow(
                    context, // <-- ADDED
                    Icons.badge_outlined,
                    context.lango.employeeIdLabel, // <-- REPLACED
                    employee.employeeId,
                  ),
                  const Divider(),
                  _buildDetailRow(
                    context, // <-- ADDED
                    Icons.work_outline,
                    context.lango.position, // <-- REPLACED
                    employee.positionId,
                  ),
                  const Divider(),
                  _buildDetailRow(
                    context, // <-- ADDED
                    Icons.business_outlined,
                    context.lango.department, // <-- REPLACED
                    'Technology',
                  ), // Placeholder
                  const Divider(),
                  _buildDetailRow(
                    context, // <-- ADDED
                    Icons.schedule_outlined,
                    context.lango.hiredOn, // <-- REPLACED
                    DateFormat.yMMMd().format(employee.hiredDate),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(employee.photoUrl ?? ''),
              onBackgroundImageError: (e, s) {},
              child:
                  (employee.photoUrl == null)
                      ? const Icon(Icons.person, size: 50)
                      : null,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            employee.computedFullName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Chip(
            avatar: const Icon(
              Icons.verified_user_outlined,
              color: Colors.green,
              size: 20,
            ),
            label: Text(
              context.lango.verified.toUpperCase(), // <-- REPLACED
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            backgroundColor: Colors.green.withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    // <-- Pass context
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 20),
          const SizedBox(width: 16),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }
}
