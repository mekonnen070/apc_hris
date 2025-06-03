// lib/features/recruitment/presentation/vacancy_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/vacancy_status.dart';
import 'package:police_com/core/extensions/enum_extension.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/vacancy_model.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/application_form_screen.dart';
// TODO: Import ApplicationFormScreen when created
// import 'application_form_screen.dart';

class VacancyDetailScreen extends HookConsumerWidget {
  final VacancyModel vacancy;

  const VacancyDetailScreen({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bool canApply =
        vacancy.status == VacancyStatus.open &&
        vacancy.closingDate.isAfter(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text(vacancy.positionTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              vacancy.positionTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              context,
              Icons.business_outlined,
              'Department:',
              vacancy.department,
            ),
            if (vacancy.sectionOrUnit != null &&
                vacancy.sectionOrUnit!.isNotEmpty)
              _buildDetailRow(
                context,
                Icons.lan_outlined,
                'Section/Unit:',
                vacancy.sectionOrUnit!,
              ),
            _buildDetailRow(
              context,
              Icons.location_on_outlined,
              'Location:',
              vacancy.location,
            ),
            _buildDetailRow(
              context,
              Icons.work_outline,
              'Employment Type:',
              vacancy.employmentType.toDisplayString,
            ),
            _buildDetailRow(
              context,
              Icons.people_alt_outlined,
              'Openings:',
              vacancy.numberOfOpenings.toString(),
            ),
            if (vacancy.positionGrade != null &&
                vacancy.positionGrade!.isNotEmpty)
              _buildDetailRow(
                context,
                Icons.grade_outlined,
                'Position Grade:',
                vacancy.positionGrade!,
              ),
            if (vacancy.gradeSalary != null && vacancy.gradeSalary! > 0)
              _buildDetailRow(
                context,
                Icons.payments_outlined,
                'Salary:',
                'ETB ${NumberFormat("#,##0.00", "en_US").format(vacancy.gradeSalary)}',
              )
            else if (vacancy.salaryRange != null &&
                vacancy.salaryRange!.isNotEmpty)
              _buildDetailRow(
                context,
                Icons.payments_outlined,
                'Salary Range:',
                vacancy.salaryRange!,
              ),

            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _buildDetailRow(
                    context,
                    Icons.calendar_today_outlined,
                    'Posted:',
                    DateFormat('dd MMM, yyyy').format(vacancy.postingDate),
                  ),
                ),
                Flexible(
                  child: _buildDetailRow(
                    context,
                    Icons.event_busy_outlined,
                    'Closes:',
                    DateFormat('dd MMM, yyyy').format(vacancy.closingDate),
                    valueColor:
                        vacancy.closingDate.isBefore(DateTime.now())
                            ? Colors.red.shade700
                            : null,
                  ),
                ),
              ],
            ),
            _buildDetailRow(
              context,
              Icons.flag_outlined,
              'Status:',
              vacancy.status.toDisplayString,
              valueColor:
                  vacancy.status == VacancyStatus.open
                      ? Colors.green.shade700
                      : (vacancy.status == VacancyStatus.closed ||
                              vacancy.status == VacancyStatus.filled
                          ? Colors.grey.shade700
                          : theme.colorScheme.onSurface),
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Job Description'),
            Text(vacancy.description, style: theme.textTheme.bodyLarge),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Key Responsibilities'),
            ...vacancy.responsibilities.map(
              (resp) => _buildListItem(context, resp),
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Required Qualifications'),
            ...vacancy.qualifications.map(
              (qual) => _buildListItem(context, qual),
            ),

            if (vacancy.preferredQualifications != null &&
                vacancy.preferredQualifications!.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildSectionTitle(context, 'Preferred Qualifications'),
              ...vacancy.preferredQualifications!.map(
                (qual) => _buildListItem(context, qual),
              ),
            ],

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Application Procedure'),
            Text(
              vacancy.applicationProcedure,
              style: theme.textTheme.bodyLarge,
            ),

            if ((vacancy.contactEmail != null &&
                    vacancy.contactEmail!.isNotEmpty) ||
                (vacancy.contactPhone != null &&
                    vacancy.contactPhone!.isNotEmpty)) ...[
              const SizedBox(height: 16),
              _buildSectionTitle(context, 'Contact for Inquiries'),
              if (vacancy.contactEmail != null &&
                  vacancy.contactEmail!.isNotEmpty)
                _buildDetailRow(
                  context,
                  Icons.email_outlined,
                  'Email:',
                  vacancy.contactEmail!,
                ),
              if (vacancy.contactPhone != null &&
                  vacancy.contactPhone!.isNotEmpty)
                _buildDetailRow(
                  context,
                  Icons.phone_outlined,
                  'Phone:',
                  vacancy.contactPhone!,
                ),
            ],

            if (vacancy.reportingToPositionId != null &&
                vacancy.reportingToPositionId!.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildSectionTitle(context, 'Reporting Structure'),
              _buildDetailRow(
                context,
                Icons.supervisor_account_outlined,
                'Reports To (Position ID):',
                vacancy.reportingToPositionId!,
              ),
            ],

            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          canApply
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => ApplicationFormScreen(
                            vacancyId: vacancy.id,
                            vacancyTitle: vacancy.positionTitle,
                          ),
                    ),
                  );
                },
                icon: const Icon(Icons.send_outlined),
                label: const Text('Apply Now'),
              )
              : (vacancy.status != VacancyStatus.open
                  ? Chip(
                    label: Text(
                      'Application ${vacancy.status.toDisplayString}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey.shade700,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  )
                  : null),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Flexible(
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 8),
          Text(
            '$label ',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: valueColor),
            ),
          ),
        ],
      ),
    );
  }
}
