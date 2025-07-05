import 'package:flutter/material.dart'; // <-- CHANGED from widgets.dart
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/main_module_extension.dart';
import 'package:police_com/features/clearance/presentation/clearance_screen.dart';
import 'package:police_com/features/dashboard/presentation/dashboard_page.dart';
import 'package:police_com/features/employee/new_recruite/presentation/my_recruits_screen.dart';
import 'package:police_com/features/leave_mgmt/presentation/leave_screen.dart';
import 'package:police_com/features/placement/presentation/placement_screen.dart';
import 'package:police_com/features/profile/presentation/profile_screen.dart';
import 'package:police_com/features/training/presentation/training_screen.dart';
import 'package:police_com/features/transfer/presentation/transfer_screen.dart';
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
      // case SubModule.incident:
      //   return MainModule.incident;
      // case SubModule.promotion:
      //   return MainModule.promotion;
      case SubModule.verification:
        return MainModule.verification;
    }
  }

  // MODIFIED: Changed from a getter to a method to access BuildContext
  String title(BuildContext context) {
    switch (this) {
      case SubModule.dashboard:
        return context.lango.dashboard; // <-- REPLACED
      case SubModule.profile:
        return context.lango.profile; // <-- REPLACED
      case SubModule.newRecruit:
        return context.lango.newRecruit; // <-- REPLACED
      case SubModule.transfer:
        return context.lango.transfer; // <-- REPLACED
      case SubModule.leave:
        return context.lango.leave; // <-- REPLACED
      case SubModule.training:
        return context.lango.training; // <-- REPLACED
      case SubModule.placement:
        return context.lango.placement; // <-- REPLACED
      case SubModule.clearance:
        return context.lango.clearance; // <-- REPLACED
      // case SubModule.incident:
      //   return context.lango.incident; // <-- REPLACED
      // case SubModule.promotion:
      //   return context.lango.promotion; // <-- REPLACED
      case SubModule.verification:
        return context.lango.verification; // <-- REPLACED
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
        return const TransferScreen();
      case SubModule.leave:
        return const LeaveScreen();
      case SubModule.training:
        return const TrainingScreen();
      case SubModule.placement:
        return const PlacementScreen();
      case SubModule.clearance:
        return const ClearanceScreen();
      // case SubModule.incident:
      //   return const IncidentScreen();
      // case SubModule.promotion:
      //   return const PromotionScreen();
      case SubModule.verification:
        return const VerificationScreen();
    }
  }
}
