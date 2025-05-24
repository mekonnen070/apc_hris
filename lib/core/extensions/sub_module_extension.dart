import 'package:flutter/widgets.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee_profile/document_mgmt_page.dart';
import 'package:police_com/features/employee_profile/employement_detail_page.dart';
import 'package:police_com/features/employee_profile/personal_info_view_page.dart';
import 'package:police_com/features/employee_profile/recruitment_page.dart';
import 'package:police_com/features/employee_profile/retirement_page.dart';
import 'package:police_com/features/leave_mgmt/leave_mgmt_page.dart';

extension SubModuleExtension on SubModule {
  // Associate each sub-module with its main module.
  MainModule get mainModule {
    switch (this) {
      case SubModule.dashboard:
        return MainModule.dashboard;
      case SubModule.profileRecruitment:
      case SubModule.profileRetirement:
      case SubModule.profilePersonalInfo:
      case SubModule.profileEmploymentDetails:
      case SubModule.profileDocumentManagement:
        return MainModule.employeeProfile;
      case SubModule.leaveManagement:
        return MainModule.leaveManagement;
    }
  }

  // Provide a display title for each sub-module.
  String get title {
    switch (this) {
      case SubModule.dashboard:
        return 'Dashboard';
      case SubModule.profileRecruitment:
        return 'Recruitment';
      case SubModule.profileRetirement:
        return 'Retirement';
      case SubModule.profilePersonalInfo:
        return 'Personal Information';
      case SubModule.profileEmploymentDetails:
        return 'Employment Details';
      case SubModule.profileDocumentManagement:
        return 'Document Management';
      case SubModule.leaveManagement:
        return 'Leave Management';
    }
  }

  Widget get body {
    switch (this) {
      case SubModule.dashboard:
        return DashboardPage();
      case SubModule.profileRecruitment:
        return const RecruitmentPage();
      case SubModule.profileRetirement:
        return const RetirementPage();
      case SubModule.profilePersonalInfo:
        return const PersonalInformationViewPage();
      case SubModule.profileEmploymentDetails:
        return EmploymentDetailsPage();
      case SubModule.profileDocumentManagement:
        return DocumentManagementPage();
      case SubModule.leaveManagement:
        return LeaveManagementPage();
    }
  }
}
