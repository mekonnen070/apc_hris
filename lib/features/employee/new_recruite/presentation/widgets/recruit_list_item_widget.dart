import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';

class RecruitListItemWidget extends StatelessWidget {
  final RecruitInfo recruit;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const RecruitListItemWidget({
    super.key,
    required this.recruit,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Construct the full name from the new fields, handling potential nulls.
    final fullName = '${recruit.firstName ?? ''} ${recruit.fatherName ?? ''}';
    final initial = (recruit.firstName?.isNotEmpty ?? false)
        ? recruit.firstName![0].toUpperCase()
        : '?';

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        ),
      ),
      child: CheckboxListTile(
        dense: true,
        value: isSelected,
        onChanged: onChanged,
        // The secondary widget no longer uses a photo path.
        secondary: CircleAvatar(
          child: Text(initial),
        ),
        title: Text(fullName.trim()),
        subtitle: Text(
          // Use the new recruitId and handle null case.
          context.lango.id(id: recruit.recruitId ?? 'N/A'),
        ),
      ),
    );
  }
}