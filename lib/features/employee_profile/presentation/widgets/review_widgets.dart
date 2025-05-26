// File: features/employee_profile/presentation/widgets/review_widgets.dart
import 'package:flutter/material.dart';

class ReviewSectionCard extends StatelessWidget {
  final String sectionTitle;
  final Widget content;
  final VoidCallback onEditPressed;
  final IconData sectionIcon;

  const ReviewSectionCard({
    super.key,
    required this.sectionTitle,
    required this.content,
    required this.onEditPressed,
    this.sectionIcon = Icons.list_alt_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      sectionIcon,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      sectionTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit'),
                  onPressed: onEditPressed,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const Divider(height: 16.0, thickness: 0.5),
            content,
          ],
        ),
      ),
    );
  }
}

class ReviewDetailItem extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueWidget; // For more complex value displays

  const ReviewDetailItem({
    super.key,
    required this.label,
    this.value,
    this.valueWidget,
  }) : assert(
         value != null || valueWidget != null,
         'Either value or valueWidget must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2, // Adjust flex factor as needed
            child: Text(
              '$label:',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3, // Adjust flex factor
            child:
                valueWidget ??
                Text(
                  value ?? 'N/A',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          ),
        ],
      ),
    );
  }
}
