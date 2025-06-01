import 'package:flutter/widgets.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee_profile/document_mgmt_page.dart';
import 'package:police_com/features/employee_profile/employement_detail_page.dart';
import 'package:police_com/features/employee_profile/presentation/employee_list_screen.dart';
import 'package:police_com/features/employee_profile/recruitment_page.dart';
import 'package:police_com/features/employee_profile/retirement_page.dart';
import 'package:police_com/features/leave_mgmt/leave_mgmt_page.dart';

extension SubModuleExtension on SubModule {
  MainModule get mainModule {
    switch (this) {
      case SubModule.dashboard:
        return MainModule.dashboard;

      // All these now clearly fall under Employee Profile
      case SubModule.employeeProfile:
      case SubModule.profileRecruitment:
      case SubModule.profileRetirement:
      case SubModule.profileEmploymentDetails:
      case SubModule.profileDocumentManagement:
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
        return 'Recruitment Processes'; // Made slightly more descriptive
      case SubModule.profileRetirement:
        return 'Retirement Processes'; // Made slightly more descriptive
      // case SubModule.profilePersonalInfo: // << OLD - REMOVED
      //   return 'Personal Information';
      case SubModule.profileEmploymentDetails:
        return 'View Employment Details'; // Assuming this is for viewing details
      case SubModule.profileDocumentManagement:
        return 'Manage Documents'; // Assuming this is for managing existing docs
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
      case SubModule
          .employeeProfile: // << UPDATED: Points to our multi-step admin flow
        return const EmployeeListScreen();
      case SubModule.profileRecruitment:
        return const RecruitmentPage();
      case SubModule.profileRetirement:
        return const RetirementPage();
      case SubModule.profileEmploymentDetails:
        return const EmploymentDetailsPage();
      case SubModule.profileDocumentManagement:
        return const DocumentManagementPage();
      case SubModule.leaveManagement:
        return const LeaveManagementPage();
    }
  }
}
