import 'package:flutter/material.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/features/training/domain/training_applicant.dart';

class SelectedTrainingApplicantsListWidget extends StatelessWidget {
  final List<TrainingApplicant> applicants;
  const SelectedTrainingApplicantsListWidget({super.key, required this.applicants});

  @override
  Widget build(BuildContext context) {
    if (applicants.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(context.lango.noSelectedApplicantInfo), // <-- REPLACED
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: applicants.length,
      itemBuilder: (context, index) {
        final applicant = applicants[index];
        return ListTile(
          dense: true,
          leading: CircleAvatar(
            backgroundImage:
                applicant.employeePhotoPath != null
                    ? NetworkImage(applicant.employeePhotoPath!)
                    : null,
            onBackgroundImageError:
                applicant.employeePhotoPath != null ? (e, s) {} : null,
            child:
                applicant.employeePhotoPath == null
                    ? Text(applicant.employeeFullName?[0] ?? '?')
                    : null,
          ),
          title: Text(applicant.employeeFullName ?? context.lango.notAvailable), // <-- REPLACED
          subtitle: Text(context.lango.employeeId(id: applicant.employeeId)), // <-- REPLACED
        );
      },
    );
  }
}