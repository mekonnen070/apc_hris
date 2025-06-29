import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/promotion/domain/promotion_request.dart';
import 'package:police_com/features/promotion/presentation/widgets/promotion_status_widget.dart';

class PromotionListItemWidget extends StatelessWidget {
  final PromotionRequest request;

  const PromotionListItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.lango.requestForPromotion, // <-- REPLACED
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        request.promotedToPositionId,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                PromotionStatusWidget(status: request.status),
              ],
            ),
            const Divider(height: 24),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '${context.lango.fromLabel} ', // <-- REPLACED
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: request.currentPositionId),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.lango.requestedLabel(date: DateFormat.yMMMd().format(request.requestDate)), // <-- REPLACED
            ),
            if (request.comments != null && request.comments!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                request.comments!,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}