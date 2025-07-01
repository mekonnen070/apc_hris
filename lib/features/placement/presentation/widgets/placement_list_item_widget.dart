import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/placement/domain/placement_announcement.dart';

class PlacementListItemWidget extends StatelessWidget {
  final PlacementAnnouncement announcement;
  final VoidCallback onApply;
  final bool isApplying;

  const PlacementListItemWidget({
    super.key,
    required this.announcement,
    required this.onApply,
    this.isApplying = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpired = DateTime.now().isAfter(announcement.expiryDate);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement.announcementTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow(
              context,
              icon: Icons.location_city_outlined,
              label: context.lango.location,
              value: announcement.location,
            ),
            _buildInfoRow(
              context,
              icon: Icons.business_outlined,
              label: context.lango.department,
              value: announcement.department,
            ),
            _buildInfoRow(
              context,
              icon: Icons.badge_outlined,
              label: context.lango.position,
              value: announcement.positionId,
            ),
            const Divider(height: 24),
            _buildInfoRow(
              context,
              icon: Icons.school_outlined,
              label: context.lango.education,
              value: announcement.requiredEducation.name.toDisplayCase(),
            ),
            _buildInfoRow(
              context,
              icon: Icons.stairs_outlined,
              label: context.lango.experience,
              value: context.lango.years(
                count: announcement.requiredExperience,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${context.lango.expiresOn}: ${DateFormat.yMMMd().format(announcement.expiryDate)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isExpired ? theme.colorScheme.error : null,
                  ),
                ),
                FilledButton.icon(
                  onPressed: isExpired || isApplying ? null : onApply,
                  icon:
                      isApplying
                          ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : Icon(
                            isExpired
                                ? Icons.timer_off_outlined
                                : Icons.check_circle_outline,
                          ),
                  label: Text(
                    isExpired ? context.lango.closed : context.lango.applyNow,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor:
                        isExpired ? Colors.grey : theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
