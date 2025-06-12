// lib/features/clearance/presentation/widgets/clearance_list_item_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/clearance/domain/clearance_request.dart';
import 'package:police_com/features/profile/presentation/tabs/personal_info_tab.dart';
import 'package:police_com/features/widgets/clearance_status_chip.dart';

class ClearanceListItemWidget extends StatelessWidget {
  final ClearanceRequest request;

  const ClearanceListItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.reason.name.toDisplayCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ClearanceStatusChip(status: request.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Requested On: ${DateFormat.yMMMd().format(request.requestDate)}',
            ),
            const SizedBox(height: 4),
            Text(
              'Last Day of Work: ${DateFormat.yMMMd().format(request.lastDayOfWork)}',
            ),
            if (request.comments != null && request.comments!.isNotEmpty) ...[
              const Divider(height: 24),
              Text(request.comments!),
            ],
          ],
        ),
      ),
    );
  }
}
