import 'package:flutter/material.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';

class EmployeeListItemWidget extends StatelessWidget {
  final EmployeeInfoModel employee;
  final VoidCallback onTap;

  const EmployeeListItemWidget({
    super.key,
    required this.employee,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 30,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                // TODO: Use CachedNetworkImage or similar for employee.photoUrl
                backgroundImage:
                    employee.photoUrl != null
                        ? NetworkImage(employee.photoUrl!)
                        : null,
                child:
                    employee.photoUrl == null
                        ? Text(
                          employee.computedFullName.isNotEmpty
                              ? employee.computedFullName
                                  .substring(0, 2)
                                  .toUpperCase()
                              : '??',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                        : null,
              ),
              const SizedBox(width: 16),
              // Employee Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.computedFullName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      employee
                          .positionId, // TODO: This should ideally be the position *title*, not ID
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'ID: ${employee.employeeId}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Trailing Action/Icon
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
