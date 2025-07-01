// import 'package:flutter/material.dart';
// import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
// import 'package:police_com/features/placement/domain/placement_applicant.dart';

// class SelectedPlacementApplicantsListWidget extends StatelessWidget {
//   final List<PlacementApplicant> applicants;
//   const SelectedPlacementApplicantsListWidget({super.key, required this.applicants});

//   @override
//   Widget build(BuildContext context) {
//     if (applicants.isEmpty) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Text(context.lango.noSelectedApplicantInfo), // <-- REPLACED
//         ),
//       );
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: applicants.length,
//       itemBuilder: (context, index) {
//         final applicant = applicants[index];
//         return ListTile(
//           dense: true,
//           leading: CircleAvatar(
//             backgroundImage:
//                 applicant.employeePhotoPath != null
//                     ? NetworkImage(applicant.employeePhotoPath!)
//                     : null,
//             onBackgroundImageError:
//                 applicant.employeePhotoPath != null ? (e, s) {} : null,
//             child:
//                 applicant.employeePhotoPath == null
//                     ? Text(applicant.employeeFullName?[0] ?? '?')
//                     : null,
//           ),
//           title: Text(applicant.employeeFullName ?? context.lango.notAvailable), // <-- REPLACED
//           subtitle: Text(context.lango.employeeId(id: applicant.employeeId)), // <-- REPLACED
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';
import 'package:police_com/features/widgets/application_status_chip.dart';

class SelectedPlacementApplicantsListWidget extends StatelessWidget {
  final List<PlacementApplicant> applicants;

  const SelectedPlacementApplicantsListWidget({
    super.key,
    required this.applicants,
  });

  @override
  Widget build(BuildContext context) {
    if (applicants.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            // context.lango.noApplicantsYet,
            'No applicants selected yet',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true, // Important for use inside SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Let the parent scroll
      itemCount: applicants.length,
      itemBuilder: (context, index) {
        final applicant = applicants[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(applicant.employeeId.substring(0, 2)),
            ),
            title: Text(applicant.employeeId),
            subtitle: Text('${context.lango.status}:'),
            trailing: ApplicationStatusChip(status: applicant.applicantStatus),
          ),
        );
      },
    );
  }
}
