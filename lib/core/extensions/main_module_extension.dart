import 'package:flutter/material.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';

extension MainModuleX on MainModule {
  /// Get the main module associated with a sub-module.
  String get title => switch (this) {
    MainModule.dashboard => 'Dashboard',
    MainModule.employeeProfile => 'Employee Profile',
    MainModule.leaveManagement => 'Leave Management',
    MainModule.training => 'Training & Development',
    MainModule.recruitment => 'Recruitment & Placement',
    MainModule.payroll => 'Payroll',
    MainModule.clearance => 'Clearance',
    MainModule.attendance => 'Attendance',
    MainModule.settings => 'Settings',
  };

  /// Get the icon associated with the main module.
  IconData get icon => switch (this) {
    MainModule.dashboard => Icons.dashboard,
    MainModule.employeeProfile => Icons.person,
    MainModule.leaveManagement => Icons.calendar_today,
    MainModule.training => Icons.school,
    MainModule.recruitment => Icons.work,
    MainModule.payroll => Icons.attach_money,
    MainModule.clearance => Icons.check_circle,
    MainModule.attendance => Icons.access_time,
    MainModule.settings => Icons.settings,
  };

  /// List of sub-modules associated with the main module.
  List<SubModule> get subModules => switch (this) {
    MainModule.dashboard => [SubModule.dashboard],
    MainModule.employeeProfile => [
      SubModule.profileRecruitment,
      SubModule.profileRetirement,
      SubModule.profilePersonalInfo,
      SubModule.profileEmploymentDetails,
      SubModule.profileDocumentManagement,
    ],
    MainModule.leaveManagement => [SubModule.leaveManagement],
    MainModule.training => [],
    MainModule.recruitment => [],
    MainModule.payroll => [],
    MainModule.clearance => [],
    MainModule.attendance => [],
    MainModule.settings => [],
  };
}
