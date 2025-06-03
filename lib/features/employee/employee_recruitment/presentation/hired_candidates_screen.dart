// lib/features/recruitment/presentation/hired_candidates_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/gender.dart';
import 'package:police_com/core/enums/recruitment_status.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/applicant_apply_model.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/onboarding_management_screen.dart';

// Mock data for hired candidates - In a real app, this would come from a notifier
final _mockHiredCandidatesProvider = Provider<List<ApplicantApplyModel>>((ref) {
  return [
    ApplicantApplyModel(
      applicantId: 101,
      appliedToVacancyId: 'VAC001',
      firstName: 'Biruk',
      lastName: 'Lemma',
      email: 'biruk.lemma@examplepolice.com',
      phoneNumber: '0912345678',
      dateOfBirth: DateTime(1995, 5, 10),
      gender: Gender.male,
      address: 'Addis Ababa, Bole',
      nationality: 'Ethiopian',
      status: RecruitmentStatus.hired, // Or a new 'OnboardingPending' status
      entryDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
    ApplicantApplyModel(
      applicantId: 102,
      appliedToVacancyId: 'VAC002',
      firstName: 'Fatuma',
      lastName: 'Ali',
      email: 'fatuma.ali@examplepolice.com',
      phoneNumber: '0912345679',
      dateOfBirth: DateTime(1993, 2, 20),
      gender: Gender.female,
      address: 'Bahir Dar, Kebele 10',
      nationality: 'Ethiopian',
      status:
          RecruitmentStatus
              .onboarding, // Or a new 'OnboardingInProgress' status
      entryDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ApplicantApplyModel(
      applicantId:
          103, // Using a string for applicantId to match OnboardingNotifier
      appliedToVacancyId: 'VAC003',
      firstName: 'Kebede',
      lastName: 'Worku',
      email: 'kebede.worku@examplepolice.com',
      phoneNumber: '0911001122',
      dateOfBirth: DateTime(1990, 8, 15),
      gender: Gender.male,
      address: 'Gondar, Piazza',
      nationality: 'Ethiopian',
      status: RecruitmentStatus.hired,
      entryDate: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];
});

class HiredCandidatesScreen extends ConsumerWidget {
  const HiredCandidatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiredCandidates = ref.watch(_mockHiredCandidatesProvider);

    if (hiredCandidates.isEmpty) {
      return const Center(
        child: Text('No candidates are currently in the onboarding process.'),
      );
    }

    return Scaffold(
      // AppBar is usually part of the HomePage structure, so not adding one here
      // unless this screen is meant to be a standalone top-level view.
      // For now, assuming it's a body of a sub-module.
      body: ListView.builder(
        itemCount: hiredCandidates.length,
        itemBuilder: (context, index) {
          final candidate = hiredCandidates[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${candidate.firstName[0]}${candidate.lastName[0]}",
                ),
              ),
              title: Text('${candidate.firstName} ${candidate.lastName}'),
              subtitle: Text(
                'Status: ${candidate.status.toString().split('.').last}\nApplied for: ${candidate.appliedToVacancyId}',
              ), // Simple status display
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) => OnboardingManagementScreen(
                          // Ensure applicantId is string if OnboardingNotifier expects string
                          applicantId: candidate.applicantId.toString(),
                          applicantName:
                              '${candidate.firstName} ${candidate.lastName}',
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
