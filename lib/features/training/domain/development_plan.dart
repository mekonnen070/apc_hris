import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:police_com/core/enums/currency.dart';
import 'package:police_com/core/enums/development_source.dart';
import 'package:police_com/core/enums/general_status.dart';
import 'package:police_com/core/enums/training_types.dart';
import 'package:police_com/features/training/domain/training.dart';

part 'development_plan.freezed.dart';
part 'development_plan.g.dart';

@freezed
abstract class DevelopmentPlan with _$DevelopmentPlan {
  factory DevelopmentPlan({
    String? planId,
    required String planName,
    required TrainingTypes planType,
    required String planDescription,
    required double planCost,
    required double usedCost,
    required Currency planCurrency,
    required DevelopmentSource developmentSource,
    required GeneralStatus planStatus,
    String? planEntryBy,
    DateTime? planEntryDate,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<Training?> trainingList,
  }) = _DevelopmentPlan;

  factory DevelopmentPlan.fromJson(Map<String, dynamic> json) =>
      _$DevelopmentPlanFromJson(json);
}
