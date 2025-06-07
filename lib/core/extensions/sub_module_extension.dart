import 'package:flutter/widgets.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee/new_recruite/presentation/my_recruits_screen.dart';
import 'package:police_com/features/leave_mgmt/presentation/leave_screen.dart';
import 'package:police_com/features/placement/presentation/available_placements_screen.dart';
import 'package:police_com/features/training/presentation/available_trainings_screen.dart';
import 'package:police_com/features/transfer/presentation/my_transfer_requests_screen.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_screen.dart';

extension SubModuleExtension on SubModule {
  MainModule get mainModule {
    switch (this) {
      case SubModule.dashboard:
        return MainModule.dashboard;

      // All these now clearly fall under Employee Profile
      case SubModule.employeeProfile:
      case SubModule.newRecruit:
        return MainModule.employeeProfile;
      case SubModule.requestNewTransfer: // New case
      case SubModule.viewMyTransferRequests: // New case
        return MainModule.transfer;
      case SubModule.leaveManagement:
        return MainModule.leaveManagement;
      // Add other cases as you expand features
      case SubModule.training:
        return MainModule.training;
      case SubModule.placement:
        return MainModule.placement;
    }
  }

  String get title {
    switch (this) {
      case SubModule.dashboard:
        return 'Dashboard';
      case SubModule.employeeProfile: // << UPDATED title
        return 'Employee Profile'; // More descriptive title for employee profile
      case SubModule.newRecruit:
        return 'New Recruit';
      case SubModule.requestNewTransfer: // New case
        return 'Request New Transfer';
      case SubModule.viewMyTransferRequests: // New case
        return 'My Transfer Requests';
      case SubModule.leaveManagement:
        return 'Leave Management';
      // Add other cases
      case SubModule.training:
        return 'Training';
      case SubModule.placement:
        return 'Placement';
    }
  }

  // This defines which widget/screen is displayed when a sub-module is selected.
  Widget get body {
    switch (this) {
      case SubModule.dashboard:
        return const DashboardPage();
      case SubModule.employeeProfile:
      // return const EmployeeListScreen();
      case SubModule.newRecruit:
        return const MyRecruitsScreen();
      case SubModule.requestNewTransfer: // New case
        return const RequestTransferScreen();
      case SubModule.viewMyTransferRequests: // New case
        return const MyTransferRequestsScreen();
      case SubModule.leaveManagement:
        return const LeaveScreen();
      case SubModule.training:
        return const AvailableTrainingsScreen();
      case SubModule.placement:
        return const AvailablePlacementsScreen();
    }
  }
}
