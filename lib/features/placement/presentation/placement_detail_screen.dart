import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/applicant_status.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/placement/application/placement_application_notifier.dart';
import 'package:police_com/features/placement/application/placement_detail_notifier.dart';
import 'package:police_com/features/placement/domain/placement_applicant.dart';

class PlacementDetailScreen extends ConsumerWidget {
  final int placementId;
  const PlacementDetailScreen({super.key, required this.placementId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placementState = ref.watch(
      placementDetailNotifierProvider(placementId),
    );
    final employeeState = ref.watch(currentEmployeeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Placement Details')),
      body: employeeState.when(
        data: (employeeInfo) {
          if (employeeInfo == null) {
            return const Center(
              child: Text('Could not load employee information.'),
            );
          }
          return placementState.when(
            data:
                (placement) => SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        placement.announcementTitle,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        context,
                        Icons.location_on_outlined,
                        'Location',
                        placement.location,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.business_outlined,
                        'Department',
                        placement.department,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.work_outline,
                        'Experience',
                        '${placement.requiredExperience} years',
                      ),
                      _buildDetailRow(
                        context,
                        Icons.school_outlined,
                        'Education',
                        placement.requiredEducation.name,
                      ),
                      _buildDetailRow(
                        context,
                        Icons.people_outline,
                        'Applicants Required',
                        placement.requiredApplicants.toString(),
                      ),
                      _buildDetailRow(
                        context,
                        Icons.calendar_today_outlined,
                        'Apply Before',
                        DateFormat.yMMMd().format(placement.expiryDate),
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
            (employeeInfo) => placementState.maybeWhen(
              data: (placement) {
                if (employeeInfo == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      final application = PlacementApplicant(
                        applicantId: 0, // Backend likely generates this
                        pAnnouncementId: placement.announcementId,
                        employeeId: employeeInfo.employeeId,
                        entryDate: DateTime.now(),
                        entryBy: employeeInfo.employeeId,
                        policeTitle: employeeInfo.title?.index ?? 0,
                        applicantStatus: ApplicantStatus.submitted,
                      );

                      ref
                          .read(placementApplicationNotifierProvider.notifier)
                          .applyForPlacement(application)
                          .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Application Submitted Successfully!',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          })
                          .catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Submission Failed: $e'),
                              ),
                            );
                          });
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
