import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED

// A section for displaying a list of dynamic entries with an "Add New" button.
class DynamicEntrySection<T> extends StatelessWidget {
  final String sectionTitle;
  final String? emptyListMessage; // <-- Made nullable
  final List<T> itemsData;
  // itemBuilder provides the context, specific item data, and its index.
  final Widget Function(BuildContext context, T itemData, int index)
  itemBuilder;
  final VoidCallback onAddNew;
  final String addNewButtonText;
  final bool showDivider; // New: control divider visibility

  const DynamicEntrySection({
    super.key,
    required this.sectionTitle,
    this.emptyListMessage,
    required this.itemsData,
    required this.itemBuilder,
    required this.onAddNew,
    required this.addNewButtonText,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // Allow title to wrap if too long
                child: Text(
                  sectionTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                icon: const Icon(Icons.add_circle_outline, size: 20),
                label: Text(addNewButtonText),
                onPressed: onAddNew,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Increased spacing
          if (itemsData.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ), // More padding for empty message
                child: Text(
                  emptyListMessage ??
                      context.lango.noItemsAdded, // <-- REPLACED
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
            )
          else
            ListView.separated(
              // Using separated for automatic dividers between items
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsData.length,
              itemBuilder: (context, index) {
                final item = itemsData[index];
                return itemBuilder(context, item, index);
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
            ),
          if (showDivider && itemsData.isNotEmpty) const SizedBox(height: 10),
          if (showDivider) const Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}
