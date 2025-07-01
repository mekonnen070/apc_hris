import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_balance.dart';
import 'package:police_com/features/leave_mgmt/domain/leave_type.dart';

class LeaveBalanceCard extends StatelessWidget {
  final LeaveBalance balance;
  final LeaveType leaveType;

  const LeaveBalanceCard({
    super.key,
    required this.balance,
    required this.leaveType,
  });

  ({Color color, IconData icon}) _getLeaveTypeVisuals(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final typeName = leaveType.typeName.toLowerCase();

    if (typeName.contains('annual')) {
      return (color: Colors.green.shade700, icon: Icons.beach_access_outlined);
    }
    if (typeName.contains('sick')) {
      return (color: Colors.orange.shade800, icon: Icons.sick_outlined);
    }
    if (typeName.contains('maternity')) {
      return (
        color: Colors.purple.shade700,
        icon: Icons.pregnant_woman_outlined,
      );
    }
    if (typeName.contains('paternity')) {
      return (color: Colors.blue.shade700, icon: Icons.child_friendly_outlined);
    }
    return (color: colors.secondary, icon: Icons.work_history_outlined);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visuals = _getLeaveTypeVisuals(context);
    final color = visuals.color;
    final icon = visuals.icon;
    final remaining = balance.balance;

    // FIX: Removed the incorrect `Expanded` widget. The widget now returns
    // a Card directly, making it a valid, reusable component.
    return Card(
      color: color.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    leaveType.typeName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                style: theme.textTheme.bodyLarge?.copyWith(color: color),
                children: [
                  TextSpan(
                    text: '$remaining',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' ${context.lango.daysLeft}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.lango.usedOf(
                used: balance.usedDays,
                allowed: balance.totalDays,
              ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
