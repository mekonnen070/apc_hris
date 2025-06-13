import 'package:flutter/widgets.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/main_module_extension.dart';
import 'package:police_com/features/clearance/presentation/clearance_screen.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee/new_recruite/presentation/my_recruits_screen.dart';
import 'package:police_com/features/incident/presentation/incident_screen.dart';
import 'package:police_com/features/leave_mgmt/presentation/leave_screen.dart';
import 'package:police_com/features/placement/presentation/available_placements_screen.dart';
import 'package:police_com/features/profile/presentation/profile_screen.dart';
import 'package:police_com/features/promotion/presentation/promotion_screen.dart';
import 'package:police_com/features/training/presentation/available_trainings_screen.dart';
import 'package:police_com/features/transfer/presentation/request_transfer_screen.dart';
import 'package:police_com/features/verification/presentation/verification_screen.dart';

extension SubModuleExtension on SubModule {
  MainModule get mainModule {
    switch (this) {
      case SubModule.dashboard:
        return MainModule.dashboard;

      // All these now clearly fall under Employee Profile
      case SubModule.profile:
      case SubModule.newRecruit:
        return MainModule.profile;
      case SubModule.transfer:
        return MainModule.transfer;
      case SubModule.leave:
        return MainModule.leave;
      // Add other cases as you expand features
      case SubModule.training:
        return MainModule.training;
      case SubModule.placement:
        return MainModule.placement;
      case SubModule.clearance:
        return MainModule.clearance;
      case SubModule.incident:
        return MainModule.incident;
      case SubModule.promotion:
        return MainModule.promotion;
      case SubModule.verification:
        return MainModule.verification;
    }
  }

  String get title {
    switch (this) {
      case SubModule.dashboard:
        return 'Dashboard';
      case SubModule.profile:
        return 'Profile';
      case SubModule.newRecruit:
        return 'New Recruit';
      case SubModule.transfer:
        return 'Transfer';
      case SubModule.leave:
        return 'Leave';
      // Add other cases
      case SubModule.training:
        return 'Training';
      case SubModule.placement:
        return 'Placement';
      case SubModule.clearance:
        return 'Clearance';
      case SubModule.incident:
        return 'Incident';
      case SubModule.promotion:
        return 'Promotion';
      case SubModule.verification:
        return 'Verification';
    }
  }

  // This defines which widget/screen is displayed when a sub-module is selected.
  IconData get icon => mainModule.icon;

  // This defines which widget/screen is displayed when a sub-module is selected.
  Widget get body {
    switch (this) {
      case SubModule.dashboard:
        return const DashboardPage();
      case SubModule.profile:
        return const ProfileScreen();
      case SubModule.newRecruit:
        return const MyRecruitsScreen();
      case SubModule.transfer:
        return const RequestTransferScreen();
      case SubModule.leave:
        return const LeaveScreen();
      case SubModule.training:
        return const AvailableTrainingsScreen();
      case SubModule.placement:
        return const AvailablePlacementsScreen();
      case SubModule.clearance:
        return const ClearanceScreen();
      case SubModule.incident:
        return const GrievanceScreen();
      case SubModule.promotion:
        return const PromotionScreen();
      case SubModule.verification:
        return const VerificationScreen();
    }
  }
}
