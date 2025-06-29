import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED

// A card to display an item with optional edit and delete actions.
class EditableListItemCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onTap; // For general tap action, e.g., view details
  final bool isThreeLine;

  const EditableListItemCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onEdit,
    this.onDelete,
    this.onTap,
    this.isThreeLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsets.symmetric(), // Removed horizontal for full width in ListView
      elevation:
          0, // Often looks cleaner in a list managed by DynamicEntrySection
      shape: RoundedRectangleBorder(
        // No border or use theme's card border
        side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ListTile(
        leading: leading,
        isThreeLine: isThreeLine,
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle:
            subtitle != null
                ? Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium)
                : null,
        trailing:
            (onEdit != null || onDelete != null)
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (onEdit != null)
                      IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                        tooltip: context.lango.edit, // <-- REPLACED
                        onPressed: onEdit,
                      ),
                    if (onDelete != null)
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Theme.of(context).colorScheme.error,
                          size: 20,
                        ),
                        tooltip: context.lango.delete, // <-- REPLACED
                        onPressed: onDelete,
                      ),
                  ],
                )
                : null,
        onTap: onTap,
        dense: true, // Make it a bit more compact
      ),
    );
  }
}