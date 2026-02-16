import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
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
            label: context.lango.fullName, // <-- REPLACED
            value: employeeInfo.computedFullName,
          ),
          ProfileDetailItem(label: context.lango.email, value: employeeInfo.email), // <-- REPLACED
          ProfileDetailItem(label: context.lango.phone, value: '${employeeInfo.phone}'), // <-- REPLACED
          ProfileDetailItem(label: context.lango.mobileNumber, value: employeeInfo.mobile), // <-- REPLACED
          ProfileDetailItem(label: context.lango.address, value: '${employeeInfo.address1}, ${employeeInfo.address2}'), // <-- REPLACED
          const Divider(height: 32),
          ProfileDetailItem(
            label: context.lango.birthDate, // <-- REPLACED
            value: DateFormat.yMMMd().format(employeeInfo.birthDate),
          ),
          ProfileDetailItem(
            label: context.lango.gender, // <-- REPLACED
            value: employeeInfo.gender.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: context.lango.maritalStatus, // <-- REPLACED
            value: employeeInfo.maritalStatus.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: context.lango.nationality, // <-- REPLACED
            value: employeeInfo.nationality.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: context.lango.bloodGroup, // <-- REPLACED
            value: employeeInfo.bloodGroup.name.toDisplayCase(),
          ),
          ProfileDetailItem(
            label: context.lango.religion, // <-- REPLACED
            value: employeeInfo.religion.name.toDisplayCase(),
          ),
          const Divider(height: 32),
          ProfileDetailItem(label: context.lango.position, value: employeeInfo.positionId), // <-- REPLACED
          ProfileDetailItem(
            label: context.lango.hiredDate, // <-- REPLACED
            value: DateFormat.yMMMd().format(employeeInfo.hiredDate),
          ),
          ProfileDetailItem(
            label: context.lango.employmentStatus, // <-- REPLACED
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
            label: Text(context.lango.editPersonalDetails), // <-- REPLACED
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}