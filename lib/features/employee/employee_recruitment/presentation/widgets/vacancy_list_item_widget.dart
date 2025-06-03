// lib/features/recruitment/presentation/widgets/vacancy_list_item_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/vacancy_status.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/vacancy_model.dart';

class VacancyListItemWidget extends StatelessWidget {
  final VacancyModel vacancy;
  final VoidCallback onTap;

  const VacancyListItemWidget({
    super.key,
    required this.vacancy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isClosingSoon =
        vacancy.closingDate.isAfter(DateTime.now()) &&
        vacancy.closingDate.difference(DateTime.now()).inDays <= 3;
    final bool isClosed =
        vacancy.closingDate.isBefore(DateTime.now()) ||
        vacancy.status == VacancyStatus.closed ||
        vacancy.status == VacancyStatus.filled;

    Color statusColor = theme.colorScheme.secondary;
    if (vacancy.status == VacancyStatus.closed ||
        vacancy.status == VacancyStatus.filled) {
      statusColor = Colors.grey;
    } else if (isClosingSoon) {
      statusColor = Colors.orange.shade700;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      vacancy.positionTitle,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Chip(
                    label: Text(
                      vacancy.status.toDisplayString,
                      style: TextStyle(
                        color: theme.colorScheme.onSecondaryContainer,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: statusColor.withOpacity(0.2),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.business_outlined,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      vacancy.department,
                      style: theme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      vacancy.location,
                      style: theme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${vacancy.numberOfOpenings} Opening(s)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    isClosed
                        ? 'Closed: ${DateFormat('dd MMM, yyyy').format(vacancy.closingDate)}'
                        : 'Closes: ${DateFormat('dd MMM, yyyy').format(vacancy.closingDate)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color:
                          isClosed
                              ? Colors.grey.shade600
                              : (isClosingSoon
                                  ? Colors.orange.shade800
                                  : theme.colorScheme.onSurfaceVariant),
                      fontWeight:
                          isClosingSoon ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
