import 'package:flutter/material.dart';

// A section for displaying a list of dynamic entries (e.g., qualifications, experiences)
// with an "Add New" button.
class DynamicEntrySection<T> extends StatelessWidget {
  final String sectionTitle;
  final String emptyListMessage;
  final List<T> itemsData;
  // itemBuilder provides data, onEdit callback, onDelete callback
  final Widget Function(
    BuildContext context,
    T itemData,
    VoidCallback onEdit,
    VoidCallback onDelete,
  )
  itemBuilder;
  final VoidCallback onAddNew;
  final String addNewButtonText;

  const DynamicEntrySection({
    super.key,
    required this.sectionTitle,
    this.emptyListMessage = 'No items added yet.',
    required this.itemsData,
    required this.itemBuilder,
    required this.onAddNew,
    required this.addNewButtonText,
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
              Text(
                sectionTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add_circle_outline),
                label: Text(addNewButtonText),
                onPressed: onAddNew,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (itemsData.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  emptyListMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true, // Important for ListView inside Column
              physics:
                  const NeverScrollableScrollPhysics(), // If not meant to scroll independently
              itemCount: itemsData.length,
              itemBuilder: (context, index) {
                final item = itemsData[index];
                // The itemBuilder from parameters handles creating the actual EditableListItemCard
                // It needs callbacks for edit/delete specific to this item.
                // These callbacks would typically involve Riverpod notifiers.
                return itemBuilder(
                  context,
                  item,
                  () {
                    /* Call Riverpod notifier to signal edit for 'item' */
                  },
                  () {
                    /* Call Riverpod notifier to signal delete for 'item' */
                  },
                );
              },
            ),
          const Divider(height: 20),
        ],
      ),
    );
  }
}
