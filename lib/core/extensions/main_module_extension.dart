import 'package:flutter/material.dart'; // <-- CHANGED
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED

extension MainModuleX on MainModule {
  // MODIFIED: Changed from a getter to a method to access BuildContext
  String title(BuildContext context) {
    return switch (this) {
      MainModule.dashboard => context.lango.dashboard,
      MainModule.profile => context.lango.profile,
      MainModule.transfer => context.lango.transfer,
      MainModule.leave => context.lango.leave,
      MainModule.training => context.lango.trainingAndDevelopment,
      MainModule.placement => context.lango.placementManagement,
      MainModule.clearance => context.lango.employeeClearance,
      // MainModule.incident => context.lango.incidentManagement,
      // MainModule.promotion => context.lango.promotionManagement,
      MainModule.verification => context.lango.verification,
    };
  }

  IconData get icon => switch (this) {
    MainModule.dashboard => Icons.dashboard_rounded,
    MainModule.profile => Icons.people_alt_rounded,
    MainModule.transfer => Icons.transfer_within_a_station_rounded,
    MainModule.leave => Icons.calendar_today_rounded,
    MainModule.training => Icons.school_rounded,
    MainModule.placement => Icons.location_city_rounded,
    MainModule.clearance => Icons.how_to_reg_rounded,
    // MainModule.incident => Icons.warning_amber_rounded,
    // MainModule.promotion => Icons.stairs_rounded,
    MainModule.verification => Icons.qr_code_rounded,
  };

  List<SubModule> get subModules => switch (this) {
    MainModule.dashboard => [SubModule.dashboard],
    MainModule.profile => [SubModule.profile, SubModule.newRecruit],
    MainModule.transfer => [SubModule.transfer],
    MainModule.leave => [SubModule.leave],
    MainModule.training => [SubModule.training],
    MainModule.placement => [SubModule.placement],
    MainModule.clearance => [SubModule.clearance],
    // MainModule.incident => [SubModule.incident],
    // MainModule.promotion => [SubModule.promotion],
    MainModule.verification => [SubModule.verification],
  };
}
