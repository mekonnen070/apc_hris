import 'package:flutter/widgets.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee/employee_profile/presentation/employee_list_screen.dart';
import 'package:police_com/features/employee/employee_profile/retirement_page.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/hired_candidates_screen.dart';
import 'package:police_com/features/employee/employee_recruitment/presentation/vacancies_screen.dart';
import 'package:police_com/features/leave_mgmt/leave_mgmt_page.dart';

extension SubModuleExtension on SubModule {
  MainModule get mainModule {
    switch (this) {
      case SubModule.dashboard:
        return MainModule.dashboard;

      // All these now clearly fall under Employee Profile
      case SubModule.employeeProfile:
      case SubModule.manageOnboarding:
      case SubModule.profileRecruitment:
      case SubModule.profileRetirement:
        return MainModule.employeeProfile;

      case SubModule.leaveManagement:
        return MainModule.leaveManagement;
      // Add other cases as you expand features
    }
  }

  String get title {
    switch (this) {
      case SubModule.dashboard:
        return 'Dashboard';
      case SubModule.employeeProfile: // << UPDATED title
        return 'Employee Profile'; // More descriptive title for employee profile
      case SubModule.profileRecruitment:
        return 'Recruitment Processes';
      case SubModule.manageOnboarding:
        return 'Onboarding Management';
      case SubModule.profileRetirement:
        return 'Retirement Management';
      case SubModule.leaveManagement:
        return 'Leave Management';
      // Add other cases
    }
  }

  // This defines which widget/screen is displayed when a sub-module is selected.
  Widget get body {
    switch (this) {
      case SubModule.dashboard:
        return const DashboardPage();
      case SubModule.employeeProfile:
        return const EmployeeListScreen();
      case SubModule.profileRecruitment:
        return const VacanciesScreen();
      case SubModule.manageOnboarding:
        return const HiredCandidatesScreen();
      case SubModule.profileRetirement:
        return const RetirementPage();
      case SubModule.leaveManagement:
        return const LeaveManagementPage();
    }
  }
}
