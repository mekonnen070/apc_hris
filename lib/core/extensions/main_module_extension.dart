import 'package:flutter/material.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';

extension MainModuleX on MainModule {
  String get title => switch (this) {
    MainModule.dashboard => 'Dashboard',
    MainModule.employeeProfile => 'Employee Management',
    MainModule.transfer => 'Transfer',
    MainModule.leave => 'Leave',
    MainModule.training => 'Training & Development',
    MainModule.placement => 'Placement Management',
    MainModule.clearance => 'Employee Clearance',
    MainModule.incident => 'Incident Management',
    MainModule.promotion => 'Promotion Management',
  };

  IconData get icon => switch (this) {
    MainModule.dashboard => Icons.dashboard_rounded,
    MainModule.employeeProfile => Icons.people_alt_rounded,
    MainModule.transfer => Icons.transfer_within_a_station_rounded,
    MainModule.leave => Icons.calendar_today_rounded,
    MainModule.training => Icons.school_rounded,
    MainModule.placement => Icons.location_city_rounded,
    MainModule.clearance => Icons.how_to_reg_rounded,
    MainModule.incident => Icons.warning_amber_rounded,
    MainModule.promotion => Icons.stairs_rounded,
  };

  List<SubModule> get subModules => switch (this) {
    MainModule.dashboard => [SubModule.dashboard],
    MainModule.employeeProfile => [
      SubModule.employeeProfile, // << UPDATED from profilePersonalInfo
      // Consider adding a "View/Search Employees" sub-module here as the first item
      // SubModule.viewEmployees, (e.g., leading to an employee list screen)
      SubModule.newRecruit,
    ],
    MainModule.transfer => [SubModule.transfer],
    MainModule.leave => [SubModule.leave],
    // Define sub-modules for these as they are developed
    MainModule.training => [SubModule.training],
    MainModule.placement => [SubModule.placement],
    MainModule.clearance => [SubModule.clearance],
    MainModule.incident => [SubModule.incident],
    MainModule.promotion => [SubModule.promotion],
  };
}
