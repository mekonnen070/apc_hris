import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
    final fullName =
        '${recruit.firstName} ${recruit.middleName} ${recruit.lastName}';

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
        secondary: CircleAvatar(
          // Assuming photoPath is a network URL. Provide a fallback.
          backgroundImage:
              recruit.photoPath.isNotEmpty
                  ? NetworkImage(recruit.photoPath)
                  : null,
          onBackgroundImageError:
              recruit.photoPath.isNotEmpty ? (e, s) {} : null,
          child: recruit.photoPath.isEmpty ? Text(recruit.firstName[0]) : null,
        ),
        title: Text(fullName),
        subtitle: Text(
          context.lango.id(id: recruit.id.toString()),
        ), // <-- REPLACED
      ),
    );
  }
}
