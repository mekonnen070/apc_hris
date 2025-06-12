// lib/features/profile/presentation/tabs/personal_info_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/profile/presentation/forms/edit_personal_info_screen.dart';
import 'package:police_com/features/profile/presentation/widgets/profile_detail_item.dart';

extension StringCasingExtension on String {
  String toDisplayCase() =>
      this[0].toUpperCase() +
      replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), ' ').substring(1);
}

class PersonalInfoTab extends ConsumerWidget {
  final EmployeeInfoModel employeeInfo;
  const PersonalInfoTab({super.key, required this.employeeInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDetailItem(
            label: 'Full Name',
            value: employeeInfo.computedFullName,
          ),
          ProfileDetailItem(label: 'Email', value: employeeInfo.email),
          ProfileDetailItem(label: 'Phone', value: employeeInfo.phone),
          ProfileDetailItem(label: 'Mobile', value: employeeInfo.mobile),
          ProfileDetailItem(label: 'Address', value: employeeInfo.address1),
          const Divider(height: 32),
          ProfileDetailItem(
            label: 'Birth Date',
            value: DateFormat.yMMMd().format(employeeInfo.birthDate),
          ),
          ProfileDetailItem(
            label: 'Gender',
            value: employeeInfo.gender.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: 'Marital Status',
            value: employeeInfo.maritalStatus.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: 'Nationality',
            value: employeeInfo.nationality.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: 'Blood Group',
            value: employeeInfo.bloodGroup.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: 'Religion',
            value: employeeInfo.religion.name.toDisplayCase(),
          ),
          const Divider(height: 32),
          ProfileDetailItem(label: 'Position', value: employeeInfo.positionId),
          ProfileDetailItem(
            label: 'Hired Date',
            value: DateFormat.yMMMd().format(employeeInfo.hiredDate),
          ),
          ProfileDetailItem(
            label: 'Employment Status',
            value: employeeInfo.employmentStatus.name.toDisplayCase(),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (_) => EditPersonalInfoScreen(employeeInfo: employeeInfo),
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit Personal Details'),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}
