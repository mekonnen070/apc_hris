import 'package:flutter/material.dart';

class ReviewSectionCard extends StatelessWidget {
  final String sectionTitle;
  final Widget
  content; // The widget that displays the actual data for this section
  final VoidCallback onEditPressed;
  final IconData sectionIcon; // Optional icon for the section

  const ReviewSectionCard({
    super.key,
    required this.sectionTitle,
    required this.content,
    required this.onEditPressed,
    this.sectionIcon = Icons.list_alt_outlined, // Default icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
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
                    Icon(sectionIcon, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      sectionTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColorDark,
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
                  ),
                ),
              ],
            ),
            const Divider(height: 16.0),
            content,
          ],
        ),
      ),
    );
  }
}

// Helper for simple key-value display
class ReviewDetailItem extends StatelessWidget {
  final String label;
  final String? value;

  const ReviewDetailItem({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? 'N/A',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
