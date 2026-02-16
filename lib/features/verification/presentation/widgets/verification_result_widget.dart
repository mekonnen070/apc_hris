import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/features/employee_profile/domain/employee_verification_data_model.dart';

class VerificationResultWidget extends StatelessWidget {
  final EmployeeVerificationDataModel employee;
  final String baseUrl;
  const VerificationResultWidget({
    super.key,
    required this.employee,
    required this.baseUrl,
  });

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '—';
    try {
      return DateFormat.yMMMd().format(DateTime.parse(dateStr));
    } catch (_) {
      return dateStr;
    }
  }

  String _genderLabel(BuildContext context, String gender) {
    final l = context.lango;
    switch (gender.toLowerCase()) {
      case '0' || 'male' || 'm':
        return l.male;
      case '1' || 'female' || 'f':
        return l.female;
      default:
        return gender.isNotEmpty ? gender : '—';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l = context.lango;

    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            _buildHeader(context, colorScheme),
            // Personal Information
            _buildSection(
              context,
              title: l.personalInformation,
              icon: Icons.person_outline,
              rows: [
                _row(
                  Icons.badge_outlined,
                  l.employeeIdLabel,
                  employee.employeeId,
                ),
                _row(Icons.fingerprint, l.staffId, employee.staffId),
                _row(
                  Icons.person,
                  l.gender,
                  _genderLabel(context, employee.gender),
                ),
                _row(
                  Icons.cake_outlined,
                  l.birthDate,
                  _formatDate(employee.birthDate),
                ),
                _row(
                  Icons.woman,
                  l.mothersFullName,
                  employee.motherName ?? '—',
                ),
                _row(
                  Icons.location_on_outlined,
                  l.address,
                  employee.address ?? '—',
                ),
                _row(Icons.phone_android, l.mobile, employee.mobile ?? '—'),
                _row(Icons.email_outlined, l.email, employee.email ?? '—'),
                _row(Icons.public, l.nationality, employee.nationality ?? '—'),
                _row(
                  Icons.bloodtype_outlined,
                  l.bloodGroup,
                  employee.bloodGroup ?? '—',
                ),
                _row(
                  Icons.church_outlined,
                  l.religion,
                  employee.religion ?? '—',
                ),
                _row(
                  Icons.favorite_outline,
                  l.maritalStatus,
                  employee.maritalStatus ?? '—',
                ),
              ],
            ),
            // Employment Information
            _buildSection(
              context,
              title: l.employmentDetails,
              icon: Icons.work_outline,
              rows: [
                _row(Icons.work, l.position, employee.positionName ?? '—'),
                _row(
                  Icons.business,
                  l.department,
                  employee.departmentName ?? '—',
                ),
                _row(
                  Icons.corporate_fare,
                  l.organizationLabel,
                  employee.organizationName ?? '—',
                ),
                _row(Icons.military_tech, l.level, employee.levelName ?? '—'),
                _row(Icons.stars_outlined, l.scale, employee.scaleName ?? '—'),
                _row(
                  Icons.calendar_today,
                  l.hiredDate,
                  _formatDate(employee.hiredDate),
                ),
                _row(
                  Icons.event,
                  l.employmentStatus,
                  employee.employmentStatus ?? '—',
                ),
                _row(
                  Icons.assignment_ind,
                  l.retirementNumber,
                  employee.retirementNumber ?? '—',
                ),
                _row(
                  Icons.supervisor_account,
                  l.manager,
                  employee.managerName ?? '—',
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  employee.photoUrl != null
                      ? NetworkImage(
                        '$baseUrl${ApiEndpoints.employeeImage}${employee.photoUrl!.split('\\').last}',
                      )
                      : null,
              onBackgroundImageError: (e, s) {
                log(
                  e.toString(),
                  name: 'VerificationResultWidget',
                  stackTrace: s,
                );
              },
              child:
                  (employee.photoUrl == null)
                      ? const Icon(Icons.person, size: 50)
                      : null,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            employee.fullName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> rows,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          child: Row(
            children: [
              Icon(icon, size: 20, color: colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: rows),
        ),
      ],
    );
  }

  Widget _row(IconData icon, String label, String value) {
    return Builder(
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;
        final colorScheme = Theme.of(context).colorScheme;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Icon(
                  icon,
                  color: colorScheme.onSurfaceVariant,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
