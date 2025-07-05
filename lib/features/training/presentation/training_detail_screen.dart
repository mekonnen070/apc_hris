import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/training/application/training_application_notifier.dart';
import 'package:police_com/features/training/application/training_detail_notifier.dart';
import 'package:police_com/features/training/domain/training_application_request.dart';

class TrainingDetailScreen extends ConsumerWidget {
  final String trainingId;
  const TrainingDetailScreen({super.key, required this.trainingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Correctly watch the provider for the training's details
    final trainingState = ref.watch(trainingDetailNotifierProvider(trainingId));
    // Correctly watch the provider for the current employee's info
    final employeeState = ref.watch(currentEmployeeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Training Details')),
      // The body now depends on both the training and employee states
      body: employeeState.when(
        data: (employeeInfo) {
          // If employee info is null (logged out), show an error.
          if (employeeInfo == null) {
            return const Center(
              child: Text('Could not load employee information.'),
            );
          }
          // Once employee info is loaded, build the rest of the UI based on training state
          return trainingState.when(
            data:
                (training) => SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        training.trainingName,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        context,
                        Icons.info_outline,
                        'Type',
                        training.trainingType,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.location_city_outlined,
                        'Institution',
                        training.trainingInstitution,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.location_on_outlined,
                        'Location',
                        training.trainingLocation,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.calendar_today_outlined,
                        'Duration',
                        '${DateFormat.yMMMd().format(training.trainingStartDate)} - ${DateFormat.yMMMd().format(training.trainingEndDate)}',
                      ),
                      const Divider(height: 32),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        training.trainingDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Divider(height: 32),
                      Text(
                        'Requirements',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow(
                        context,
                        Icons.school_outlined,
                        'Education',
                        training.requiredEducation,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.work_outline,
                        'Experience',
                        '${training.requiredExperience} years',
                      ),
                      _buildDetailRow(
                        context,
                        Icons.person_outline,
                        'Gender',
                        training.requiredSex.name,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) =>
                Center(child: Text('Failed to load employee data: $err')),
      ),
      bottomNavigationBar: employeeState.maybeWhen(
        data:
            (employeeInfo) => trainingState.maybeWhen(
              data: (training) {
                if (employeeInfo == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      // Calculate age from birthDate
                      final today = DateTime.now();
                      final birthDate = employeeInfo.birthDate;
                      int age = today.year - birthDate.year;
                      if (today.month < birthDate.month ||
                          (today.month == birthDate.month &&
                              today.day < birthDate.day)) {
                        age--;
                      }

                      final applicationRequest = TrainingApplicationRequest(
                        applicantId: employeeInfo.employeeId,
                        appliedFor:
                            training.trainingId, // Make sure this is an int
                        age: age,
                        applicantStatus: ApplicantStatus.pending,
                        // Add other fields like cgpa if you have them
                      );

                      await ref
                          .read(trainingApplicationNotifierProvider.notifier)
                          .applyForTraining(applicationRequest);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Application Submitted Successfully!',
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Apply Now'),
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).primaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 2),
                Text(value, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
