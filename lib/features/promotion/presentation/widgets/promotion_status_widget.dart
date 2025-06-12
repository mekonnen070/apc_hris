// lib/features/promotion/presentation/widgets/promotion_status_widget.dart
import 'package:flutter/material.dart';
import 'package:police_com/core/enums/promotion_status.dart';
import 'package:police_com/features/profile/presentation/tabs/personal_info_tab.dart';

class PromotionStatusWidget extends StatelessWidget {
  final PromotionStatus status;
  const PromotionStatusWidget({super.key, required this.status});

  Color _getColor(PromotionStatus status) {
    switch (status) {
      case PromotionStatus.approved:
        return Colors.green;
      case PromotionStatus.rejected:
        return Colors.red;
      case PromotionStatus.pending:
      default:
        return Colors.blue;
    }
  }

  IconData _getIcon(PromotionStatus status) {
    switch (status) {
      case PromotionStatus.approved:
        return Icons.check_circle_outline;
      case PromotionStatus.rejected:
        return Icons.cancel_outlined;
      case PromotionStatus.pending:
      default:
        return Icons.pending_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(status);
    final icon = _getIcon(status);
    return Chip(
      avatar: Icon(icon, color: color, size: 18),
      label: Text(status.name.toDisplayCase()),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color.withOpacity(0.2)),
    );
  }
}
