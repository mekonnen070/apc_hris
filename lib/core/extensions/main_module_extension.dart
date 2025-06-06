import 'package:flutter/material.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';

extension MainModuleX on MainModule {
  String get title => switch (this) {
    MainModule.dashboard => 'Dashboard',
    MainModule.employeeProfile => 'Employee Management',
    MainModule.transfer => 'Transfer Management',
    MainModule.leaveManagement => 'Leave Management',
    MainModule.training => 'Training & Development',
    MainModule.payroll => 'Payroll Processing',
    MainModule.clearance => 'Employee Clearance',
    MainModule.settings => 'System Settings',
  };

  IconData get icon => switch (this) {
    MainModule.dashboard => Icons.dashboard_rounded,
    MainModule.employeeProfile => Icons.people_alt_rounded,
    MainModule.transfer => Icons.transfer_within_a_station_rounded,
    MainModule.leaveManagement => Icons.calendar_today_rounded,
    MainModule.training => Icons.school_rounded,
    MainModule.payroll => Icons.monetization_on_rounded,
    MainModule.clearance => Icons.how_to_reg_rounded,
    MainModule.settings => Icons.settings_rounded,
  };

  List<SubModule> get subModules => switch (this) {
    MainModule.dashboard => [SubModule.dashboard],
    MainModule.employeeProfile => [
      SubModule.employeeProfile, // << UPDATED from profilePersonalInfo
      // Consider adding a "View/Search Employees" sub-module here as the first item
      // SubModule.viewEmployees, (e.g., leading to an employee list screen)
      SubModule.newRecruit,
    ],
    MainModule.transfer => [
      SubModule.requestNewTransfer,
      SubModule.viewMyTransferRequests,
    ],
    MainModule.leaveManagement => [
      // If Leave Management is a single page, or has its own sub-modules
      SubModule.leaveManagement, // Example: direct link if only one screen
      // Or: SubModule.requestLeave, SubModule.approveLeave etc.
    ],
    // Define sub-modules for these as they are developed
    MainModule.training => [],
    MainModule.payroll => [],
    MainModule.clearance => [],
    MainModule.settings => [],
  };
}
